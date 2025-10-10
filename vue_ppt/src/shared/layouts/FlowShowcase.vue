<template>
  <section class="flow-showcase">
    <div v-if="isActive && overlay" class="bg-overlay" aria-hidden="true"></div>

    <header class="flow-track">
      <div class="flow-frame">
        <div v-for="(step, index) in steps" :key="index" class="flow-segment">
          <button
            class="flow-node"
            type="button"
            :class="{ active: activeIndex === index }"
            @click="setActive(index)"
          >
            <span class="flow-number">{{ step.id ?? index + 1 }}</span>
            <span class="flow-label">{{ step.title }}</span>
          </button>
          <div v-if="index < steps.length - 1" class="flow-connector" aria-hidden="true">
            <svg viewBox="0 0 120 36" xmlns="http://www.w3.org/2000/svg">
              <path d="M5 18 H85" stroke="rgba(126, 153, 240, 0.45)" stroke-width="6" stroke-linecap="round" />
              <path d="M72 8 L110 18 L72 28 Z" :fill="`url(#arrowGradient${index})`" />
              <defs>
                <linearGradient :id="`arrowGradient${index}`" x1="72" y1="18" x2="110" y2="18" gradientUnits="userSpaceOnUse">
                  <stop offset="0%" stop-color="rgba(67, 97, 238, 0.8)" />
                  <stop offset="100%" stop-color="rgba(14, 165, 233, 0.75)" />
                </linearGradient>
              </defs>
            </svg>
          </div>
        </div>
      </div>
    </header>

    <div class="carousel" role="region" aria-live="polite">
      <div
        v-for="(_, index) in steps"
        :key="`panel-${index}`"
        class="carousel-item"
        :class="carouselStates[index]"
      >
        <article class="panel">
          <SlotRenderer :render-fn="parentSlots[`panel${index}`]" />
        </article>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { computed, defineComponent, ref, watch, useSlots } from 'vue'

type Step = { id?: number | string; title: string }

const props = withDefaults(defineProps<{
  steps: Step[]
  isActive?: boolean
  initialIndex?: number
  overlay?: boolean
}>(), {
  isActive: false,
  initialIndex: 0,
  overlay: true
})

const emit = defineEmits<{ (e: 'update:index', value: number): void }>()

const activeIndex = ref(props.initialIndex)
watch(() => props.initialIndex, (val) => { if (typeof val === 'number') activeIndex.value = val })

const setActive = (index: number) => {
  activeIndex.value = index
  emit('update:index', index)
}

const carouselStates = computed(() => {
  const total = props.steps.length
  return props.steps.map((_, index) => {
    const relative = (index - activeIndex.value + total) % total
    if (relative === 0) return 'is-active'
    if (relative === 1) return 'is-next'
    if (relative === total - 1) return 'is-prev'
    return ''
  })
})

const parentSlots = useSlots()

const SlotRenderer = defineComponent({
  name: 'SlotRenderer',
  props: { renderFn: { type: Function, required: false } },
  setup(props) {
    return () => (props.renderFn ? (props.renderFn as any)() : null)
  }
})
</script>

<style scoped>
.flow-showcase { position: relative; }
.bg-overlay {
  position: fixed;
  inset: 0;
  z-index: 0;
  background: rgba(15, 23, 42, 0.32);
  backdrop-filter: blur(18px) saturate(0.9);
}

