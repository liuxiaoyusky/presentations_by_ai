<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '4.6 Learning Resources'
const docs = [
  'OpenAI Best Practices: https://platform.openai.com/docs/guides/gpt-best-practices',
  'Prompt Engineering Guide: https://www.promptingguide.ai/zh'
]
const courses = ['Andrew Ng Course: https://www.deeplearning.ai/short-courses/chatgpt-prompt-engineering-for-developers']
const samples = ['Awesome Prompts: https://github.com/ai-boost/awesome-prompts — Curated list of ChatGPT prompts from top-rated GPTs in the GPTs Store']

// Turn literal "\n" into actual newlines so the UI can break lines
const normalize = (s: string) => s.replace(/\\n/g, '\n')
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <div class="mt-6 grid grid-cols-1 lg:grid-cols-3 gap-6">
      <article class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Official Documentation</h3>
        <ul class="mt-3 list-disc pl-6">
          <li v-for="d in docs" :key="d" class="whitespace-pre-wrap break-words">{{ normalize(d) }}</li>
        </ul>
      </article>
      <article class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Courses</h3>
        <ul class="mt-3 list-disc pl-6">
          <li v-for="c in courses" :key="c" class="whitespace-pre-wrap break-words">{{ normalize(c) }}</li>
        </ul>
      </article>
      <article class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Good Prompt Samples</h3>
        <ul class="mt-3 list-disc pl-6">
          <li v-for="s in samples" :key="s" class="whitespace-pre-wrap break-words">{{ normalize(s) }}</li>
        </ul>
      </article>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
