<script setup lang="ts">
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '4.5 Other Services'
const table = `| Service | Type | Website | Access | Notes |
|---------|------|---------|--------|-------|
| **Kimi Slides** | PPT generation | url(https://www.kimi.com/kimiplus/slides) | Free | • Text to slides in minutes |
| **OpenRouter** | Model router | url(https://openrouter.ai) | Free access to multiple models | • Access multiple models |
| **Cursor** | AI editor | url(https://cursor.sh) | Free tier | • AI-powered editor\\n• Chat with code |
| **IMA** | Knowledge base | url(https://ima.ai) | Free | • AI knowledge management\\n• Document processing |
| **Tavily** | Search API | url(https://tavily.com) | Free tier | • AI-powered search\\n• Real-time information |
| **Jina** | AI platform | url(https://jina.ai) | Free tier | • Document processing\\n• Multimodal AI |
| **Ollama** | Local models | url(https://ollama.ai) | Free | • Run models locally\\n• Privacy-focused |`
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
