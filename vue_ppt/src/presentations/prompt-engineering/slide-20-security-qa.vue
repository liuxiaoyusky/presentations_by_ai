<script setup lang="ts">
import { ref, watch } from 'vue'

const props = defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'Chapter 3 Q&A Summary'
const faqs = [
  { q: 'How to avoid leaking sensitive data?', a: 'Be cautious when uploading sensitive files to public AIs.' },
  { q: 'What should I sanitize before sharing logs?', a: 'Remove access tokens, emails, phone numbers, and internal hostnames.' },
  { q: 'Can I paste code from private repos?', a: 'Only if policy allows; otherwise, obfuscate identifiers and secrets.' }
]

// Start with all answers hidden; reset on slide enter
const open = ref<number | null>(null)
watch(() => props.isActive, (val) => { if (val) open.value = null })
</script>

<template>
  <section class="container mx-auto max-w-6xl px-6 md:px-8 lg:px-12 py-12 lg:py-16">
    <h2 class="inline-block text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>

    <ul class="mt-6 space-y-3">
      <li v-for="(item, i) in faqs" :key="i" class="overflow-hidden rounded-3xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl">
        <button @click="open = open === i ? null : i" class="flex w-full items-center justify-between px-6 py-4 text-left">
          <span class="text-slate-900 font-semibold">Q: {{ item.q }}</span>
          <svg class="h-4 w-4 text-slate-700 transition-transform" :class="{ 'rotate-180': open === i }" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M6 9l6 6 6-6"/></svg>
        </button>
        <div v-show="open === i" class="px-6 pb-6 text-slate-700 text-sm md:text-base leading-relaxed">
          A: {{ item.a }}
        </div>
      </li>
    </ul>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
