<script setup lang="ts">
import { computed } from 'vue'

import BackgroundManager from '../../shared/backgrounds/background-manager.vue'
import { backgroundRegistry } from '../../shared/backgrounds/registry'
import {
  createPresentationContext,
  providePresentationContext
} from '../../shared/presentation/presentation-context'
import { useDeckI18n } from '../../shared/i18n/use-deck-i18n'
import type { LocaleMeta } from '../../shared/i18n/types'

import PptContainer from '@/shared/ppt-container.vue'

import Slide1Title from '../ai-skill-tree/slide-1-title.vue'
import Slide2Painpoints from '../ai-skill-tree/slide-2-painpoints.vue'
import Slide3Essence from '../ai-skill-tree/slide-3-essence.vue'
import Slide4Metaphor from '../ai-skill-tree/slide-4-metaphor.vue'
import Slide5DontFear from '../ai-skill-tree/slide-5-dont-fear.vue'
import Slide6Workflow from '../ai-skill-tree/slide-6-workflow.vue'
import Slide7Setup from '../ai-skill-tree/slide-7-setup.vue'
import Slide8Demo from '../ai-skill-tree/slide-8-demo.vue'
import Slide9Knowledge from '../ai-skill-tree/slide-9-knowledge.vue'
import Slide10PageFile from '../ai-skill-tree/slide-10-page-file.vue'
import Slide11TemplateDesign from '../ai-skill-tree/slide-11-template-design.vue'
import Slide12ComponentReuse from '../ai-skill-tree/slide-12-component-reuse.vue'
import Slide13DeleteNotRedo from '../ai-skill-tree/slide-13-delete-not-redo.vue'
import Slide14ForgetSoftwareEngineering from '../ai-skill-tree/slide-14-forget-software-engineering.vue'
import Slide15LearnFrontendKnowledge from '../ai-skill-tree/slide-15-learn-frontend-knowledge.vue'
import Slide16AiCodeMindset from '../ai-skill-tree/slide-16-ai-code-mindset.vue'
import Slide17CallToAction from '../ai-skill-tree/slide-17-call-to-action.vue'

const localeOptions: LocaleMeta[] = [
  { code: 'zh-Hans', label: 'Chinese (Simplified)', nativeLabel: '简体中文', direction: 'ltr' },
  { code: 'en', label: 'English', nativeLabel: 'English', direction: 'ltr' }
]

const presentationContext = createPresentationContext({
  defaults: {
    backgroundId: 'demo-particles',
    locale: 'zh-Hans'
  },
  backgrounds: backgroundRegistry,
  locales: [...localeOptions],
  contextKey: 'ai-skill-tree-cool',
  persist: true
})

providePresentationContext(presentationContext)

const { t } = useDeckI18n('ai-skill-tree-cool', {
  locale: computed(() => presentationContext.state.locale),
  fallbackLocale: 'en'
})

const shortcut = computed(() => {
  if (typeof window === 'undefined') return 'Ctrl + Shift + P'
  const isMac = /Mac|iPod|iPhone|iPad/.test(window.navigator.platform)
  return isMac ? '⌘ + ⇧ + P' : 'Ctrl + Shift + P'
})

const deckTitle = computed(() => t('meta.title'))
const thumbnailsLabel = computed(() => t('labels.thumbnails'))
const activeBackground = presentationContext.activeBackground
const activeLocale = presentationContext.activeLocale

const slides = [
  Slide1Title,
  Slide2Painpoints,
  Slide3Essence,
  Slide4Metaphor,
  Slide5DontFear,
  Slide6Workflow,
  Slide7Setup,
  Slide8Demo,
  Slide9Knowledge,
  Slide10PageFile,
  Slide11TemplateDesign,
  Slide12ComponentReuse,
  Slide13DeleteNotRedo,
  Slide14ForgetSoftwareEngineering,
  Slide15LearnFrontendKnowledge,
  Slide16AiCodeMindset,
  Slide17CallToAction
]
</script>

