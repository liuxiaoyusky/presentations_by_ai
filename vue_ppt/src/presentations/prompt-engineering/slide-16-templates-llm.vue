<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.4 Live Demo'

// Local mp4 asset (note the space and folder name)
const videoUrl = new URL('./assests/prompt engineering.mp4', import.meta.url).href
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <p class="mt-3 text-slate-700 text-lg md:text-xl">Use LLM to Write Prompts and Make PPT.</p>

    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-4 md:p-6">
      <h3 class="text-xl md:text-2xl font-bold text-slate-900">Demo Video</h3>
      <div class="mt-3 rounded-xl overflow-hidden border border-slate-200/50 bg-slate-900/90">
        <video
          :src="videoUrl"
          controls
          playsinline
          preload="metadata"
          class="block w-full h-auto max-h-[70vh]"
        >
          Your browser does not support the video tag.
        </video>
      </div>
    </article>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
