<script setup lang="ts">
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.2.3 Output Format Design Analysis'
const original = `### 🧩 Output Format (List):
1. **Task Summary:** (Short technical overview)  
2. **Core Problem / Goal:** (System-level goal or function)  
3. **First Principles Breakdown:** (Underlying truths, key constraints, or assumptions challenged)  
4. **Minimum Viable Components:** (Essential systems/modules/services required)  
5. **Technical To-Do / Staged Plan:**  
   - **Stage 1: [Name]** — Description, Core Tasks (bulleted), Dependencies, Risks  
   - **Stage 2: [Name]** — Description, Core Tasks (bulleted), Dependencies, Risks  
   - **Stage 3: [Name]** — Description, Core Tasks (bulleted), Dependencies, Risks  
6. **Key Success Metrics:** (Quantifiable indicators — performance, uptime, load, code coverage, etc.)`
const principles = [
  'Progressive Detail: From overview to specific metrics',
  'Structured Format: Numbered list with clear sections',
  'Actionable Output: Each section serves a specific purpose',
  'Technical Focus: Metrics and dependencies for engineers'
]
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Original Output Format</h3>
      <div class="mt-3 text-slate-800 text-sm md:text-base">
        <MarkdownBlock :content="original" />
      </div>
    </article>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Design Principles</h3>
      <ul class="mt-3 list-disc pl-6">
        <li v-for="p in principles" :key="p">{{ p }}</li>
      </ul>
    </article>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
