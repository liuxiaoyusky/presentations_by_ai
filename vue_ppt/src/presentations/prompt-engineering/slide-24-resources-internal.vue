<script setup lang="ts">
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '4.4 Helpful Internal Tools'
const table = `| Service | Type | Website | Notes |
|---------|------|--------|-------|
| **VPai** | Internal AI platform | url(https://ai-vista-launchpad-magic.vercel.app) | • Internal entry for GPT and Gemini models |
| **Internal N8N** | Workflow automation | url(https://10.1.9.133/home/workflows) | • Internal workflow automation platform |
| **Current AI Subscription Accounts** | Internal AI subscription account lists | url(https://xcn0uugwk9vs.feishu.cn/wiki/AC7mww46Ti3UfPk6x30cUlXknYf?table=tbl1f9tmBkbwBCr1&view=vew1kMHuXB) | Account: it.subscribe.vp@gmail.com\\nPassword: Vp12345! |`
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
