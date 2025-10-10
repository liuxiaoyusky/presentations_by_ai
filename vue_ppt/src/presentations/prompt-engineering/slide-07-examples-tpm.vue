<script setup lang="ts">
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const title = '1.5.2 Technical Project Manager'
const mdNote = `See 2.2 **Co-STAR Framework** for comprehensive breakdown.`
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        {{ title }}
      </h2>
    </div>

    <div class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <div class="text-slate-700 text-lg md:text-xl">
        <MarkdownBlock :content="mdNote" />
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities drive layout */
</style>
