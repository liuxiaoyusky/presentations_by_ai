<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import TwoColumn from '@/shared/layouts/TwoColumn.vue'
import CardPanel from '@/shared/layouts/CardPanel.vue'
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'Two‑column — Bullets + Visual'
const visual = '/ppt-library/components/two-column-bullets-visual.png'

const bullets = [
  '3–5 bullets max; one idea each',
  'Short, scannable lines with verbs',
  'Use the visual to reinforce the message',
  'Keep spacing and alignment consistent'
]
</script>

<template>
  <SlideSection maxWidth="1200px">
    <header>
      <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
      <p class="mt-2 text-slate-600 text-base md:text-lg">Balanced layout for clear reading flow.</p>
    </header>

    <!-- Technique in action: 60/40 text + visual -->
    <TwoColumn>
      <template #left>
        <CardPanel>
          <h3 class="text-xl font-bold text-slate-900">Key Points</h3>
          <ul class="mt-3 space-y-2 text-slate-700 text-base md:text-lg">
            <li v-for="(b, i) in bullets" :key="i" class="flex items-start gap-3">
              <span class="mt-1 inline-block h-2 w-2 rounded-full bg-gradient-to-r from-rose-400 to-orange-400"></span>
              <span>{{ b }}</span>
            </li>
          </ul>
        </CardPanel>
      </template>
      <template #right>
        <CardPanel>
          <img :src="visual" alt="Visual" class="w-full rounded-xl border border-slate-200/40 shadow-md" />
          <p class="mt-2 text-sm text-slate-500">Example visual reinforcing the bullets.</p>
        </CardPanel>
      </template>
    </TwoColumn>
  </SlideSection>
</template>

<style scoped></style>
