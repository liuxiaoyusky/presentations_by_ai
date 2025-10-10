<template>
  <div class="two-col" :style="gridStyle">
    <div class="left"><slot name="left" /></div>
    <div class="right"><slot name="right" /></div>
  </div>
</template>

<script setup lang="ts">
const props = withDefaults(defineProps<{
  leftRatio?: number
  rightRatio?: number
  gap?: string
  stackAt?: string
}>(), {
  leftRatio: 3,
  rightRatio: 2,
  gap: 'clamp(1rem, 2.4vw, 2rem)',
  stackAt: '860px'
})

const gridStyle = {
  '--left': String(props.leftRatio),
  '--right': String(props.rightRatio),
  '--gap': props.gap,
  '--stack-at': props.stackAt
} as Record<string, string>
</script>

<style scoped>
.two-col {
  display: grid;
  grid-template-columns: minmax(280px, 1fr) minmax(280px, 1fr);
  gap: var(--gap);
}

@media (min-width: 860px) {
  .two-col {
    grid-template-columns: minmax(320px, calc(var(--left) * 1fr)) minmax(320px, calc(var(--right) * 1fr));
  }
}
</style>
