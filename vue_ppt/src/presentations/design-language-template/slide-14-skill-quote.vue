<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const bg = '/ppt-library/components/quote-overlay-fullbleed.png'
</script>

<template>
  <!-- Technique in action: full‑bleed image + overlay + quote -->
  <section class="relative h-full w-full overflow-hidden">
    <img :src="bg" alt="Background" class="absolute inset-0 h-full w-full object-cover" />
    <div class="absolute inset-0 bg-gradient-to-t from-black/65 via-black/30 to-black/10"></div>

    <div class="relative z-10 flex h-full w-full items-center justify-center px-8 py-10">
      <div class="max-w-5xl text-center">
        <p class="text-3xl md:text-5xl font-extrabold tracking-tight text-white">
          “Build with <span class="bg-clip-text text-transparent bg-gradient-to-r from-emerald-300 via-amber-300 to-rose-300">clarity</span>,
          present with <span class="bg-clip-text text-transparent bg-gradient-to-r from-sky-300 to-indigo-300">confidence</span>.”
        </p>
        <p class="mt-4 text-white/80 text-base md:text-lg">Quote overlay pattern: one line, strong contrast, subtle tint.</p>
      </div>
    </div>
  </section>
</template>

<style scoped></style>
