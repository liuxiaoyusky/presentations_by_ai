<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import CardGrid from '@/shared/layouts/CardGrid.vue'
import CardPanel from '@/shared/layouts/CardPanel.vue'
defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const title = 'KPI 3‑up Cards'
const subtitle = 'Emphasize the numbers. Keep spacing consistent.'

const metrics = [
  { label: 'Total Revenue', value: '2710', unit: '亿元', accent: 'from-emerald-500 to-emerald-400' },
  { label: 'Global Shipments', value: '1.46', unit: '亿台', accent: 'from-amber-500 to-orange-400' },
  { label: 'Monthly Active Users', value: '6.41', unit: '亿', accent: 'from-sky-500 to-indigo-400' }
]
</script>

<template>
  <SlideSection maxWidth="1200px">
    <header>
      <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
      <p class="mt-2 text-slate-600 text-base md:text-lg">{{ subtitle }}</p>
    </header>

    <!-- Technique in action: 3 equal KPI cards -->
    <CardGrid minCol="280px">
      <CardPanel v-for="m in metrics" :key="m.label" class="relative overflow-hidden">
        <div class="flex items-baseline justify-between">
          <h3 class="text-slate-900 text-lg md:text-xl font-semibold">{{ m.label }}</h3>
          <span class="rounded-full bg-white/80 ring-1 ring-black/5 px-2 py-0.5 text-xs text-slate-600">Now</span>
        </div>
        <div class="mt-3 flex items-end gap-2">
          <span class="text-5xl md:text-6xl font-black tracking-tight bg-clip-text text-transparent" :class="`bg-gradient-to-br ${m.accent}`">{{ m.value }}</span>
          <span class="text-slate-500 text-lg md:text-xl">{{ m.unit }}</span>
        </div>
        <p class="mt-2 text-slate-600">YoY +12.4% · MoM +3.1%</p>
      </CardPanel>
    </CardGrid>

    <footer class="text-slate-600 text-sm">Pattern: Soft glass cards, equal widths, accent gradient on numerals.</footer>
  </SlideSection>
</template>

<style scoped></style>
