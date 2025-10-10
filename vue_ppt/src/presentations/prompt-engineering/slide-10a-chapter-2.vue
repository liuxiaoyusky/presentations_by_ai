<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const title = '2. Co-STAR Framework'
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
            <span class="font-bold">2. Co-STAR Framework & Templates</span>
            <ul class="mt-1 list-disc pl-6">
              <li>
                <span class="font-semibold">2.1 Co-STAR</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>What & why; the structure of Co‑STAR</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">2.2 Co-STAR Role</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Define persona, scope, authority</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">2.3 Co-STAR Instructions</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Steps, constraints, examples, references</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">2.4 Co-STAR Output</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Format, validation, acceptance criteria</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">2.5 Templates Reference</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Curated sources and examples</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">2.6 LLM Templates</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Generic patterns for reasoning & tools</li>
                </ul>
              </li>
              <li>
                <span class="font-semibold">2.7 QA Templates</span>
                <ul class="mt-1 list-disc pl-6">
                  <li>Task‑specific patterns for QA flows</li>
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