.flow-track { width: min(100%, 1080px); display: flex; justify-content: center; position: relative; z-index: 1; }
.flow-frame {
  flex: 1; display: flex; align-items: center; justify-content: space-between;
  gap: clamp(0.8rem, 2.5vw, 1.6rem);
  padding: clamp(0.9rem, 3vw, 1.3rem) clamp(1.4rem, 4vw, 2.8rem);
  border-radius: clamp(36px, 8vw, 64px);
  background:
    radial-gradient(circle at 12% 20%, rgba(79, 70, 229, 0.18), transparent 55%),
    radial-gradient(circle at 88% 80%, rgba(236, 72, 153, 0.12), transparent 60%),
    linear-gradient(110deg, rgba(248, 250, 252, 0.86), rgba(255, 255, 255, 0.9));
  box-shadow: inset 0 0 0 1px rgba(148, 163, 184, 0.12), 0 24px 52px rgba(15, 23, 42, 0.08);
}
.flow-segment { display: flex; align-items: center; gap: clamp(0.6rem, 2vw, 1.2rem); }
.flow-node {
  position: relative; display: flex; align-items: center; gap: 0.55rem;
  min-width: clamp(120px, 20vw, 180px);
  padding: clamp(0.85rem, 2.2vw, 1.2rem) clamp(1rem, 2.8vw, 1.6rem);
  border: none; border-radius: 999px; background: rgba(255, 255, 255, 0.88);
  color: #0f172a; font-size: clamp(0.9rem, 2vw, 1.05rem); font-weight: 600; letter-spacing: 0.01em;
  cursor: pointer; transition: transform 280ms ease, box-shadow 280ms ease, background 280ms ease, color 280ms ease;
  box-shadow: 0 12px 28px rgba(15, 23, 42, 0.08);
}
.flow-node:hover { transform: translateY(-3px); }
.flow-node.active { box-shadow: 0 20px 50px rgba(79, 70, 229, 0.28); }
.flow-number {
  display: inline-flex; align-items: center; justify-content: center; width: 1.9rem; height: 1.9rem;
  border-radius: 999px; background: rgba(15, 23, 42, 0.08); font-size: 0.95em; font-weight: 700;
}
.flow-label { flex: 1; text-align: left; line-height: 1.3; }
.flow-connector { flex: 0 0 auto; display: flex; align-items: center; width: clamp(3rem, 6vw, 4.2rem); height: clamp(1.4rem, 3.5vw, 2.1rem); }
.flow-connector svg { width: 100%; height: 100%; }

.carousel { position: relative; width: 100%; max-width: 1100px; height: clamp(420px, 64vh, 600px); margin-top: clamp(1.5rem, 4vw, 2.2rem); perspective: 1400px; z-index: 1; }
.carousel::before { content: ''; position: absolute; inset: auto; bottom: -110px; left: 50%; width: clamp(420px, 70%, 760px); height: 240px; transform: translateX(-50%); background: radial-gradient(circle, rgba(15, 23, 42, 0.22), transparent 70%); filter: blur(32px); z-index: 0; }
.carousel-item { position: absolute; inset: 0; display: flex; align-items: center; justify-content: center; transition: transform 520ms cubic-bezier(0.22, 0.61, 0.36, 1), opacity 320ms ease, filter 320ms ease; will-change: transform; }
.panel { width: clamp(360px, 88%, 960px); max-height: 100%; display: flex; flex-direction: column; overflow: hidden; border-radius: 20px; box-shadow: 0 50px 100px rgba(15, 23, 42, 0.28); border: 1px solid rgba(148, 163, 184, 0.22); background: #ffffff; padding: clamp(1rem, 3vw, 1.5rem); }
.panel :deep(.markdown-body) { flex: 1 1 auto; min-height: 0; overflow: auto; }

.carousel-item.is-active { z-index: 3; transform: translateX(0) translateZ(120px) rotateY(0deg); filter: none; }
.carousel-item.is-next { z-index: 2; transform: translateX(280px) translateZ(-200px) rotateY(-18deg) scale(0.9); filter: blur(10px) brightness(0.55) saturate(0.8); opacity: 0.38; pointer-events: none; }
.carousel-item.is-prev { z-index: 1; transform: translateX(-280px) translateZ(-220px) rotateY(18deg) scale(0.88); filter: blur(12px) brightness(0.5) saturate(0.75); opacity: 0.35; pointer-events: none; }

@media (max-width: 900px) {
  .flow-frame { flex-direction: column; align-items: stretch; gap: 0.85rem; border-radius: 32px; }
  .flow-node { border-radius: 16px; padding: 1rem 1.2rem; }
  .flow-number { width: 2rem; height: 2rem; }
  .flow-connector { display: none; }
  .carousel { height: clamp(360px, 60vh, 520px); }
  .carousel-item.is-next { transform: translateX(160px) translateZ(-160px) rotateY(-16deg) scale(0.9); }
  .carousel-item.is-prev { transform: translateX(-160px) translateZ(-160px) rotateY(16deg) scale(0.9); }
}

@media (prefers-reduced-motion: reduce) { .flow-node, .carousel-item { transition-duration: 0.01ms !important; animation-duration: 0.01ms !important; } }

@media print {
  .bg-overlay { display: none !important; }
  .flow-track { display: none !important; }
  .carousel { height: auto; perspective: none; }
  .carousel::before { display: none; }
  .carousel-item { position: static; transform: none !important; filter: none !important; opacity: 1 !important; page-break-inside: avoid; break-inside: avoid; margin-bottom: 1.5rem; }
  .panel { box-shadow: none; border: 1px solid rgba(148,163,184,0.35); }
  .carousel-item + .carousel-item { page-break-before: always; break-before: page; }
}
</style>
