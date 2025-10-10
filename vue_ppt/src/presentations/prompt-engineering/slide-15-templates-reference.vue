<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.3 Reference and Adapt Website Prompts'
const sources = [
  'GitHub: awesome-chatgpt-prompts — 1000+ curated prompts',
  'OpenAI Cookbook: Prompt Engineering Examples — Official examples',
  'Jimeng: AI Tool Home — Image generation platform'
]
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <p class="mt-3 text-slate-700 text-lg md:text-xl">Learn from existing prompts and adapt them for your specific needs.</p>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Popular Sources</h3>
      <ul class="mt-3 list-disc pl-6">
        <li v-for="s in sources" :key="s">{{ s }}</li>
      </ul>
      <p class="mt-4 text-slate-700">Example (live demo)</p>
    </article>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