<template>
  <div class="presentation-root">
    <BackgroundManager />

    <div class="glow-overlay" aria-hidden="true"></div>

    <section class="hero-overlay">
      <div class="hero-content">
        <div class="hero-chip">
          <span class="chip-label">{{ t('labels.currentBackground') }}:</span>
          <span>{{ activeBackground?.name ?? '—' }}</span>
        </div>
        <h1 class="hero-title">{{ t('hero.title') }}</h1>
        <p class="hero-subtitle">{{ t('hero.subtitle') }}</p>
        <div class="hero-meta">
          <span class="hero-meta-chip">
            <span class="chip-label">{{ t('labels.activeLocale') }}:</span>
            <span>{{ activeLocale?.nativeLabel ?? activeLocale?.label ?? '—' }}</span>
          </span>
          <span class="hero-meta-hint">
            {{ t('labels.openSettingsHint', { shortcut: shortcut }) }}
          </span>
        </div>
      </div>
    </section>

    <main class="presentation-main">
      <div class="deck-shell">
        <PptContainer
          :slides="slides"
          :title="deckTitle"
          :thumbnails-label="thumbnailsLabel"
        />
      </div>
    </main>
  </div>
</template>

<style scoped>
.presentation-root {
  position: relative;
  display: flex;
  height: 100vh;
  width: 100vw;
  overflow: hidden;
  background: radial-gradient(circle at 15% 20%, rgba(56, 189, 248, 0.18), transparent 55%),
    radial-gradient(circle at 85% 25%, rgba(14, 165, 233, 0.2), transparent 50%),
    rgb(var(--surface));
  color: rgb(var(--text-primary));
}

.glow-overlay {
  position: absolute;
  inset: -25%;
  background: conic-gradient(from 120deg at 50% 50%, rgba(59, 130, 246, 0.15), transparent 35%, rgba(236, 72, 153, 0.2), transparent 70%);
  filter: blur(120px);
  opacity: 0.7;
  pointer-events: none;
}

.hero-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  padding: clamp(2rem, 6vw, 4rem) clamp(2rem, 7vw, 5rem) clamp(8rem, 16vw, 14rem);
  display: flex;
  justify-content: center;
  pointer-events: none;
  z-index: 5;
}

.hero-content {
  width: min(100%, 960px);
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 1.5rem;
  text-align: left;
  color: rgb(var(--text-primary));
  padding: clamp(1.5rem, 3vw, 2.5rem) clamp(2rem, 5vw, 3.5rem);
  border-radius: 2rem;
  background: linear-gradient(135deg, rgba(15, 23, 42, 0.16), rgba(15, 23, 42, 0.4));
  backdrop-filter: blur(20px);
  border: 1px solid rgba(148, 163, 184, 0.2);
  box-shadow: 0 35px 120px rgba(15, 23, 42, 0.35);
  pointer-events: auto;
}

.hero-chip {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.35rem 0.9rem;
  border-radius: 9999px;
  background: rgba(15, 23, 42, 0.55);
  border: 1px solid rgba(59, 130, 246, 0.35);
  font-size: 0.85rem;
  color: rgba(226, 232, 240, 0.9);
}

.chip-label {
  font-weight: 600;
  color: rgba(191, 219, 254, 0.95);
}

.hero-title {
  margin: 0;
  font-size: clamp(2.4rem, 5vw, 3.8rem);
  font-weight: 700;
  letter-spacing: -0.04em;
  text-shadow: 0 0 28px rgba(59, 130, 246, 0.45);
}

.hero-subtitle {
  margin: 0;
  font-size: clamp(1rem, 2vw, 1.25rem);
  color: rgba(148, 163, 184, 0.9);
  max-width: 36rem;
}

.hero-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem 1.25rem;
  align-items: center;
  font-size: 0.85rem;
  color: rgba(191, 219, 254, 0.88);
}

.hero-meta-chip {
  display: inline-flex;
  align-items: center;
  gap: 0.4rem;
  padding: 0.3rem 0.8rem;
  border-radius: 9999px;
  background: rgba(15, 23, 42, 0.55);
  border: 1px solid rgba(251, 191, 36, 0.3);
}

.hero-meta-hint {
  font-size: 0.75rem;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: rgba(148, 163, 184, 0.7);
}

.presentation-main {
  position: relative;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  padding: clamp(2rem, 5vw, 4rem);
}

