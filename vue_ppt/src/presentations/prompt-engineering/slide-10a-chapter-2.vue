<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const title = '2. Frameworks'
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        {{ title }}
      </h2>
    </div>

    <div class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <span class="font-semibold">2.1 General Framework<br></span>
      <span class="font-semibold">2.2 Co-STAR Framework<br></span>
      <span class="font-semibold">2.3 Reference and Adapt Website Prompts<br></span>
      <span class="font-semibold">2.4 Use LLM to Write Prompts<br></span>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities drive layout */
</style>
