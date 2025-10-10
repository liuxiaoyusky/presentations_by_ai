<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'The Core Equation'
const formula = 'Model Performance = LLM × (Tools + Prompt)'
const description = 'Prompts stay the highest leverage input because they cost nothing, iterate fast, and change outcomes immediately.'
const parts = [
  { title: 'LLM', description: 'Hosted models (ChatGPT, Gemini, DeepSeek, Grok) provide the capability ceiling.' },
  { title: 'Tools', description: 'Plugins, APIs, or automations give the model fresh context and the ability to act.' },
  { title: 'Prompt', description: 'Clear instructions steer the model toward the result you actually need.' }
]
const tip = 'Many MVPs ship with hosted APIs + prompt design + retrieval (RAG).'
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
      <p class="mt-4 text-slate-700 text-3xl md:text-4xl font-black">{{ formula }}</p>
      <p class="mt-4 text-slate-700 text-xl md:text-2xl">{{ description }}</p>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
      <article v-for="item in parts" :key="item.title" class="bg-white/70 backdrop-blur-md border border-slate-200/30 rounded-3xl shadow-xl p-7 md:p-9">
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">{{ item.title }}</h3>
        <p class="mt-4 text-base md:text-lg text-slate-600">{{ item.description }}</p>
      </article>
    </div>

    <p class="mt-6 inline-flex items-center gap-2 rounded-full border border-white/40 bg-white/60 px-4 py-2 text-slate-700 backdrop-blur">{{ tip }}</p>
  </section>
</template>

<style scoped>
/* Tailwind utilities drive layout; no extra CSS needed */
</style>
