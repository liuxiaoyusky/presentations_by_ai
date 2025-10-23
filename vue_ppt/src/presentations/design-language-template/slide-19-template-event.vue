<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import CardPanel from '@/shared/layouts/CardPanel.vue'
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const photo = '/ppt-library/templates/event-photo-feature.png'
const title = 'Event Photo Feature'
</script>

<template>
  <SlideSection maxWidth="1200px">
    <header>
      <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
      <p class="mt-2 text-slate-600 text-base md:text-lg">Hero photo with concise context.</p>
    </header>

    <CardPanel>
      <div class="relative overflow-hidden rounded-2xl">
        <img :src="photo" alt="Event" class="w-full h-auto rounded-2xl border border-slate-200/50 shadow-2xl" />
        <div class="absolute left-6 bottom-6 rounded-xl bg-slate-900/70 backdrop-blur-md text-white px-4 py-3 shadow-lg ring-1 ring-white/20">
          <p class="text-sm uppercase tracking-wider">MWC Barcelona</p>
          <p class="text-lg md:text-xl font-semibold leading-tight">Product Showcase — Feb 26, 2024</p>
        </div>
      </div>
    </CardPanel>
  </SlideSection>
</template>

<style scoped></style>
