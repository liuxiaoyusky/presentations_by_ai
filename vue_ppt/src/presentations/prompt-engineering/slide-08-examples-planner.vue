<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import FlowShowcase from '@/shared/layouts/FlowShowcase.vue'
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const steps = [
  { id: 1, title: 'Template' },
  { id: 2, title: 'Sample Input' },
  { id: 3, title: 'Sample Output' }
]

const panel0 = `## 🧠 Prompt:
You are a professional AI assistant that builds optimized daily job plans. The user may provide **any combination** of the following as input:
- A screenshot of a calendar
- A screenshot of a to-do list
- A written to-do list or notes of things they want to do

Your job is to intelligently extract and combine all input information to create a **realistic, well-structured job schedule** for the day.

---

## 🕘 Constraints:
- **Working hours:** 09:00 – 18:00
- **Lunch break:** 12:15 – 13:30 (leave this time free)
- Do not double-book tasks over existing calendar events
- Merge duplicate or overlapping tasks if needed
- Prioritize urgent/time-sensitive items
- Leave room for short breaks when possible

---

## 📋 Output Format:
Return the final daily plan in a clean, professional **table format** with these columns:

| 🕒 Time       | ✅ Task              | 📌 Notes (optional)     |
|--------------|---------------------|--------------------------|`

const panel1 = `I have these tasks for today:
- Team meeting at 10:00 AM (already scheduled)
- Finish quarterly report
- Call client about project update
- Review code changes
- Prepare presentation for tomorrow

I also have a dentist appointment at 2:00 PM that I forgot to mention.`

const panel2 = `| 🕒 Time       | ✅ Task              | 📌 Notes (optional)     |
|--------------|---------------------|--------------------------|
| 09:00-10:00  | Finish quarterly report | Priority task, quiet time |
| 10:00-11:00  | Team meeting        | Already scheduled        |
| 11:00-11:30  | Call client         | Project update discussion |
| 11:30-12:15  | Review code changes | Before lunch break       |
| 12:15-13:30  | Lunch break         | Free time                |
| 13:30-14:00  | Prepare presentation | Quick prep for tomorrow  |
| 14:00-15:00  | Dentist appointment | Already scheduled        |
| 15:00-16:00  | Continue quarterly report | Complete remaining sections |
| 16:00-17:00  | Final review        | Check all completed tasks |
| 17:00-18:00  | Buffer time         | Handle any urgent items  |`
</script>

<template>
  <SlideSection maxWidth="1200px">
    <div class="mb-2">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        1.5.3 Daily Job Planner
      </h2>
    </div>

    <FlowShowcase :steps="steps" :is-active="isActive">
      <template #panel0>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Template</h3>
        <MarkdownBlock :content="panel0" />
      </template>
      <template #panel1>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Sample Input</h3>
        <MarkdownBlock :content="panel1" />
      </template>
      <template #panel2>
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Sample Output</h3>
        <MarkdownBlock :content="panel2" />
      </template>
    </FlowShowcase>
  </SlideSection>
</template>

<style scoped>
</style>
