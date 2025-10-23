<script setup lang="ts">
import { ref, computed } from 'vue'
import WebEmbed from '@/shared/components/WebEmbed.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '4.6 Learning Resources'

type TabId = 'openai' | 'guide' | 'andrew' | 'samples'
const tabs: { id: TabId; label: string; url: string }[] = [
  { id: 'openai', label: 'OpenAI Best Practices', url: 'https://platform.openai.com/docs/guides/gpt-best-practices' },
  { id: 'guide', label: 'Prompt Engineering Guide', url: 'https://www.promptingguide.ai/zh' },
  { id: 'andrew', label: 'Andrew Ng Course', url: 'https://www.deeplearning.ai/short-courses/chatgpt-prompt-engineering-for-developers' },
  { id: 'samples', label: 'Awesome Prompts (ai-boost)', url: 'https://github.com/ai-boost/awesome-prompts' }
]
const active = ref<TabId>('openai')
const currentTab = computed(() => tabs.find(t => t.id === active.value)!)
const currentUrl = computed(() => currentTab.value?.url || 'about:blank')

// Screenshots for sites that block embedding
const openaiImg = new URL('./assests/OpenAI\ Best\ Practices.png', import.meta.url).href
const samplesImg = new URL('./assests/Awesome\ Prompts\ (ai-boost).png', import.meta.url).href
const currentImage = computed(() => {
  if (active.value === 'openai') return openaiImg
  if (active.value === 'samples') return samplesImg
  return ''
})
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <p class="mt-3 text-slate-700 text-lg md:text-xl">Switch tabs to preview learning resources. If blank, the site blocks embedding.</p>

    <div class="mt-5 flex flex-wrap items-center gap-2">
      <button
        v-for="tab in tabs"
        :key="tab.id"
        @click="active = tab.id"
        class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/60 border border-white/40 backdrop-blur-md shadow-sm text-slate-800 transition hover:bg-white/70"
        :class="{ 'bg-gradient-to-r from-indigo-500/20 to-emerald-400/20': active === tab.id }"
        type="button"
      >
        {{ tab.label }}
      </button>
    </div>

    <div class="mt-6 rounded-3xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-3 md:p-4">
      <div class="flex items-center justify-between gap-3 mb-3">
        <span class="text-slate-600 text-xs md:text-sm truncate">{{ currentUrl }}</span>
        <a :href="currentUrl" target="_blank" rel="noopener"
           class="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-slate-900 text-white text-sm shadow hover:bg-slate-800">
          Open in new tab
        </a>
      </div>

      <Transition name="fade" mode="out-in">
        <div :key="active">
          <template v-if="currentImage">
            <div class="rounded-xl border border-slate-200/60 bg-white p-2 md:p-3 flex items-center justify-center">
              <a :href="currentUrl" target="_blank" rel="noopener" class="block">
                <img :src="currentImage" alt="Resource preview" class="block max-w-[820px] w-full h-auto rounded-lg shadow-sm" />
              </a>
            </div>
          </template>
          <template v-else>
            <WebEmbed :src="currentUrl" title="Learning resource" height="68vh" />
          </template>
        </div>
      </Transition>
    </div>
  </section>
</template>

<style scoped>
/* Subtle fade transition for tab content */
.fade-enter-active,
.fade-leave-active { transition: opacity 180ms ease-in-out; }
.fade-enter-from,
.fade-leave-to { opacity: 0; }
</style>
