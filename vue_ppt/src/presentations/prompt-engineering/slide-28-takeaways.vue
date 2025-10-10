<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '5. Key Takeaways'
const points = [
  'Prompts are engineering work—iterate deliberately.',
  'Structure guides output; frameworks like Co-STAR help.',
  'Context wins—share role, background, and examples.',
  'Protect data at every step before productionizing.',
  'Leverage free and internal resources to experiment faster.'
]
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <ul class="list-disc pl-6">
        <li v-for="p in points" :key="p">{{ p }}</li>
      </ul>
    </article>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
