<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        1.5.2 Technical Project Manager
      </h2>
      <p class="mt-3 text-slate-700 text-lg md:text-xl">First-principles analysis for IT/software projects with structured technical planning. See 2.2 Co-STAR Framework for comprehensive breakdown.</p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
      <article class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Sample Input</h3>
        <pre class="mt-3 whitespace-pre-wrap text-slate-800 text-sm md:text-base">We need to build a customer feedback system that collects reviews, analyzes sentiment, 
and generates reports for our e-commerce platform. The system should handle 10,000+ 
reviews per day and integrate with our existing CRM.</pre>
      </article>
      <article class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Sample Output</h3>
        <pre class="mt-3 whitespace-pre-wrap text-slate-800 text-sm md:text-base">1. **Task Summary:** Build a scalable customer feedback analysis system for e-commerce platform

2. **Core Problem / Goal:** Collect, process, and analyze customer reviews to generate actionable insights

3. **First Principles Breakdown:**
   - Data collection (reviews) → Processing (sentiment analysis) → Output (reports)
   - Scale requirement: 10,000+ reviews/day
   - Integration requirement: Existing CRM system

4. **Minimum Viable Components:**
   - Review collection API
   - Sentiment analysis engine
   - Report generation service
   - CRM integration layer

5. **Technical To-Do / Staged Plan:**
   - **Stage 1: Foundation** — API design, database schema, basic collection
   - **Stage 2: Processing** — Sentiment analysis integration, data pipeline
   - **Stage 3: Intelligence** — Report generation, CRM integration, monitoring

6. **Key Success Metrics:**
   - Processing capacity: 10,000+ reviews/day
   - Accuracy: 95%+ sentiment classification
   - Response time: <2 seconds for report generation
   - Uptime: 99.9% availability</pre>
      </article>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