.deck-shell {
  position: relative;
  height: 100%;
  width: min(1200px, 100%);
  display: flex;
  flex-direction: column;
  justify-content: center;
  border-radius: 2.5rem;
  padding: clamp(1.5rem, 3vw, 2.5rem);
  background: linear-gradient(135deg, rgba(241, 245, 249, 0.22), rgba(248, 250, 252, 0.08));
  box-shadow: 0 45px 120px rgba(15, 23, 42, 0.35);
  border: 1px solid rgba(148, 163, 184, 0.22);
  backdrop-filter: blur(24px);
}

.deck-shell :deep(.ppt-container) {
  @apply bg-transparent;
}

.deck-shell :deep(.controls) {
  @apply fixed bottom-6 left-1/2 flex -translate-x-1/2 items-center gap-3 rounded-2xl border border-white/20 bg-white/10 px-3 py-1.5 text-xs text-text-primary shadow-xl shadow-black/40 backdrop-blur-xl;
}

.deck-shell :deep(.control-btn) {
  @apply flex h-9 w-9 items-center justify-center rounded-full bg-white/90 text-slate-900 text-sm font-semibold shadow-md shadow-black/30 ring-1 ring-black/5 transition hover:bg-white focus-visible:outline focus-visible:outline-2 focus-visible:outline-cyan-300 disabled:cursor-not-allowed disabled:opacity-40;
}

.deck-shell :deep(.slide-info) {
  @apply min-w-[56px] text-center text-xs font-semibold text-slate-900;
}

.deck-shell :deep(.progress-bar) {
  @apply fixed inset-x-0 bottom-0 h-[3px] bg-slate-900/20;
}

.deck-shell :deep(.progress) {
  @apply h-full bg-gradient-to-r from-cyan-400 via-indigo-500 to-fuchsia-500 transition-all duration-300;
}

.deck-shell :deep(.thumbnails) {
  @apply fixed right-6 top-1/2 flex max-h-[78vh] w-72 -translate-y-1/2 flex-col overflow-hidden rounded-xl bg-slate-900/90 shadow-2xl shadow-slate-900/50 backdrop-blur-xl;
}

.deck-shell :deep(.thumbnails-header) {
  @apply flex items-center justify-between border-b border-white/10 px-5 py-4 text-text-primary;
}

.deck-shell :deep(.thumbnails-header h3) {
  @apply m-0 text-base font-semibold text-text-primary;
}

.deck-shell :deep(.thumbnails-header button) {
  @apply flex h-6 w-6 items-center justify-center rounded-full text-base text-text-primary transition hover:bg-white/10;
}

.deck-shell :deep(.thumbnails-grid) {
  @apply max-h-[60vh] overflow-y-auto px-4 py-4;
}

.deck-shell :deep(.thumbnail) {
  @apply relative mb-3 h-28 w-full overflow-hidden rounded-lg bg-white/5 transition hover:scale-[1.02] hover:bg-white/10;
}

.deck-shell :deep(.thumbnail.active) {
  @apply border-2 border-cyan-400 bg-cyan-400/20;
}

.deck-shell :deep(.thumbnail-number) {
  @apply absolute left-2 top-2 rounded-md bg-slate-900/80 px-2 py-1 text-xs font-semibold text-text-primary shadow-sm shadow-black/40;
}

@media (max-width: 1024px) {
  .hero-overlay {
    padding-bottom: clamp(10rem, 32vw, 18rem);
  }

  .deck-shell :deep(.thumbnails) {
    @apply right-5 w-[calc(100vw-48px)];
  }
}

@media (max-width: 768px) {
  .hero-content {
    gap: 1rem;
    padding: 1.5rem;
  }

  .hero-title {
    font-size: clamp(2rem, 8vw, 3rem);
  }

  .hero-meta {
    flex-direction: column;
    align-items: flex-start;
  }

  .deck-shell {
    border-radius: 1.5rem;
    padding: clamp(1rem, 4vw, 1.5rem);
  }

  .deck-shell :deep(.controls) {
    @apply bottom-4 gap-2 px-4 py-2;
  }

  .deck-shell :deep(.control-btn) {
    @apply h-10 w-10;
  }
}
</style>
