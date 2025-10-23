<script setup lang="ts">
import { ref, computed } from 'vue'
import WebEmbed from '@/shared/components/WebEmbed.vue'

defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '2.3 Reference and Adapt Website Prompts'

type TabId = 'gh' | 'cookbook' | 'jimeng'
const tabs: { id: TabId; label: string; url: string }[] = [
  { id: 'gh', label: 'Awesome Prompts (GitHub)', url: 'https://github.com/f/awesome-chatgpt-prompts' },
  { id: 'cookbook', label: 'OpenAI Cookbook', url: 'https://cookbook.openai.com/' },
  { id: 'jimeng', label: 'Jimeng AI Tool Home', url: 'https://jimeng.jianying.com/ai-tool/home' }
]
const active = ref<TabId>('gh')
const currentUrl = computed(() => tabs.find(t => t.id === active.value)?.url || 'about:blank')
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <p class="mt-3 text-slate-700 text-lg md:text-xl">Switch tabs to preview reference sites inline. If blank, the site blocks embedding.</p>

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
      <Transition name="fade" mode="out-in">
        <div :key="active">
          <WebEmbed :src="currentUrl" title="Reference website" height="68vh" />
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
