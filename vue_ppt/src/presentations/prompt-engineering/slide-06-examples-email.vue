<script setup lang="ts">
import { computed, ref } from 'vue'
import SlideSection from '@/shared/layouts/SlideSection.vue'
import MarkdownBlock from '@/shared/components/MarkdownBlock.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()

const steps = [
  { id: 1, title: 'Simple Input' },
  { id: 2, title: 'Simple Output' },
  { id: 3, title: 'Prompt Input' },
  { id: 4, title: 'Prompt Output' }
] as const

const active = ref(0)

const carouselStates = computed(() => {
  const total = steps.length
  return steps.map((_, index) => {
    const relative = (index - active.value + total) % total
    if (relative === 0) return 'is-active'
    if (relative === 1) return 'is-next'
    if (relative === total - 1) return 'is-prev'
    return ''
  })
})

const setActive = (index: number) => {
  active.value = index
}

const isStepActive = (index: number) => index === active.value

// Copy helpers for current panel
const copying = ref<number | null>(null)
const getContentFor = (index: number) => {
  switch (index) {
    case 0: return mdSimpleInput
    case 1: return mdSimpleOutput
    case 2: return mdPromptInput
    default: return mdPromptOutput
  }
}
const copyContent = async (index: number) => {
  const text = getContentFor(index)
  try {
    await navigator.clipboard.writeText(text)
  } catch {
    const ta = document.createElement('textarea')
    ta.value = text
    ta.style.position = 'fixed'
    ta.style.opacity = '0'
    document.body.appendChild(ta)
    ta.focus(); ta.select()
    try { document.execCommand('copy') } catch {}
    document.body.removeChild(ta)
  }
  copying.value = index
  setTimeout(() => { if (copying.value === index) copying.value = null }, 1200)
}

const mdSimpleInput = `I need to email my manager about requesting time off next week for a family event.

I want to be professional but also show that I've planned ahead.`

const mdSimpleOutput = `Subject: Request for Time Off – [Your Full Name] (Next Week, [Date Range])

Dear [Manager’s Name],

I hope this email finds you well. I am writing to formally request time off from work next week to attend an important family event – specifically, from Monday, October 14th to  Friday, October 18th. This event has been planned in advance, and I have taken steps to ensure my responsibilities are fully covered during my absence to minimize any impact on the team’s workflow.

To prepare for this time off:
- ... (500 words detail) ...

Thank you,
Sky`

const mdPromptInput = `## Context
I work in a professional environment and often need to email my coworkers. The tone should be polite, concise, and collaborative. The emails may involve updates, requests, or responses.

## Objective
Help me draft or edit an email that communicates my message effectively while maintaining professionalism and clarity.

## Style
Use a tone that is:
- Courteous but direct
- Neutral and professional (avoid overly formal or casual phrasing)
- Concise — focus on clarity and purpose
- Culturally appropriate for workplace communication

## Task
Write or refine my email to ensure it:
- Has a clear subject line and logical structure
- Opens with context or appreciation
- States the main message or request succinctly
- Ends with a polite closing and call to action (if needed)
- Optionally includes a short sign-off

## Action
I will provide my rough draft or main points. You will return a polished, professional email version ready to send.

## Result
A final email draft that is polite, concise, and professional — suitable for workplace communication.`

const mdPromptOutput = `Subject: Request for Time Off - March 15-17, 2024

Hi Sarah,

I hope this email finds you well. I would like to request time off from March 15th to March 17th for a family event.

I have ensured that all my current projects are on track and have coordinated with John to cover any urgent matters during my absence.

Thank you for considering my request. Please let me know if you need any additional information.

Best regards,
Alex`
</script>

