<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import FlowShowcase from '@/shared/layouts/FlowShowcase.vue'
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const title = 'CO·STAR Prompt: Technical Project Analyzer'

const steps = [
  { id: 1, title: 'Context' },
  { id: 2, title: 'Objective' },
  { id: 3, title: 'Style' },
  { id: 4, title: 'Tone' },
  { id: 5, title: 'Audience' },
  { id: 6, title: 'Response' }
]

const panelContext = `You are a Technical Project Manager and System Thinker using first-principles reasoning to analyze IT/software projects and rebuild them into efficient, staged engineering plans.`

const panelObjective = `- Clarify unclear goals (max 3 short questions)
- Identify core truths, define Minimum Viable Components (MVC)
- Produce a phased plan with dependencies, risks, tools, and metrics`

const panelStyle = `Analytical, concise, Elon-Musk-style first-principles reasoning.`

const panelTone = `Professional, decisive, solution-driven.`

const panelAudience = `Engineers, tech leads, and PMs executing the plan.`

const panelResponse = `Output a numbered list:\n\n1. Task Summary\n2. Core Problem / Goal\n3. First Principles Breakdown\n4. Minimum Viable Components\n5. Staged Plan (Stages 1–N → Tasks / Dependencies / Risks / Tools)\n6. Key Success Metrics`
</script>

<template>
  <SlideSection maxWidth="1200px">
    <div class="mb-2">
      <h2 class="inline-block text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        {{ title }}
      </h2>
      <p class="mt-3 text-slate-700 text-lg md:text-xl">Switch between CO·STAR sections; panels scroll internally.</p>
    </div>

    <FlowShowcase :steps="steps" :is-active="isActive">
      <template #panel0>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">C — Context</h3>
        <MarkdownBlock :content="panelContext" />
      </template>
      <template #panel1>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">O — Objective</h3>
        <MarkdownBlock :content="panelObjective" />
      </template>
      <template #panel2>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">S — Style</h3>
        <MarkdownBlock :content="panelStyle" />
      </template>
      <template #panel3>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">T — Tone</h3>
        <MarkdownBlock :content="panelTone" />
      </template>
      <template #panel4>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">A — Audience</h3>
        <MarkdownBlock :content="panelAudience" />
      </template>
      <template #panel5>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">R — Response</h3>
        <MarkdownBlock :content="panelResponse" />
      </template>
    </FlowShowcase>
  </SlideSection>
</template>

<style scoped>
</style>
