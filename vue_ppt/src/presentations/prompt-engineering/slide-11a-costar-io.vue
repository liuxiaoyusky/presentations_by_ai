<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import TwoColumn from '@/shared/layouts/TwoColumn.vue'
import CardPanel from '@/shared/layouts/CardPanel.vue'
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.2.3 CO·STAR Sample'

const inputText = 'Here is my task, help me learn markdown format in prompt engineering'

const outputMd = `Sure — here’s the **concise Markdown-first plan** 👇\n\n---\n\n### 1. **Task Summary**\n\nLearn Markdown to structure and optimize LLM prompts.\n\n---\n\n### 2. **Core Goal**\n\nUse Markdown to improve **clarity**, **logic flow**, and **response quality**.\n\n---\n\n### 3. **First Principles**\n\n* Markdown = **structure**, not decoration.\n* LLMs read hierarchy → better context parsing.\n* Clear sections = fewer misunderstandings.\n\n---\n\n### 4. **MVC**\n\n\`# Headings\`, \`- Lists\`, \`**Bold**\`, \`> Quotes\`, \`\`\` Code \`\`\`, \`---\` Dividers, Tables.\n\n---\n\n### 5. **Phased Plan**\n\n**Stage 1 — Syntax Basics**\nTasks: Learn core elements → practice formatting.\nTools: markdownguide.org.\n\n**Stage 2 — Structured Prompts**\nTasks: Use headings/lists to define context + goal + style.\nRisk: Over-formatting.\n\n**Stage 3 — Advanced Use**\nTasks: Add code blocks, tables, modular templates.\nTools: Obsidian / ChatGPT playground.\n\n---\n\n### 6. **Success Metrics**\n\n* 100% valid Markdown syntax.\n* Clean, logical prompt sections (<10 lines each).\n* Responses mirror structure.\n* > 30% fewer clarification edits.`
</script>

<template>
  <SlideSection :center="false" maxWidth="1200px">
    <header>
      <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        {{ title }}
      </h2>
      <p class="mt-2 text-slate-600">Let's ultilize the prompt example to generate a sample output.</p>
    </header>

    <TwoColumn :left-ratio="2" :right-ratio="3">
      <template #left>
        <CardPanel title="Input">
          <pre class="mt-1 rounded-lg bg-slate-900 text-slate-100 p-4 text-sm md:text-base leading-relaxed overflow-auto whitespace-pre-wrap break-words max-h-[55vh]">
<code>{{ inputText }}</code>
          </pre>
        </CardPanel>
      </template>

      <template #right>
        <CardPanel title="Output">
          <div class="max-h-[55vh] overflow-auto">
            <MarkdownBlock :content="outputMd" />
          </div>
        </CardPanel>
      </template>
    </TwoColumn>
  </SlideSection>
</template>

<style scoped>
</style>
