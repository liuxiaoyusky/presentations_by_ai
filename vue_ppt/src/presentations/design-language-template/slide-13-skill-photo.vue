<script setup lang="ts">
import SlideSection from '@/shared/layouts/SlideSection.vue'
import CardPanel from '@/shared/layouts/CardPanel.vue'
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'Photo Frame with Shadow'
const photo = '/ppt-library/templates/event-photo-feature.png'
</script>

<template>
  <SlideSection maxWidth="1200px">
    <header>
      <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
      <p class="mt-2 text-slate-600 text-base md:text-lg">Framed hero image with gentle elevation and concise caption.</p>
    </header>

    <!-- Technique in action: framed image with caption -->
    <CardPanel>
      <figure class="flex flex-col md:flex-row items-start gap-6">
        <div class="relative rounded-2xl overflow-hidden border border-slate-200/60 bg-white shadow-2xl shadow-slate-900/20 ring-1 ring-black/5">
          <img :src="photo" alt="Event" class="block w-[680px] max-w-full h-auto" />
          <div class="pointer-events-none absolute inset-0 rounded-2xl ring-1 ring-white/40"></div>
        </div>
        <figcaption class="text-slate-700 max-w-prose">
          <h3 class="text-xl font-bold text-slate-900">Event Highlight</h3>
          <p class="mt-2">Barcelona · Feb 26, 2024 — Showcase of the new model with global audience. Keep captions short and factual.</p>
          <p class="mt-3 text-sm text-slate-500">Pattern: framed photo, subtle ring, soft shadow, short caption.</p>
        </figcaption>
      </figure>
    </CardPanel>
  </SlideSection>
  
</template>

<style scoped></style>
