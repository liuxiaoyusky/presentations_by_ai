<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import CardPanel from '@/shared/layouts/CardPanel.vue'
import CardGrid from '@/shared/layouts/CardGrid.vue'
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '3‑card Feature Grid'

const features = [
  { title: 'Design', body: 'Clean visual language with readable type scale.', color: 'from-indigo-500 to-sky-400' },
  { title: 'Clarity', body: 'One idea per card. Keep copy tight.', color: 'from-emerald-500 to-teal-400' },
  { title: 'Focus', body: 'One accent per slide — icon or highlight.', color: 'from-rose-500 to-orange-400' }
]
</script>

<template>
  <SlideSection maxWidth="1200px">
    <header>
      <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
      <p class="mt-2 text-slate-600 text-base md:text-lg">Three consistent cards for side‑by‑side comparison.</p>
    </header>

    <!-- Technique in action: equal cards in a responsive grid -->
    <CardGrid minCol="260px">
      <CardPanel v-for="f in features" :key="f.title">
        <div class="inline-flex items-center justify-center rounded-xl p-3 text-white shadow-md" :class="`bg-gradient-to-br ${f.color}`">
          <span class="text-lg font-bold">{{ f.title }}</span>
        </div>
        <p class="mt-3 text-slate-700">{{ f.body }}</p>
      </CardPanel>
    </CardGrid>
  </SlideSection>
</template>

<style scoped></style>
