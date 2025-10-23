<script setup lang="ts">
import { ref, watch } from 'vue'

const props = defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const reveal = ref(false)

// When slide becomes active, start from stage 1 (thanks only)
watch(() => props.isActive, (v) => { if (v) reveal.value = false })

const showDetails = () => { reveal.value = true }
</script>

<template>
  <section class="slide-shell" @click="!reveal && showDetails()" role="button" :aria-pressed="reveal ? 'true' : 'false'">
    <div class="title-wrap">
      <Transition name="fade-scale" mode="out-in">
        <div v-if="!reveal" key="stage1">
          <h2 class="headline">Thanks for watching.</h2>
        </div>
        <div v-else key="stage2">
          <h2 class="headline">
            This PPT is <span class="keyword">entirely AI-generated</span>.
          </h2>
          <h2 class="headline sub">
            I hereby confirm that I have <span class="keyword-alt">not</span>
            written any code manually <span class="keyword-alt">nor</span>
            adjusted any page content manually.
          </h2>
        </div>
      </Transition>
    </div>
  </section>
</template>

<style scoped>
.slide-shell {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  width: 100%;
  padding: clamp(2rem, 5vw, 6rem);
  background: radial-gradient(circle at 50% 30%, rgba(99, 102, 241, 0.08), transparent 55%),
    radial-gradient(circle at 20% 70%, rgba(14, 165, 233, 0.05), transparent 60%);
}

.title-wrap {
  text-align: center;
  max-width: 1000px;
}

.headline {
  margin: 0 0 0.65em 0;
  font-size: clamp(3rem, 8vw, 6rem);
  font-weight: 800;
  letter-spacing: -0.02em;
  line-height: 1.04;
  color: rgba(15, 23, 42, 0.92);
}

.headline.sub {
  margin-top: 0.2em;
  font-size: clamp(1.8rem, 4.8vw, 3.2rem);
}

.statement {
  margin: 0 auto;
  font-size: clamp(1.1rem, 2.4vw, 1.6rem);
  line-height: 1.6;
  color: rgba(15, 23, 42, 0.8);
}

.keyword {
  display: inline-block;
  font-weight: 900;
  letter-spacing: -0.01em;
  background: linear-gradient(120deg, #6366f1, #d946ef, #34d399);
  background-size: 200% 200%;
  color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
  animation: keyword-shift 6s ease-in-out infinite;
}

.keyword-alt {
  display: inline-block;
  font-weight: 900;
  background: linear-gradient(120deg, #34d399, #22d3ee, #a855f7);
  background-size: 200% 200%;
  color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
  animation: keyword-shift 6s ease-in-out infinite;
}

@keyframes keyword-shift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* reveal transitions */
.fade-scale-enter-active,
.fade-scale-leave-active { transition: opacity 260ms ease, transform 320ms ease; }
.fade-scale-enter-from,
.fade-scale-leave-to { opacity: 0; transform: translateY(8px) scale(0.98); }
</style>
