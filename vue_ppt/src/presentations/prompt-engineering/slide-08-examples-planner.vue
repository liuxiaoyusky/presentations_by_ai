<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import FlowShowcase from '@/shared/layouts/FlowShowcase.vue'
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'
import { ref } from 'vue'

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

// Copy helpers
const copying = ref<number | null>(null)
const copyText = async (text: string, id: number) => {
  try {
    await navigator.clipboard.writeText(text)
  } catch {
    const ta = document.createElement('textarea')
    ta.value = text
    ta.style.position = 'fixed'; ta.style.opacity = '0'
    document.body.appendChild(ta); ta.focus(); ta.select()
    try { document.execCommand('copy') } catch {}
    document.body.removeChild(ta)
  }
  copying.value = id
  setTimeout(() => { if (copying.value === id) copying.value = null }, 1200)
}
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
        <div class="panel-head">
          <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Template</h3>
          <button type="button" class="copy-btn" @click="copyText(panel0, 0)">
            <span v-if="copying === 0">Copied</span>
            <span v-else>Copy</span>
          </button>
        </div>
        <MarkdownBlock :content="panel0" />
      </template>
      <template #panel1>
        <div class="panel-head">
          <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Sample Input</h3>
          <button type="button" class="copy-btn" @click="copyText(panel1, 1)">
            <span v-if="copying === 1">Copied</span>
            <span v-else>Copy</span>
          </button>
        </div>
        <MarkdownBlock :content="panel1" />
      </template>
      <template #panel2>
        <div class="panel-head">
          <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Sample Output</h3>
          <button type="button" class="copy-btn" @click="copyText(panel2, 2)">
            <span v-if="copying === 2">Copied</span>
            <span v-else>Copy</span>
          </button>
        </div>
        <MarkdownBlock :content="panel2" />
      </template>
    </FlowShowcase>
  </SlideSection>
</template>

<style scoped>
.panel-head { display: flex; align-items: center; justify-content: space-between; gap: 0.75rem; }
.copy-btn {
  display: inline-flex; align-items: center; gap: 0.4rem;
  padding: 0.35rem 0.7rem; border-radius: 999px; border: 1px solid rgba(148, 163, 184, 0.28);
  background: #0f172a; color: #f8fafc; font-size: 0.78rem; font-weight: 700; letter-spacing: 0.02em;
  box-shadow: 0 8px 18px rgba(15, 23, 42, 0.12); transition: transform 180ms ease, box-shadow 180ms ease, background 180ms ease;
}
.copy-btn:hover { transform: translateY(-2px); box-shadow: 0 12px 26px rgba(15, 23, 42, 0.18); background: #111827; }
.copy-btn:active { transform: translateY(0); }
</style>
