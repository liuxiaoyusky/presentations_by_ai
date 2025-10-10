<script setup lang="ts">
import { computed } from 'vue'

import { useDeckI18n } from '../../shared/i18n/use-deck-i18n'
import { usePresentationContext } from '../../shared/presentation/presentation-context'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const presentationContext = usePresentationContext()

const { t } = useDeckI18n('prompt-engineering', {
  locale: computed(() => presentationContext.state.locale),
  fallbackLocale: 'en'
})

const items = computed(() => [
  { title: t('slides.promptDefinition.components.task.title'), description: t('slides.promptDefinition.components.task.description') },
  { title: t('slides.promptDefinition.components.background.title'), description: t('slides.promptDefinition.components.background.description') },
  { title: t('slides.promptDefinition.components.output.title'), description: t('slides.promptDefinition.components.output.description') }
])

const examples = computed(() => [
  { label: t('slides.promptDefinition.example.task.label'), value: t('slides.promptDefinition.example.task.value') },
  { label: t('slides.promptDefinition.example.background.label'), value: t('slides.promptDefinition.example.background.value') },
  { label: t('slides.promptDefinition.example.output.label'), value: t('slides.promptDefinition.example.output.value') }
])
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        {{ t('slides.promptDefinition.title') }}
      </h2>
      <p class="mt-4 text-slate-700 text-xl md:text-2xl">{{ t('slides.promptDefinition.definition') }}</p>
    </div>

    <div class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-5 md:p-6">
      <div class="text-xs uppercase tracking-[0.24em] text-slate-600">{{ t('slides.promptDefinition.componentsHeading') }}</div>
      <pre class="mt-3 text-slate-900 font-mono text-xl md:text-2xl">{{ t('slides.promptDefinition.formula') }}</pre>
    </div>

    <div class="mt-6 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
      <article v-for="c in items" :key="c.title" class="bg-white/70 backdrop-blur-md border border-slate-200/30 rounded-3xl shadow-xl p-7 md:p-9">
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">{{ c.title }}</h3>
        <p class="mt-4 text-base md:text-lg text-slate-600">{{ c.description }}</p>
      </article>
    </div>

    <div class="mt-6">
      <div class="text-xs uppercase tracking-[0.24em] text-slate-600">{{ t('slides.promptDefinition.exampleHeading') }}</div>
      <div class="mt-3 grid grid-cols-1 sm:grid-cols-3 gap-4">
        <div v-for="ex in examples" :key="ex.label" class="rounded-xl border border-slate-200/30 bg-white/70 backdrop-blur p-5 md:p-6 shadow">
          <div class="text-xs uppercase tracking-[0.2em] text-slate-600">{{ ex.label }}</div>
          <p class="mt-2 text-base md:text-lg text-slate-700">{{ ex.value }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities drive layout; no extra CSS needed */
</style>
