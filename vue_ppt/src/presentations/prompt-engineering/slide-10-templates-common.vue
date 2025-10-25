<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.1 Markdown Format'
const composite = 'Composite (simplified): Task + Background + Output'
const note = 'Note: Not mandatory — clarity and accuracy trump everything. Think of essay structures (thesis + evidence + counter + conclusion).'

const previewUrl = 'https://markdownlivepreview.com/'
const markdownImg = new URL('./assests/markdown.png', import.meta.url).href
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
      {{ title }}
    </h2>

    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-4 md:p-6">
      <div class="flex items-center justify-between gap-3 mb-3">
        <h3 class="text-xl md:text-2xl font-bold text-slate-900">Live Markdown Preview</h3>
        <a :href="previewUrl" target="_blank" rel="noopener"
           class="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-slate-900 text-white text-sm shadow hover:bg-slate-800">
          Open in new tab
        </a>
      </div>
      <div class="rounded-xl border border-slate-200/60 bg-white p-2 md:p-3 flex items-center justify-center">
        <a :href="previewUrl" target="_blank" rel="noopener" class="block">
          <img
            :src="markdownImg"
            alt="Markdown Live Preview"
            class="block max-w-[820px] w-full h-auto rounded-lg shadow-sm"
          />
        </a>
      </div>
    </article>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
