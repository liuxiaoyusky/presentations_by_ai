<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import CardGrid from '@/shared/layouts/CardGrid.vue'
import CardPanel from '@/shared/layouts/CardPanel.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const title = '小米2023年财报'

const tiles = [
  {
    label: '总营收',
    value: '2710',
    unit: '亿元',
    accent: false
  },
  {
    label: '智能手机全球销量',
    value: '1.46',
    unit: '亿台',
    accent: true
  },
  {
    label: '全球月活跃用户',
    value: '6.41',
    unit: '亿',
    accent: false
  }
]
</script>

<template>
  <SlideSection class="relative" maxWidth="1200px">
    <!-- Title + Xiaomi logo badge (inline SVG) -->
    <header class="relative mb-8 flex items-center justify-center">
      <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-slate-900">
        {{ title }}
      </h2>
      <div class="absolute right-0 top-1/2 -translate-y-1/2">
        <!-- Xiaomi logo approximation -->
        <div class="h-10 w-10 rounded-2xl bg-[#ff6a00] shadow-md shadow-black/20 grid place-items-center">
          <svg viewBox="0 0 32 32" class="h-6 w-6" aria-hidden="true">
            <rect width="32" height="32" rx="9" fill="#ff6a00"></rect>
            <path
              d="M9 10h3.2c2.3 0 3.8 1.3 3.8 3.6V22h-2.7v-8.2c0-1-.6-1.5-1.6-1.5H9V10zm12.6 0c2.3 0 3.4 1.4 3.4 3.6V22h-2.7v-8.2c0-1-.5-1.5-1.4-1.5h-2V10h2.7z"
              fill="#fff"
            />
          </svg>
        </div>
      </div>
    </header>

    <!-- 3 metric cards -->
    <CardGrid minCol="320px">
      <CardPanel v-for="t in tiles" :key="t.label">
        <div class="rounded-3xl border border-slate-200/60 bg-slate-100/80 shadow-[0_8px_30px_rgba(0,0,0,0.06)] px-8 py-10 text-center">
          <div class="text-slate-600 text-base md:text-lg mb-6">{{ t.label }}</div>
          <div class="flex items-end justify-center gap-2">
            <div :class="['font-black tracking-tight leading-none', t.accent ? 'text-[#ff6a00]' : 'text-slate-900', 'text-6xl md:text-7xl']">
              {{ t.value }}
            </div>
            <div class="pb-1 text-slate-600 text-2xl md:text-3xl">{{ t.unit }}</div>
          </div>
        </div>
      </CardPanel>
    </CardGrid>
  </SlideSection>
</template>

<style scoped>
/* Keep slide shell on a soft light canvas similar to screenshot */
:host {
  --tile-bg: 248 250 252; /* slate-50 */
}
</style>

