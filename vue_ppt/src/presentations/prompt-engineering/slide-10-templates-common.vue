<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.1 General Framework'
const composite = 'Composite (simplified): Task + Background + Output'
const note = 'Note: Not mandatory — clarity and accuracy trump everything. Think of essay structures (thesis + evidence + counter + conclusion).'
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
      {{ title }}
    </h2>
    <div class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <p class="text-xl md:text-2xl font-semibold text-slate-900">{{ composite }}</p>
      <p class="mt-3 text-slate-700 text-lg md:text-xl">{{ note }}</p>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>

