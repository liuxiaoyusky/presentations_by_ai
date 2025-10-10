<script setup lang="ts">
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '4.2 Current Prompt Generation Resources'
const table = `| Service | Type | Website | Access | Notes |
|---------|------|---------|--------|-------|
| **Prompt Pilot** | Prompt engineering tool | url(https://promptpilot.volcengine.com/home) | Internal | • AI-powered prompt generation\\n• Template library |
| **Kimi Prompt Expert** | Prompt expert assistant | url(https://www.kimi.com/kimiplus/conpg00t7lagbbsfqkq0) | Free | • AI prompt design assistant\\n• Zero-threshold prompt mastery |
| **Prompt Engineer - GPTs** | GPT-based prompt tool | OpenAI GPTs | Paid | • GPT-powered prompt engineering\\n• Advanced prompt optimization |`
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8 overflow-x-auto">
      <MarkdownBlock :content="table" />
    </article>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
