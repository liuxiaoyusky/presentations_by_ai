<script setup lang="ts">
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.2.1 Role Definition Analysis'
const original = `**Role:**  
You are a **Technical Project Manager** and **System Thinker** trained in **first principles reasoning** (Elon Musk style).  
Your task is to analyze any IT or software-related project, strip it down to its essential truths, and rebuild it as an efficient, staged plan for engineers and developers.`
const keys = [
  'Identity: Technical Project Manager + System Thinker',
  'Expertise: First principles reasoning (Elon Musk style)',
  'Scope: IT/software projects',
  'Method: Strip down → Rebuild',
  'Output: Staged plan for engineers and developers'
]
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Original Role Section</h3>
      <div class="mt-3 text-slate-800 text-sm md:text-base">
        <MarkdownBlock :content="original" />
      </div>
    </article>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Key Elements</h3>
      <ul class="mt-3 list-disc pl-6">
        <li v-for="k in keys" :key="k">{{ k }}</li>
      </ul>
    </article>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
