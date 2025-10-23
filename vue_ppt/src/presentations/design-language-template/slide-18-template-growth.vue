<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import TwoColumn from '@/shared/layouts/TwoColumn.vue'
import CardPanel from '@/shared/layouts/CardPanel.vue'
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'Chart + Growth Metrics'

const kpis = [
  { label: 'Revenue', value: '+18.5%', color: 'from-emerald-500 to-emerald-400' },
  { label: 'Users', value: '+12.1%', color: 'from-sky-500 to-indigo-400' },
  { label: 'Conversion', value: '+2.4pt', color: 'from-amber-500 to-orange-400' }
]
</script>

<template>
  <SlideSection maxWidth="1200px">
    <header>
      <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
      <p class="mt-2 text-slate-600 text-base md:text-lg">Combine trend with compact KPI callouts.</p>
    </header>

    <!-- Technique in action: small chart + KPIs -->
    <TwoColumn>
      <template #left>
        <CardPanel>
          <svg viewBox="0 0 480 280" class="w-full h-auto">
            <defs>
              <linearGradient id="gLine" x1="0" y1="0" x2="1" y2="1">
                <stop offset="0%" stop-color="#6366f1" />
                <stop offset="50%" stop-color="#8b5cf6" />
                <stop offset="100%" stop-color="#34d399" />
              </linearGradient>
            </defs>
            <rect x="0" y="0" width="480" height="280" rx="20" fill="rgba(248,250,252,0.7)" stroke="rgba(148,163,184,0.25)" />
            <g stroke="rgba(148,163,184,0.35)" stroke-dasharray="6 8">
              <line x1="48" x2="432" y1="60" y2="60" />
              <line x1="48" x2="432" y1="120" y2="120" />
              <line x1="48" x2="432" y1="180" y2="180" />
            </g>
            <polyline fill="none" stroke="url(#gLine)" stroke-width="4" points="48,180 120,160 192,150 264,120 336,95 408,80">
              <animate attributeName="stroke-dasharray" from="0,600" to="600,0" dur="1s" fill="freeze" />
            </polyline>
            <g fill="#6366f1">
              <circle cx="120" cy="160" r="5" />
              <circle cx="192" cy="150" r="5" />
              <circle cx="264" cy="120" r="5" />
              <circle cx="336" cy="95" r="5" />
              <circle cx="408" cy="80" r="5" />
            </g>
          </svg>
        </CardPanel>
      </template>
      <template #right>
        <div class="grid grid-cols-1 gap-4">
          <CardPanel v-for="k in kpis" :key="k.label">
            <div class="flex items-center justify-between">
              <div>
                <p class="text-slate-600 text-sm">{{ k.label }}</p>
                <p class="text-3xl md:text-4xl font-black tracking-tight text-transparent bg-clip-text" :class="`bg-gradient-to-r ${k.color}`">{{ k.value }}</p>
              </div>
              <span class="inline-block rounded-md bg-white/80 ring-1 ring-black/5 px-2 py-1 text-xs text-slate-600">YoY</span>
            </div>
          </CardPanel>
        </div>
      </template>
    </TwoColumn>
  </SlideSection>
</template>

<style scoped></style>
