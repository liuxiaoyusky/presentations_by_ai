<script setup lang="ts">
import { computed } from 'vue'

import BackgroundManager from '../../shared/backgrounds/background-manager.vue'
import { backgroundRegistry } from '../../shared/backgrounds/registry'
import { softMeshBackground } from '../../shared/backgrounds/modules/soft-mesh'
import {
  createPresentationContext,
  providePresentationContext
} from '../../shared/presentation/presentation-context'

import PptContainer from '@/shared/ppt-container.vue'

import SlideCover from './slide-01-cover.vue'
import SlideOverview from './slide-02-overview.vue'
import SlideEquation from './slide-03-core-equation.vue'
import SlideDefinition from './slide-04-prompt-definition.vue'
import SlideHowTo from './slide-05-how-to.vue'
import SlideGoodPromptSubtitle from './slide-05a-good-prompt-example.vue'
import SlideEmail from './slide-06-examples-email.vue'
import SlideTpm from './slide-07-examples-tpm.vue'
import SlidePlanner from './slide-08-examples-planner.vue'
import SlideLegal from './slide-09-examples-legal.vue'
import SlideTemplatesCommon from './slide-10-templates-common.vue'
import SlideChapter2 from './slide-10a-chapter-2.vue'
import SlideCostarOverview from './slide-10b-costar-overview.vue'
import SlideCostar from './slide-11-costar.vue'
import SlideCostarIO from './slide-11a-costar-io.vue'
import SlideTemplatesRef from './slide-15-templates-reference.vue'
import SlideTemplatesLLM from './slide-16-templates-llm.vue'
import SlideTemplatesQA from './slide-17-templates-qa.vue'
import SlideSecurity1 from './slide-18-security-areas-1.vue'
import SlideSecurityQA from './slide-20-security-qa.vue'
import SlideResOneForAll from './slide-21-resources-oneforall.vue'
import SlideResourcesMenu from './slide-20a-resources-menu.vue'
import SlideResPromptGen from './slide-22-resources-promptgen.vue'
import SlideResMedia from './slide-23-resources-media.vue'
import SlideResInternal from './slide-24-resources-internal.vue'
import SlideResOthers1 from './slide-25-resources-others-1.vue'
import SlideResLearning from './slide-27-resources-learning.vue'
import SlideTakeaways from './slide-28-takeaways.vue'
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

const deckTitle = computed(() => 'Intro to Prompt Engineering')
const thumbnailsLabel = computed(() => 'Slide previews')

const slides = [
  SlideCover,
  SlideOverview,
  SlideEquation,
  SlideDefinition,
  SlideHowTo,
  SlideGoodPromptSubtitle,
  SlideEmail,
  SlideTpm,
  SlidePlanner,
  SlideLegal,
  SlideChapter2,
  SlideTemplatesCommon,
  SlideCostarOverview,
  SlideCostar,
  SlideCostarIO,
  SlideTemplatesRef,
  SlideTemplatesLLM,
  SlideTemplatesQA,
  SlideSecurity1,
  SlideSecurityQA,
  SlideResourcesMenu,
  SlideResOneForAll,
  SlideResPromptGen,
  SlideResMedia,
  SlideResInternal,
  SlideResOthers1,
  SlideResLearning,
  SlideTakeaways
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