<template>
  <SlideSection maxWidth="1200px">
    <!-- Background blur overlay: only when this slide is active -->
    <div v-if="isActive && !isPreview" class="bg-overlay" aria-hidden="true"></div>

    <div class="slide-content">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">1.5.1 Email Writer</h2>
      <p class="mt-3 text-slate-700 text-lg md:text-2xl">Professional workplace communication requiring polite, concise, and collaborative tone.</p>
    </div>

    <header class="flow-track slide-content" role="group" aria-label="Email Writer modes">
      <div class="flow-frame">
        <div v-for="(step, index) in steps" :key="step.id" class="flow-segment" :class="`variant-${index + 1}`">
          <button class="flow-node" type="button" :class="{ active: isStepActive(index) }" @click="setActive(index)">
            <span class="flow-number">{{ step.id }}</span>
            <span class="flow-label">{{ step.title }}</span>
          </button>
          <div v-if="index < steps.length - 1" class="flow-connector" aria-hidden="true">
            <svg viewBox="0 0 120 36" xmlns="http://www.w3.org/2000/svg">
              <path d="M5 18 H85" stroke="rgba(126, 153, 240, 0.45)" stroke-width="6" stroke-linecap="round" />
              <path d="M72 8 L110 18 L72 28 Z" :fill="`url(#arrowGradient${step.id})`" />
              <defs>
                <linearGradient :id="`arrowGradient${step.id}`" x1="72" y1="18" x2="110" y2="18" gradientUnits="userSpaceOnUse">
                  <stop offset="0%" stop-color="rgba(67, 97, 238, 0.8)" />
                  <stop offset="100%" stop-color="rgba(14, 165, 233, 0.75)" />
                </linearGradient>
              </defs>
            </svg>
          </div>
        </div>
      </div>
    </header>

    <div class="carousel slide-content" role="region" aria-live="polite" aria-label="Email Writer content">
      <div class="carousel-item" :class="carouselStates[0]">
        <article class="panel">
          <div class="panel-head">
            <h3 class="panel-title">Simple Input</h3>
            <button type="button" class="copy-btn" :aria-label="`Copy Simple Input`" @click="copyContent(0)">
              <span v-if="copying === 0">Copied</span>
              <span v-else>Copy</span>
            </button>
          </div>
          <div class="panel-content">
            <MarkdownBlock :content="mdSimpleInput" />
          </div>
        </article>
      </div>
      <div class="carousel-item" :class="carouselStates[1]">
        <article class="panel">
          <div class="panel-head">
            <h3 class="panel-title">Simple Output</h3>
            <button type="button" class="copy-btn" :aria-label="`Copy Simple Output`" @click="copyContent(1)">
              <span v-if="copying === 1">Copied</span>
              <span v-else>Copy</span>
            </button>
          </div>
          <div class="panel-content">
            <MarkdownBlock :content="mdSimpleOutput" />
          </div>
        </article>
      </div>
      <div class="carousel-item" :class="carouselStates[2]">
        <article class="panel">
          <div class="panel-head">
            <h3 class="panel-title">Prompt Input</h3>
            <button type="button" class="copy-btn" :aria-label="`Copy Prompt Input`" @click="copyContent(2)">
              <span v-if="copying === 2">Copied</span>
              <span v-else>Copy</span>
            </button>
          </div>
          <div class="panel-content">
            <MarkdownBlock :content="mdPromptInput" />
          </div>
        </article>
      </div>
      <div class="carousel-item" :class="carouselStates[3]">
        <article class="panel">
          <div class="panel-head">
            <h3 class="panel-title">Prompt Output</h3>
            <button type="button" class="copy-btn" :aria-label="`Copy Prompt Output`" @click="copyContent(3)">
              <span v-if="copying === 3">Copied</span>
              <span v-else>Copy</span>
            </button>
          </div>
          <div class="panel-content">
            <MarkdownBlock :content="mdPromptOutput" />
          </div>
        </article>
      </div>
    </div>
  </SlideSection>
</template>

<style scoped>
.bg-overlay {
  position: fixed;
  inset: 0;
  z-index: 0;
  background: rgba(15, 23, 42, 0.28); /* dark wash */
  backdrop-filter: blur(18px) saturate(0.9);
}

.slide-content { position: relative; z-index: 1; }

.flow-track { width: min(100%, 1080px); display: flex; justify-content: center; }
.flow-frame {
  flex: 1; display: flex; align-items: center; justify-content: space-between;
  gap: clamp(0.8rem, 2.5vw, 1.6rem);
  padding: clamp(0.9rem, 3vw, 1.3rem) clamp(1.4rem, 4vw, 2.8rem);
  border-radius: clamp(36px, 8vw, 64px);
  background:
    radial-gradient(circle at 12% 20%, rgba(79, 70, 229, 0.18), transparent 55%),
    radial-gradient(circle at 88% 80%, rgba(236, 72, 153, 0.12), transparent 60%),
    linear-gradient(110deg, rgba(248, 250, 252, 0.86), rgba(255, 255, 255, 0.9));
  box-shadow: inset 0 0 0 1px rgba(148, 163, 184, 0.12), 0 24px 52px rgba(15, 23, 42, 0.08);
}
.flow-segment { display: flex; align-items: center; gap: clamp(0.6rem, 2vw, 1.2rem); }
.flow-node {
  position: relative; display: flex; align-items: center; gap: 0.55rem;
  min-width: clamp(120px, 20vw, 180px);
  padding: clamp(0.85rem, 2.2vw, 1.2rem) clamp(1rem, 2.8vw, 1.6rem);
  border: none; border-radius: 999px; background: rgba(255, 255, 255, 0.88);
  color: #0f172a; font-size: clamp(0.9rem, 2vw, 1.05rem); font-weight: 600; letter-spacing: 0.01em;
  cursor: pointer; transition: transform 280ms ease, box-shadow 280ms ease, background 280ms ease, color 280ms ease;
  box-shadow: 0 12px 28px rgba(15, 23, 42, 0.08);
}
.flow-node:hover { transform: translateY(-3px); }
.flow-node.active { box-shadow: 0 20px 50px rgba(79, 70, 229, 0.28); }
.flow-number {
  display: inline-flex; align-items: center; justify-content: center; width: 1.9rem; height: 1.9rem;
  border-radius: 999px; background: rgba(15, 23, 42, 0.08); font-size: 0.95em; font-weight: 700;
}
.flow-label { flex: 1; text-align: left; line-height: 1.3; }
.flow-connector { flex: 0 0 auto; display: flex; align-items: center; width: clamp(3rem, 6vw, 4.2rem); height: clamp(1.4rem, 3.5vw, 2.1rem); }
.flow-connector svg { width: 100%; height: 100%; }

