<template>
  <div class="card-grid" :style="gridStyle">
    <slot />
  </div>
</template>

<script setup lang="ts">
const props = withDefaults(defineProps<{
  minCol?: string
  gap?: string
}>(), {
  minCol: '280px',
  gap: 'clamp(1rem, 2vw, 1.5rem)'
})

const gridStyle = {
  '--min-col': props.minCol,
  '--gap': props.gap
} as Record<string, string>
</script>

<style scoped>
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(var(--min-col), 1fr));
  gap: var(--gap);
}
</style>
