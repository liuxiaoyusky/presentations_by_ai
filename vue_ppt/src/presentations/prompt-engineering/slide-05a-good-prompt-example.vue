<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const title = '1.5 Good Prompt Example'
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        {{ title }}
      </h2>
    </div>

    <div class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
      <p class="text-xl md:text-2xl font-semibold text-slate-900">Outline</p>
      <div class="mt-3 text-slate-700">
        <ul class="list-disc pl-6 text-base md:text-lg leading-relaxed">
          <li>
            <span class="font-bold">1.5 Good Prompt Example</span>
            <ul class="mt-1 list-disc pl-6">
              <li>
                <span class="font-semibold">1.5.1 Email Writer</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Polite, concise workplace email</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">1.5.2 AI-PPT Template Generator</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Generate a Markdown Slide Deck.</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">1.5.3 Todos Extractor</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Constraints → schedule → table output</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">1.5.4 Legal Counsel</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>HK contract risk analysis → revised clause</li>
                </ul>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities drive layout */
</style>

