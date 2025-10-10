<template>
  <SlideSection center>
    <h2
      class="text-center text-5xl md:text-6xl font-black tracking-tight bg-gradient-to-r from-rose-400 via-orange-400 to-amber-300 bg-clip-text text-transparent"
    >
      {{ t('slide6.title') }}
    </h2>

    <CardGrid :min-col="'300px'">
      <CardPanel
        v-for="card in cards"
        :key="card.titleKey"
        :class="card.accent"
      >
        <template #header>
          <div class="text-2xl md:text-3xl font-bold text-slate-900">
            {{ t(card.titleKey) }}
          </div>
        </template>
        <div class="mt-2 text-base md:text-lg text-slate-700" v-html="t(card.subtitleKey)" />
      </CardPanel>
    </CardGrid>
  </SlideSection>
</template>

<script setup lang="ts">
import { computed } from 'vue'

import SlideSection from '@/shared/layouts/SlideSection.vue'
import CardGrid from '@/shared/layouts/CardGrid.vue'
import CardPanel from '@/shared/layouts/CardPanel.vue'

import { useDeckI18n } from '../../shared/i18n/use-deck-i18n'
import { usePresentationContext } from '../../shared/presentation/presentation-context'

defineProps({ isActive: Boolean, isPreview: Boolean })

const presentationContext = usePresentationContext()

const { t } = useDeckI18n('qwen3-next-bench', {
  locale: computed(() => presentationContext.state.locale),
  fallbackLocale: 'en'
})

const cards = [
  {
    titleKey: 'slide6.cards.fp8.title',
    subtitleKey: 'slide6.cards.fp8.subtitle',
    accent: 'bg-gradient-to-b from-emerald-400/15 via-white/80 to-white/95'
  },
  {
    titleKey: 'slide6.cards.awq.title',
    subtitleKey: 'slide6.cards.awq.subtitle',
    accent: 'bg-gradient-to-b from-amber-400/15 via-white/80 to-white/95'
  },
  {
    titleKey: 'slide6.cards.tokenizer.title',
    subtitleKey: 'slide6.cards.tokenizer.subtitle',
    accent: 'bg-gradient-to-b from-sky-400/15 via-white/80 to-white/95'
  },
  {
    titleKey: 'slide6.cards.singleGpu.title',
    subtitleKey: 'slide6.cards.singleGpu.subtitle',
    accent: 'bg-gradient-to-b from-rose-500/20 via-white/80 to-white/95'
  },
  {
    titleKey: 'slide6.cards.llamaCpp.title',
    subtitleKey: 'slide6.cards.llamaCpp.subtitle',
    accent: 'bg-gradient-to-b from-purple-500/15 via-white/80 to-white/95'
  },
  {
    titleKey: 'slide6.cards.mtp.title',
    subtitleKey: 'slide6.cards.mtp.subtitle',
    accent: 'bg-gradient-to-b from-indigo-500/15 via-white/80 to-white/95'
  }
]
</script>
