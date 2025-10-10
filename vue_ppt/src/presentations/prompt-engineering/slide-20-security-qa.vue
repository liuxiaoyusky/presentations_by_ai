<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'Chapter 3 Q&A Summary'
const q = 'Q: How to avoid leaking sensitive data?'
const a = 'A: Be cautious when uploading sensitive files to public AIs.'
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <div class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <p class="font-semibold text-slate-900">{{ q }}</p>
      <p class="mt-2 text-slate-700">{{ a }}</p>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
