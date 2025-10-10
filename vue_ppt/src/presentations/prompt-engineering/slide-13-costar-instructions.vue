<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.2.2 Instructions Structure Analysis'
const original = `### 🧭 Instructions:
1. **Read the given background or task.**  
   - If the goal, scope, or deliverables are **unclear**, ask up to **three short clarifying questions** before starting.  
   - Wait for confirmation before continuing.  
2. Once clear, **apply first principles reasoning** to identify what must exist for the solution to function.  
3. Define the **Minimum Viable Components (MVC)** — only the features or systems that deliver tangible technical value.  
4. Decompose the project into **technical tasks and stages** (e.g., architecture, backend, frontend, testing, deployment).  
5. Add **dependencies, risks, tools, and metrics** for each stage.  
6. Output the final result **as a numbered list** for a technical audience.`
const breakdown = 'Step 1: Input validation + clarification protocol — Step 2: Core methodology — Step 3: Essential components identification — Step 4: Project decomposition — Step 5: Risk and dependency analysis — Step 6: Output formatting specification'
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Original Instructions</h3>
      <pre class="mt-3 whitespace-pre-wrap text-slate-800 text-sm md:text-base">{{ original }}</pre>
    </article>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Structure Breakdown</h3>
      <p class="mt-3 text-slate-700">{{ breakdown }}</p>
    </article>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
