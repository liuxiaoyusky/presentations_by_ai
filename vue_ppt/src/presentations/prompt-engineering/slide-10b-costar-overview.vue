<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.2 Co-STAR Framework'
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
      {{ title }}
    </h2>

    <div class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <div class="space-y-4">
        <div>
          <h3 class="text-xl md:text-2xl font-bold text-slate-900">C — Context</h3>
          <p class="mt-1 text-slate-700 text-lg md:text-xl">Provide background information so the model understands the scenario and keeps its response relevant.</p>
        </div>

        <div>
          <h3 class="text-xl md:text-2xl font-bold text-slate-900">O — Objective</h3>
          <p class="mt-1 text-slate-700 text-lg md:text-xl">Define exactly what task you want the model to perform — clear goals focus the output.</p>
        </div>

        <div>
          <h3 class="text-xl md:text-2xl font-bold text-slate-900">S — Style</h3>
          <p class="mt-1 text-slate-700 text-lg md:text-xl">Specify the desired writing style — e.g., analytical, journalistic, Elon Musk–style reasoning, or expert-level tone.</p>
        </div>

        <div>
          <h3 class="text-xl md:text-2xl font-bold text-slate-900">T — Tone</h3>
          <p class="mt-1 text-slate-700 text-lg md:text-xl">Set the emotional attitude — formal, empathetic, confident, humorous, etc.</p>
        </div>

        <div>
          <h3 class="text-xl md:text-2xl font-bold text-slate-900">A — Audience</h3>
          <p class="mt-1 text-slate-700 text-lg md:text-xl">Identify who the response is for — experts, beginners, executives, children, etc., to ensure appropriate language and depth.</p>
        </div>

        <div>
          <h3 class="text-xl md:text-2xl font-bold text-slate-900">R — Response</h3>
          <p class="mt-1 text-slate-700 text-lg md:text-xl">Define the output format — list, JSON, report, etc. This guarantees the result fits your downstream use.</p>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>

