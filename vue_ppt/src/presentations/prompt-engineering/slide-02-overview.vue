<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'Overview'
const oneLiner = 'Prompt engineering turns vague asks into reliable AI output.'
const agendaItems = [
  'Understanding Prompts',
  'Templates',
  'Data Security & Privacy',
  'Resources',
  'Key Takeaways'
]
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-6xl md:text-7xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
      <p class="mt-4 text-xl md:text-2xl text-slate-700">{{ oneLiner }}</p>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
      <article v-for="(item, idx) in agendaItems" :key="item" class="group bg-white/70 backdrop-blur-md border border-slate-200/30 rounded-3xl shadow-xl p-7 md:p-9 transition hover:-translate-y-0.5 hover:shadow-2xl">
        <div class="flex items-start justify-between">
          <h3 class="text-2xl md:text-3xl font-bold text-slate-900">{{ idx + 1 }}. {{ item }}</h3>
          <span class="inline-flex h-10 w-10 items-center justify-center rounded-full bg-gradient-to-r from-[#93AD90]/20 to-[#E26A6A]/20 border border-white/40 text-slate-900">{{ idx + 1 }}</span>
        </div>
      </article>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities drive layout; no extra CSS needed */
</style>
