<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import CardGrid from '@/shared/layouts/CardGrid.vue'
import CardPanel from '@/shared/layouts/CardPanel.vue'
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'Feature 3‑panel Comparison'

const panels = [
  { label: 'Design A', img: '/ppt-library/_raw/page-006.png' },
  { label: 'Design B', img: '/ppt-library/_raw/page-007.png' },
  { label: 'Design C', img: '/ppt-library/_raw/page-008.png' }
]
</script>

<template>
  <SlideSection maxWidth="1200px">
    <header>
      <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
      <p class="mt-2 text-slate-600 text-base md:text-lg">Consistent framing and labels for side‑by‑side comparison.</p>
    </header>

    <!-- Technique in action: 3 equal panels with labels -->
    <CardGrid minCol="280px">
      <CardPanel v-for="p in panels" :key="p.label">
        <div class="rounded-xl overflow-hidden border border-slate-200/50 bg-white shadow-md">
          <img :src="p.img" :alt="p.label" class="block w-full h-[180px] object-cover" />
        </div>
        <p class="mt-2 text-center text-slate-900 font-semibold">{{ p.label }}</p>
      </CardPanel>
    </CardGrid>
  </SlideSection>
</template>

<style scoped></style>
