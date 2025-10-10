<script setup lang="ts">
import { computed } from 'vue'

import BackgroundManager from '../../shared/backgrounds/background-manager.vue'
import { backgroundRegistry } from '../../shared/backgrounds/registry'
import { softMeshBackground } from '../../shared/backgrounds/modules/soft-mesh'
import {
  createPresentationContext,
  providePresentationContext
} from '../../shared/presentation/presentation-context'
import { useDeckI18n } from '../../shared/i18n/use-deck-i18n'

import PptContainer from '@/shared/ppt-container.vue'

import SlideCover from './slide-1-cover.vue'
import SlideOverview from './slide-2-overview.vue'
import SlideEquation from './slide-3-equation.vue'
import SlideDefinition from './slide-4-definition.vue'
// Additional slides will be reintroduced after polishing 1–4
// Demo-first: keep it minimal

const presentationContext = createPresentationContext({
  defaults: {
    backgroundId: 'soft-mesh',
    locale: 'en'
  },
  // Restrict backgrounds to a single, cohesive choice for this deck
  backgrounds: [softMeshBackground],
  locales: [
    {
      code: 'en',
      label: 'English',
      nativeLabel: 'English',
      direction: 'ltr'
    }
  ],
  contextKey: 'prompt-engineering',
  persist: true
})

providePresentationContext(presentationContext)

const { t } = useDeckI18n('prompt-engineering', {
  locale: computed(() => presentationContext.state.locale),
  fallbackLocale: 'en'
})

const deckTitle = computed(() => t('meta.title'))
const thumbnailsLabel = computed(() => t('labels.thumbnails'))

const slides = [
  SlideCover,
  SlideOverview,
  SlideEquation,
  SlideDefinition
]
</script>

<template>
  <div class="presentation-root theme-prompt">
    <BackgroundManager />
    <main class="presentation-main">
      <div class="deck-shell">
        <PptContainer :slides="slides" :title="deckTitle" :thumbnails-label="thumbnailsLabel" />
      </div>
    </main>
  </div>
</template>

<style scoped>
.presentation-root {
  position: relative;
  display: flex;
  min-height: 100vh;
  width: 100vw;
  background: rgba(15, 23, 42, 1);
  color: rgb(var(--text-primary));
}

.presentation-root.theme-prompt {
  /* Sample theme tokens (light) */
  --surface: 248 250 252;        /* slate-50 */
  --text-primary: 36 53 61;      /* #24353D */
  --text-muted: 71 85 105;       /* slate-600 */
  --border: 148 163 184;         /* slate-400 */
  --accent: 226 106 106;         /* #E26A6A */
  font-size: 18px;               /* scale content ~+12.5% */
}

.presentation-main {
  position: relative;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  padding: clamp(2rem, 6vw, 4rem);
}

.deck-shell {
  height: 100%;
  width: min(1200px, 100%);
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: clamp(1.25rem, 3vw, 2rem);
}

.deck-shell :deep(.ppt-container) {
  @apply bg-transparent;
}

/* Body text scaling for better legibility across slides */
.deck-shell :deep(p) {
  font-size: 1.125rem !important; /* ~18px */
  line-height: 1.65;
}

@media (min-width: 768px) {
  .deck-shell :deep(p) {
    font-size: 1.25rem !important; /* ~20px */
  }
}

.deck-shell :deep(li) {
  font-size: 1.125rem !important;
  line-height: 1.6;
}

@media (min-width: 768px) {
  .deck-shell :deep(li) {
    font-size: 1.1875rem !important; /* ~19px */
  }
}
</style>
