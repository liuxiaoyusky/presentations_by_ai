<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'Chapter 2 Q&A Summary'
const qas = [
  { q: "Q1: Where can I play around with prompts?", a: "A: Connect ChatGPT with VPai, login with the team's account." },
  { q: "Q2: How to cook my own prompt?", a: "A: Ask LLM to update my prompt by Co-STAR format." },
  { q: "Q3: I'm stuck writing prompts. Where can I find examples to copy?", a: "A: Check GitHub repositories, OpenAI Cookbook, AI tool websites, and community forums for ready-made prompts you can adapt." }
]
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <div class="mt-6 grid grid-cols-1 gap-4">
      <div v-for="(item, idx) in qas" :key="idx" class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-5 md:p-6">
        <p class="font-semibold text-slate-900">{{ item.q }}</p>
        <p class="mt-2 text-slate-700">{{ item.a }}</p>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
