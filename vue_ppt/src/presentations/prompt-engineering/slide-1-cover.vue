<script setup lang="ts">
import { computed } from 'vue'

import { useDeckI18n } from '../../shared/i18n/use-deck-i18n'
import { usePresentationContext } from '../../shared/presentation/presentation-context'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const presentationContext = usePresentationContext()

const { t } = useDeckI18n('prompt-engineering', {
  locale: computed(() => presentationContext.state.locale),
  fallbackLocale: 'en'
})
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="relative overflow-hidden rounded-3xl border border-white/20 bg-white/70 backdrop-blur-md shadow-2xl">
      <!-- soft animated gradient backdrop (non-blocking) -->
      <div class="absolute inset-0 -z-0 opacity-70 pointer-events-none">
        <svg class="h-full w-full" viewBox="0 0 800 600" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <defs>
            <linearGradient id="pe-g1" x1="0" y1="0" x2="1" y2="1">
              <stop offset="0%" stop-color="#93AD90"/>
              <stop offset="50%" stop-color="#F79A8C"/>
              <stop offset="100%" stop-color="#F4CDA5"/>
            </linearGradient>
            <filter id="pe-blur" filterUnits="userSpaceOnUse" x="-200" y="-200" width="1200" height="1000">
              <feGaussianBlur stdDeviation="60" edgeMode="duplicate" />
            </filter>
          </defs>
          <g filter="url(#pe-blur)">
            <circle cx="150" cy="120" r="120" fill="url(#pe-g1)">
              <animate attributeName="cx" values="120;680;120" dur="22s" repeatCount="indefinite"/>
              <animate attributeName="cy" values="90;520;90" dur="26s" repeatCount="indefinite"/>
            </circle>
            <circle cx="650" cy="480" r="140" fill="url(#pe-g1)" opacity="0.8">
              <animate attributeName="cx" values="700;120;700" dur="24s" repeatCount="indefinite"/>
              <animate attributeName="cy" values="510;120;510" dur="20s" repeatCount="indefinite"/>
            </circle>
          </g>
        </svg>
      </div>

      <div class="relative z-10 grid place-items-center px-6 py-12 md:py-16">
        <div class="text-center">
          <span class="inline-flex items-center gap-2 rounded-full border border-white/40 bg-white/60 px-4 py-1.5 text-slate-700 backdrop-blur">
            {{ t('slides.cover.kicker') }}
          </span>
          <h1 class="mt-4 text-6xl md:text-8xl font-black tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
            {{ t('slides.cover.title') }}
          </h1>
          <p class="mt-5 text-xl md:text-3xl text-slate-700">
            {{ t('slides.cover.subtitle') }}
          </p>
          <p class="mt-3 text-base md:text-lg text-slate-600">
            {{ t('slides.cover.footnote') }}
          </p>
        </div>
      </div>
    </div>
  </section>
  
</template>

<style scoped>
/* Tailwind utilities used; no scoped CSS necessary beyond defaults */

.title-block {
  position: relative;
  max-width: min(92vw, 1180px);
  width: 100%;
  padding: clamp(2.6rem, 6vw, 4.6rem) clamp(2.8rem, 6.5vw, 5.2rem);
  border-radius: clamp(2rem, 4vw, 3rem);
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.94), rgba(248, 250, 252, 0.78));
  box-shadow: 0 40px 90px rgba(15, 23, 42, 0.16);
  overflow: hidden;
}

.title-block::before,
.title-block::after {
  content: '';
  position: absolute;
  pointer-events: none;
}

.title-block::before {
  inset: -55% 35% 40% -45%;
  background: linear-gradient(120deg, rgba(252, 165, 165, 0.42), rgba(252, 165, 165, 0));
  transform: rotate(-6deg);
}

.title-block::after {
  inset: 20% -30% -45% 55%;
  background: radial-gradient(60% 80% at 50% 50%, rgba(15, 23, 42, 0.12), transparent 75%);
  transform: rotate(8deg);
  mix-blend-mode: multiply;
}

.title-frame {
  position: relative;
  display: grid;
  grid-template-columns: minmax(3rem, clamp(3.8rem, 5.8vw, 5.6rem)) 1fr;
  column-gap: clamp(1.5rem, 3.2vw, 3rem);
  align-items: center;
  z-index: 1;
}

.title-vertical {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: clamp(0.5rem, 1vw, 0.8rem);
  text-transform: uppercase;
  font-weight: 700;
  color: rgba(15, 23, 42, 0.7);
}

.vertical-pill {
  display: flex;
  flex-direction: column;
  padding: clamp(0.6rem, 1.2vw, 1rem) clamp(0.45rem, 0.9vw, 0.75rem);
  border-radius: clamp(0.6rem, 1.2vw, 1rem);
  background: linear-gradient(135deg, rgba(15, 23, 42, 0.92), rgba(30, 41, 59, 0.88));
  box-shadow: 0 10px 28px rgba(15, 23, 42, 0.28);
  color: #fff;
  letter-spacing: 0.18em;
  font-size: clamp(1.1rem, 2.8vw, 1.8rem);
}

.vertical-pill-char {
  display: block;
}

.vertical-caption {
  letter-spacing: 0.4em;
  font-size: clamp(0.65rem, 1.2vw, 0.8rem);
  color: rgba(15, 23, 42, 0.5);
}

.title-content {
  display: flex;
  flex-direction: column;
  gap: clamp(0.9rem, 2vw, 1.8rem);
  color: rgba(15, 23, 42, 0.92);
}

.kicker {
  display: inline-flex;
  align-items: center;
  gap: 0.6rem;
  padding: 0.35rem 0.9rem;
  border-radius: 9999px;
  background: rgba(15, 23, 42, 0.08);
  font-size: clamp(0.75rem, 1.4vw, 0.9rem);
  letter-spacing: 0.35em;
  text-transform: uppercase;
  color: rgba(15, 23, 42, 0.6);
}

h1 {
  margin: 0;
  font-size: clamp(2.6rem, 6.5vw, 4.4rem);
  font-weight: 800;
  letter-spacing: -0.025em;
  line-height: 1.08;
}

.highlight {
  display: block;
  font-size: clamp(1.1rem, 2.6vw, 1.6rem);
  margin-top: clamp(0.35rem, 0.9vw, 0.6rem);
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: rgba(59, 130, 246, 0.9);
}

.subtitle {
  margin: 0;
  font-size: clamp(1rem, 2.4vw, 1.45rem);
  color: rgba(30, 41, 59, 0.78);
}

.footnote {
  margin: 0;
  font-size: clamp(0.9rem, 1.9vw, 1.1rem);
  color: rgba(30, 41, 59, 0.6);
}

@media (max-width: 720px) {
  .title-frame {
    grid-template-columns: 1fr;
    text-align: center;
  }

  .title-vertical {
    order: -1;
    flex-direction: row;
    gap: 0.75rem;
  }

  .vertical-pill {
    flex-direction: row;
    gap: 0.6rem;
  }

  .highlight {
    font-size: clamp(1rem, 4vw, 1.3rem);
  }
}
</style>
