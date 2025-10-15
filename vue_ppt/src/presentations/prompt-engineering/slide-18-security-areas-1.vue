<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
const title = '3. Data Security & Privacy'
const table1 = `| Risk Area | Description | Solutions |
|-----------|-------------|-----------|
| **Input** | Users may share Personal information, financial, or confidential data — be cautious | • Minimize data<br>• Filter inappropriate content |
| **Output** | LLMs can leak internal patterns; filter outputs to avoid sensitive disclosures | • Post-generation filters<br>• Human review for critical use |
| **Abuse** | Models can be misused; enforce limits/monitoring (e.g., no investment advice in support workflows) | • Rate limits/quotas<br>• Behavior monitoring<br>• Prompt-level guardrails |
| **Access Control** | Restrict who/what can access models and interfaces | • MFA (Multi-Factor Authentication)<br>• Periodic audits/log reviews |
| **Storage** | Sensitive data at rest | • Encrypt<br>• Least-privilege access<br>• Prefer internal models for sensitive scenarios |`
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <h2 class="text-4xl md:text-5xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">{{ title }}</h2>
    <article class="mt-6 rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8 overflow-x-auto">
      <pre class="whitespace-pre text-slate-800 text-sm md:text-base" v-html="table1"></pre>
    </article>
  </section>
</template>

<style scoped>
/* Tailwind utilities */
</style>
