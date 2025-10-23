<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const bg = '/ppt-library/templates/story-opener-tagline.png'
</script>

<template>
  <!-- Technique in action: big, memorable line with highlight -->
  <section class="relative h-full w-full overflow-hidden">
    <img :src="bg" alt="Background" class="absolute inset-0 h-full w-full object-cover" />
    <div class="absolute inset-0 bg-gradient-to-t from-slate-900/70 via-slate-900/30 to-transparent"></div>
    <div class="relative z-10 flex h-full items-center justify-center px-10">
      <h2 class="text-center text-5xl md:text-7xl font-black leading-tight tracking-tight text-white">
        Build it <span class="text-transparent bg-clip-text bg-gradient-to-r from-rose-300 via-amber-200 to-emerald-300">right</span>,
        tell it <span class="text-transparent bg-clip-text bg-gradient-to-r from-sky-300 to-indigo-300">bright</span>.
      </h2>
    </div>
  </section>
</template>

<style scoped></style>
