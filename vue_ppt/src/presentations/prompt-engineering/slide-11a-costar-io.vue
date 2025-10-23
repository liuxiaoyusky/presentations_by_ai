<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import FlowShowcase from '@/shared/layouts/FlowShowcase.vue'
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'CO·STAR Demo — Input → Output'

const steps = [
  { id: 1, title: 'Input' },
  { id: 2, title: 'Output' }
]

const inputMd = `Here is my task, help me learn markdown format in prompt engineering`

const outputMd = `Sure — here’s the **concise Markdown-first plan** 👇\n\n---\n\n### 1. **Task Summary**\n\nLearn Markdown to structure and optimize LLM prompts.\n\n---\n\n### 2. **Core Goal**\n\nUse Markdown to improve **clarity**, **logic flow**, and **response quality**.\n\n---\n\n### 3. **First Principles**\n\n* Markdown = **structure**, not decoration.\n* LLMs read hierarchy → better context parsing.\n* Clear sections = fewer misunderstandings.\n\n---\n\n### 4. **MVC**\n\n\`# Headings\`, \`- Lists\`, \`**Bold**\`, \`> Quotes\`, \`\`\` Code \`\`\`, \`---\` Dividers, Tables.\n\n---\n\n### 5. **Phased Plan**\n\n**Stage 1 — Syntax Basics**\nTasks: Learn core elements → practice formatting.\nTools: markdownguide.org.\n\n**Stage 2 — Structured Prompts**\nTasks: Use headings/lists to define context + goal + style.\nRisk: Over-formatting.\n\n**Stage 3 — Advanced Use**\nTasks: Add code blocks, tables, modular templates.\nTools: Obsidian / ChatGPT playground.\n\n---\n\n### 6. **Success Metrics**\n\n* 100% valid Markdown syntax.\n* Clean, logical prompt sections (<10 lines each).\n* Responses mirror structure.\n* > 30% fewer clarification edits.`
</script>

<template>
  <SlideSection :center="false" maxWidth="1200px">
    <header>
      <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        {{ title }}
      </h2>
    </header>

    <FlowShowcase :steps="steps" :is-active="isActive">
      <template #panel0>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Input</h3>
        <MarkdownBlock :content="inputMd" />
      </template>
      <template #panel1>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Output</h3>
        <MarkdownBlock :content="outputMd" />
      </template>
    </FlowShowcase>
  </SlideSection>
</template>

<style scoped>
</style>
