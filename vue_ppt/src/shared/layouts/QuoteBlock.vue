<template>
  <blockquote class="quote">
    <slot />
  </blockquote>
</template>

<script setup lang="ts">
// simple styled quote aligned with theme tokens
</script>

<style scoped>
.quote {
  margin: 0;
  padding-left: 1rem;
  border-left: 4px solid rgba(56, 189, 248, 0.6);
  font-size: clamp(1.1rem, 2.2vw, 1.4rem);
  line-height: 1.6;
  color: rgba(var(--text-muted), 0.95);
}
</style>
