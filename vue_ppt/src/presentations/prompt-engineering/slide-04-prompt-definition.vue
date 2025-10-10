<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'What is a prompt?'
const definition = 'A prompt is the input message that guides the model to the desired response.'
const formula = 'prompt = task + background + output'
const items = [
  { title: 'Task', description: 'The actual job: request, question, or goal.' },
  { title: 'Background', description: 'Context that frames the request—audience, tone, constraints.' },
  { title: 'Output', description: 'The format, structure, or deliverable you expect back.' }
]
const examples = [
  { label: 'Task', value: 'Email my manager about requesting time off next week.' },
  { label: 'Background', value: "Be professional, emphasize I planned ahead." },
  { label: 'Output', value: 'Provide subject line plus full email body.' }
]
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
      <p class="mt-4 text-slate-700 text-xl md:text-2xl">{{ definition }}</p>
    </div>

    <div class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-5 md:p-6">
      <div class="text-xs uppercase tracking-[0.24em] text-slate-600">Key ingredients</div>
      <pre class="mt-3 text-slate-900 font-mono text-xl md:text-2xl">{{ formula }}</pre>
    </div>

    <div class="mt-6 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
      <article v-for="c in items" :key="c.title" class="bg-white/70 backdrop-blur-md border border-slate-200/30 rounded-3xl shadow-xl p-7 md:p-9">
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">{{ c.title }}</h3>
        <p class="mt-4 text-base md:text-lg text-slate-600">{{ c.description }}</p>
      </article>
    </div>

    <div class="mt-6">
      <div class="text-xs uppercase tracking-[0.24em] text-slate-600">Example</div>
      <div class="mt-3 grid grid-cols-1 sm:grid-cols-3 gap-4">
        <div v-for="ex in examples" :key="ex.label" class="rounded-xl border border-slate-200/30 bg-white/70 backdrop-blur p-5 md:p-6 shadow">
          <div class="text-xs uppercase tracking-[0.2em] text-slate-600">{{ ex.label }}</div>
          <p class="mt-2 text-base md:text-lg text-slate-700">{{ ex.value }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities drive layout; no extra CSS needed */
</style>
