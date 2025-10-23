<template>
  <div class="web-embed">
    <iframe
      class="frame"
      :src="src"
      :title="title || 'Embedded content'"
      :style="{ height }"
      referrerpolicy="no-referrer"
      sandbox="allow-scripts allow-same-origin allow-forms allow-popups"
      allow="clipboard-read; clipboard-write; fullscreen; accelerometer; autoplay; encrypted-media; picture-in-picture"
    />
    <p v-if="showHint" class="hint">
      If this area looks blank, the site likely blocks embedding (X-Frame-Options/CSP). Try another source or use a screenshot.
    </p>
  </div>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  src: string
  title?: string
  height?: string
  showHint?: boolean
}>(), {
  title: 'Embedded content',
  height: '70vh',
  showHint: true
})
</script>

<style scoped>
.web-embed {
  width: 100%;
}
.frame {
  display: block;
  width: 100%;
  border: 1px solid rgba(148, 163, 184, 0.35);
  border-radius: 16px;
  background: #ffffff;
}
.hint {
  margin-top: 0.5rem;
  font-size: 0.9rem;
  color: rgba(15, 23, 42, 0.6);
}
</style>

