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
      <p class="text-xl md:text-2xl font-semibold text-slate-900">Outline</p>
      <div class="mt-3 text-slate-700">
        <ul class="list-disc pl-6 text-base md:text-lg leading-relaxed">
          <li>
            <span class="font-bold">4. Resources</span>
            <ul class="mt-1 list-disc pl-6">
              <li>
                <span class="font-semibold">4.1 One‑for‑All</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Starter kits, curated hubs</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">4.2 Prompt Generation Tools</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Assistants, builders, playgrounds</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">4.3 Media</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Blogs, talks, newsletters</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">4.4 Internal References</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Company docs, best practices</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">4.5 Other Resources (1)</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Misc. tools and repos</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">4.6 Other Resources (2)</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>More examples and references</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">4.7 Learning</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Courses and learning paths</li>
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

