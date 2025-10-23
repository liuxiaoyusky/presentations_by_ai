<script setup lang="ts">
import { ref } from 'vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const title = '2.2.2 CO·STAR Prompt Example'

type TabId = 'c' | 'o' | 's' | 't' | 'a' | 'r'
const tabs: { id: TabId; label: string }[] = [
  { id: 'c', label: 'C — Context' },
  { id: 'o', label: 'O — Objective' },
  { id: 's', label: 'S — Style' },
  { id: 't', label: 'T — Tone' },
  { id: 'a', label: 'A — Audience' },
  { id: 'r', label: 'R — Response' }
]
const active = ref<TabId>('c')
</script>

<template>
  <section class="container mx-auto max-w-6xl px-6 md:px-8 lg:px-12 py-12 lg:py-16">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
      {{ title }}
    </h2>
    <p class="mt-2 text-slate-600">Let's make a technical project analyzer using CO·STAR framework.</p>

    <div class="mt-5 flex flex-wrap items-center gap-2">
      <button
        v-for="tab in tabs"
        :key="tab.id"
        @click="active = tab.id"
        class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/60 border border-white/40 backdrop-blur-md shadow-sm text-slate-800 transition hover:bg-white/70"
        :class="{ 'bg-gradient-to-r from-indigo-500/20 to-emerald-400/20': active === tab.id }"
        type="button"
      >
        {{ tab.label }}
      </button>
    </div>

    <div class="mt-6 rounded-3xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <Transition name="fade" mode="out-in">
        <div :key="active" class="min-h-[260px] md:min-h-[300px] max-h-[55vh] overflow-auto">
          <div v-if="active === 'c'" class="space-y-3 text-slate-800">
            <h3 class="text-2xl md:text-3xl font-bold">C — Context</h3>
            <p class="text-base md:text-lg">
              You are a Technical Project Manager and System Thinker using first-principles reasoning to analyze IT/software
              projects and rebuild them into efficient, staged engineering plans.
            </p>
          </div>

          <div v-else-if="active === 'o'" class="space-y-3 text-slate-800">
            <h3 class="text-2xl md:text-3xl font-bold">O — Objective</h3>
            <ul class="list-disc pl-5 space-y-2 text-base md:text-lg">
              <li>Clarify unclear goals (max 3 short questions).</li>
              <li>Identify core truths, define Minimum Viable Components (MVC).</li>
              <li>Produce a phased plan with dependencies, risks, tools, and metrics.</li>
            </ul>
          </div>

          <div v-else-if="active === 's'" class="space-y-3 text-slate-800">
            <h3 class="text-2xl md:text-3xl font-bold">S — Style</h3>
            <p class="text-base md:text-lg">Analytical, concise, Elon-Musk-style first-principles reasoning.</p>
          </div>

          <div v-else-if="active === 't'" class="space-y-3 text-slate-800">
            <h3 class="text-2xl md:text-3xl font-bold">T — Tone</h3>
            <p class="text-base md:text-lg">Professional, decisive, solution-driven.</p>
          </div>

          <div v-else-if="active === 'a'" class="space-y-3 text-slate-800">
            <h3 class="text-2xl md:text-3xl font-bold">A — Audience</h3>
            <p class="text-base md:text-lg">Engineers, tech leads, and PMs executing the plan.</p>
          </div>

          <div v-else class="space-y-3 text-slate-800">
            <h3 class="text-2xl md:text-3xl font-bold">R — Response</h3>
            <p class="text-base md:text-lg">Output a numbered list:</p>
            <ol class="list-decimal pl-5 space-y-2 text-base md:text-lg">
              <li>Task Summary</li>
              <li>Core Problem / Goal</li>
              <li>First Principles Breakdown</li>
              <li>Minimum Viable Components</li>
              <li>Staged Plan (Stages 1–N → Tasks / Dependencies / Risks / Tools)</li>
              <li>Key Success Metrics</li>
            </ol>
          </div>
        </div>
      </Transition>
    </div>
  </section>
</template>

<style scoped>
/* Subtle fade transition for tab content, mirrors template minimalism */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 180ms ease-in-out;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
