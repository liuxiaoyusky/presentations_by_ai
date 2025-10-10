<template>
  <section class="slide-section" :class="{ center }">
    <div class="container" :style="{ maxWidth }">
      <slot />
    </div>
  </section>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  maxWidth?: string
  center?: boolean
}>(), {
  maxWidth: '1100px',
  center: false
})
</script>

<style scoped>
.slide-section {
  display: flex;
  min-height: 100vh;
  width: 100vw;
  padding: clamp(2rem, 6vw, 4rem);
  background: transparent;
  color: rgb(var(--text-primary));
}

.slide-section.center {
  align-items: center;
  justify-content: center;
}

.container {
  width: min(var(--max-w, 1100px), 100%);
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: clamp(1rem, 2.4vw, 2rem);
}
</style>
