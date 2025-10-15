<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const title = '4. Resources'
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        {{ title }}
      </h2>
    </div>

    <div class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
              <li><span class="font-semibold">4.1 One‑for‑All</span></li>
              <li><span class="font-semibold">4.2 Prompt Generation Tools</span></li>
              <li><span class="font-semibold">4.3 Media</span></li>
              <li><span class="font-semibold">4.4 Internal References</span></li>
              <li><span class="font-semibold">4.5 Other Resources</span></li>
              <li><span class="font-semibold">4.6 Learning</span></li>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities drive layout */
</style>
