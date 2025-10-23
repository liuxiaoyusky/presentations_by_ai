<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = 'Design Language Template'
const sub = 'PPT Template — Cover (Centered Title)'
</script>

<template>
  <!-- Technique in action: centered title cover -->
  <section class="relative flex h-full w-full items-center justify-center px-10">
    <div class="absolute inset-0 -z-10 bg-gradient-to-b from-slate-900/60 via-slate-900/30 to-transparent"></div>
    <div class="text-center">
      <h1 class="text-6xl md:text-8xl font-black tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h1>
      <p class="mt-4 text-lg md:text-2xl text-white/90">{{ sub }}</p>
      <p class="mt-2 text-white/70 text-base">Mar 2025 · Internal Deck</p>
    </div>
  </section>
</template>

<style scoped></style>
