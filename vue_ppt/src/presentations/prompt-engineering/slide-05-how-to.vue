<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const title = 'How to Write Good Prompts'
const keyInsight = 'Good prompts are tuned, not born.'
const notes = [
  'Domain expertise matters',
  "If a coworker doesn't understand your prompt, the AI probably won't either"
]
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        {{ title }}
      </h2>
    </div>

    <div class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <p class="text-xl md:text-2xl font-semibold text-slate-900">Key Insight</p>
      <p class="mt-2 text-slate-700">{{ keyInsight }}</p>
      <div class="mt-6">
        <p class="text-sm uppercase tracking-[0.22em] text-slate-600">Important Notes</p>
        <ul class="mt-2 list-disc pl-6 text-slate-700">
          <li v-for="line in notes" :key="line">{{ line }}</li>
        </ul>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities drive layout */
</style>
