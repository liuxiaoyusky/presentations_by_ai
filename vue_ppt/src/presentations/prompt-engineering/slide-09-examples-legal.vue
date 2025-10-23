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

const panel0 = `**Role**: You are a senior legal counsel with expertise in Hong Kong contract law.

**Task**: Review the following sales contract clause, identify potential legal and commercial risks under Hong Kong law, and provide suggested revisions.

**Clause to Review**:
"Party B shall deliver the goods within 3 working days after receiving the payment. In case of delayed delivery, a penalty of 0.1% of the contract amount per day will be charged."

**Output Requirements**:

- Identify and explain each potential risk point, considering enforceability under Hong Kong law
- Provide references to relevant legal principles or case law where applicable (e.g., penalty vs. liquidated damages doctrine)
- Draft a revised version of the clause to mitigate risk and improve enforceability

Format: Present your analysis in bullet points; use **bold** to highlight key legal issues or recommendations`

const panel1 = `Review this clause: "Party B shall deliver the goods within 3 working days after receiving the payment. In case of delayed delivery, a penalty of 0.1% of the contract amount per day will be charged."`

const panel2 = `**Legal Risk Analysis:**

- **Penalty Clause Risk**: The 0.1% daily penalty may be deemed unenforceable under Hong Kong law as it could constitute a penalty rather than liquidated damages
- **Uncertainty in "Working Days"**: The term "working days" is ambiguous and may lead to disputes about calculation methods
- **No Force Majeure Protection**: The clause lacks protection for circumstances beyond Party B's control

**Legal References:**
- **Dunlop Pneumatic Tyre Co Ltd v New Garage & Motor Co Ltd [1915]**: Establishes the test for distinguishing penalties from liquidated damages
- **Hong Kong Contract Law**: Penalties are unenforceable if they are extravagant and unconscionable

**Revised Clause:**
"Party B shall deliver the goods within 3 business days (Monday to Friday, excluding public holidays) after receiving the payment. In case of delayed delivery due to Party B's fault, liquidated damages of 0.05% of the contract amount per day will be charged, subject to a maximum of 5% of the total contract value. This provision shall not apply in cases of force majeure or circumstances beyond Party B's reasonable control."`

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
        1.5.4 Legal Counsel
      </h2>
      <p class="mt-3 text-slate-700 text-lg md:text-xl">Hong Kong contract law analysis with structured risk assessment.</p>
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