.carousel { position: relative; width: 100%; max-width: 1100px; height: clamp(420px, 64vh, 600px); margin-top: clamp(1.5rem, 4vw, 2.2rem); perspective: 1400px; }
.carousel::before { content: ''; position: absolute; inset: auto; bottom: -110px; left: 50%; width: clamp(420px, 70%, 760px); height: 240px; transform: translateX(-50%); background: radial-gradient(circle, rgba(15, 23, 42, 0.22), transparent 70%); filter: blur(32px); z-index: 0; }
.carousel-item { position: absolute; inset: 0; display: flex; align-items: center; justify-content: center; transition: transform 520ms cubic-bezier(0.22, 0.61, 0.36, 1), opacity 320ms ease, filter 320ms ease; will-change: transform; }
.panel { width: clamp(360px, 88%, 960px); max-height: 100%; display: flex; flex-direction: column; overflow: hidden; border-radius: 20px; box-shadow: 0 40px 80px rgba(15, 23, 42, 0.22); border: 1px solid rgba(255, 255, 255, 0.35); background: rgba(255, 255, 255, 0.95); padding: clamp(1rem, 3vw, 1.5rem); }
.carousel-item.is-active .panel { background: #ffffff; border-color: rgba(148, 163, 184, 0.22); box-shadow: 0 50px 100px rgba(15, 23, 42, 0.28); }
.panel-title { margin: 0 0 0.5rem; font-size: clamp(1.2rem, 2.4vw, 1.6rem); font-weight: 800; color: #0f172a; }
.panel-head { display: flex; align-items: center; justify-content: space-between; gap: 0.75rem; }
.copy-btn {
  display: inline-flex;
  align-items: center;
  gap: 0.4rem;
  padding: 0.4rem 0.75rem;
  border-radius: 999px;
  border: 1px solid rgba(148, 163, 184, 0.28);
  background: #0f172a;
  color: #f8fafc;
  font-size: 0.8rem;
  font-weight: 700;
  letter-spacing: 0.02em;
  box-shadow: 0 8px 18px rgba(15, 23, 42, 0.12);
  transition: transform 180ms ease, box-shadow 180ms ease, background 180ms ease;
}
.copy-btn:hover { transform: translateY(-2px); box-shadow: 0 12px 26px rgba(15, 23, 42, 0.18); background: #111827; }
.copy-btn:active { transform: translateY(0); }
.panel-content { flex: 1 1 auto; min-height: 0; overflow: auto; }

.carousel-item.is-active { z-index: 3; transform: translateX(0) translateZ(120px) rotateY(0deg); filter: none; }
.carousel-item.is-next { z-index: 2; transform: translateX(280px) translateZ(-200px) rotateY(-18deg) scale(0.9); filter: blur(10px) brightness(0.55) saturate(0.8); opacity: 0.38; pointer-events: none; }
.carousel-item.is-prev { z-index: 1; transform: translateX(-280px) translateZ(-220px) rotateY(18deg) scale(0.88); filter: blur(12px) brightness(0.5) saturate(0.75); opacity: 0.35; pointer-events: none; }

@media (max-width: 900px) {
  .flow-frame { flex-direction: column; align-items: stretch; gap: 0.85rem; border-radius: 32px; }
  .flow-node { border-radius: 16px; padding: 1rem 1.2rem; }
  .flow-number { width: 2rem; height: 2rem; }
  .flow-connector { display: none; }
  .carousel { height: clamp(360px, 60vh, 520px); }
  .carousel-item.is-next { transform: translateX(160px) translateZ(-160px) rotateY(-16deg) scale(0.9); }
  .carousel-item.is-prev { transform: translateX(-160px) translateZ(-160px) rotateY(16deg) scale(0.9); }
}

@media (prefers-reduced-motion: reduce) { .flow-node, .carousel-item { transition-duration: 0.01ms !important; animation-duration: 0.01ms !important; } }

@media print {
  /* Keep visuals similar to screen but flatten transforms */
  .carousel { height: auto; perspective: none; }
  .carousel::before { display: none; }
  .carousel-item { position: static; transform: none !important; filter: none !important; opacity: 1 !important; page-break-inside: avoid; break-inside: avoid; margin-bottom: 1.5rem; }
  .carousel-item + .carousel-item { page-break-before: always; break-before: page; }
}
</style>
