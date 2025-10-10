<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '4.3 Image & Video Generation'
const table = `| Service | Type | Website | Access | Notes |
|---------|------|---------|--------|-------|
| **Jimeng** | Image generation | url(https://jimeng.jianying.com/ai-tool/home) | Daily Credit | • AI image & video creation\\n• Multiple styles |
| **Runway ML** | Video generation | url(https://runwayml.com) | Daily Credit | • AI video creation\\n• Text-to-video |
| **Leonardo AI** | Image generation | url(https://leonardo.ai) | Daily Credit | • High-quality images\\n• Multiple models |`
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8 overflow-x-auto">
      <pre class="whitespace-pre text-slate-800 text-sm md:text-base">{{ table }}</pre>
    </article>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
