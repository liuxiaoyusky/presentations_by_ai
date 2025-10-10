<template>
  <article class="card" :class="variant">
    <header v-if="title || $slots.header" class="card-header">
      <slot name="header"><h3 class="card-title">{{ title }}</h3></slot>
    </header>
    <div class="card-body">
      <slot />
    </div>
    <footer v-if="$slots.footer" class="card-footer">
      <slot name="footer" />
    </footer>
  </article>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  title?: string
  variant?: 'soft' | 'solid'
}>(), {
  title: '',
  variant: 'soft'
})
</script>

<style scoped>
.card {
  border-radius: 1.25rem;
  background: rgba(255, 255, 255, 0.86);
  border: 1px solid rgba(148, 163, 184, 0.25);
  box-shadow: 0 12px 28px rgba(15, 23, 42, 0.08);
  padding: clamp(1rem, 2.4vw, 1.6rem);
}

.card.solid {
  background: #fff;
}

.card-title {
  margin: 0;
  font-size: clamp(1.2rem, 2.2vw, 1.6rem);
  font-weight: 700;
  color: rgb(var(--text-primary));
}

.card-body {
  color: rgba(var(--text-muted), 0.95);
}

.card-footer {
  margin-top: 0.75rem;
}
</style>
