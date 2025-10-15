<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.2 Co-STAR Framework'
const subtitle = 'International prompt-contest winner template'
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <p class="mt-3 text-slate-700 text-lg md:text-xl">{{ subtitle }}</p>
    <div class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <p class="text-slate-700">Produce a detailed system prompt from a user's task/rough prompt using the CO‑STAR framework:</p>
      <ul class="mt-3 space-y-2 text-slate-700 text-base md:text-lg">
        <li><span class="font-semibold">Context</span> — Background, constraints, and key facts.</li>
        <li><span class="font-semibold">Objective</span> — The precise goal or desired outcome.</li>
        <li><span class="font-semibold">Style</span> — Formatting, structure, and stylistic rules.</li>
        <li><span class="font-semibold">Tone</span> — Voice and level of formality to match intent.</li>
        <li><span class="font-semibold">Audience</span> — Who the output is for and their needs.</li>
        <li><span class="font-semibold">Response</span> — Exact deliverable: format, length, criteria.</li>
      </ul>
    </div>
  </section>
  
</template>

<style scoped>
/* Tailwind utilities */
</style>
