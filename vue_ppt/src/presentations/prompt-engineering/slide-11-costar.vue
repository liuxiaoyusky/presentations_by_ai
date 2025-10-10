<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.2 Co-STAR Framework'
const subtitle = 'International prompt-contest winner template'
const items = ['Context', 'Objective', 'Style', 'Tone', 'Audience', 'Response']
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <p class="mt-3 text-slate-700 text-lg md:text-xl">{{ subtitle }}</p>
    <div class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <p class="text-slate-700">Produce a detailed system prompt from a user's task/rough prompt, covering:</p>
      <ul class="mt-3 list-disc pl-6">
        <li v-for="it in items" :key="it">{{ it }}</li>
      </ul>
    </div>
  </section>
  
</template>

<style scoped>
/* Tailwind utilities */
</style>
