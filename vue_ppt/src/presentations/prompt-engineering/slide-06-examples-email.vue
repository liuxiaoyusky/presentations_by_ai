<script setup lang="ts">
defineProps<{ isActive?: boolean; isPreview?: boolean }>()
</script>

<template>
  <section class="container mx-auto max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14">
    <div class="mb-8">
      <h2 class="inline-block text-5xl md:text-6xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-[#93AD90] via-[#F4CDA5] to-[#E26A6A]">
        1.5.1 Email Writer
      </h2>
      <p class="mt-3 text-slate-700 text-lg md:text-xl">Professional workplace communication requiring polite, concise, and collaborative tone.</p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
      <article class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Template</h3>
        <pre class="mt-3 whitespace-pre-wrap text-slate-800 text-sm md:text-base">Context:
I work in a professional environment and often need to email my coworkers. The tone should be polite, concise, and collaborative. The emails may involve updates, requests, or responses.

Objective:
Help me draft or edit an email that communicates my message effectively while maintaining professionalism and clarity.

Style:
Use a tone that is:

Courteous but direct
Neutral and professional (avoid overly formal or casual phrasing)
Concise — focus on clarity and purpose
Culturally appropriate for workplace communication

Task:
Write or refine my email to ensure it:

Has a clear subject line and logical structure
Opens with context or appreciation
States the main message or request succinctly
Ends with a polite closing and call to action (if needed)
Optionally includes a short sign-off

Action:
I will provide my rough draft or main points. You will return a polished, professional email version ready to send.

Result:
A final email draft that is polite, concise, and professional — suitable for workplace communication.</pre>
      </article>
      <article class="rounded-2xl border border-slate-200/30 bg-white/70 backdrop-blur-md shadow-xl p-6 md:p-8">
        <h3 class="text-2xl md:text-3xl font-bold text-slate-900">Sample</h3>
        <div class="mt-3">
          <p class="font-semibold">Sample Input</p>
          <pre class="mt-2 whitespace-pre-wrap text-slate-800 text-sm md:text-base">I need to email my manager about requesting time off next week for a family event.
I want to be professional but also show that I've planned ahead.</pre>
        </div>
        <div class="mt-4">
          <p class="font-semibold">Sample Output without prompt</p>
          <pre class="mt-2 whitespace-pre-wrap text-slate-800 text-sm md:text-base">Subject: Request for Time Off – [Your Full Name] (Next Week, [Date Range])

Dear [Manager’s Name],

I hope this email finds you well. I am writing to formally request time off from work next week to attend an important family event – specifically, from Monday, October 14th to  Friday, October 18th. This event has been planned in advance, and I have taken steps to ensure my responsibilities are fully covered during my absence to minimize any impact on the team’s workflow.

To prepare for this time off:
...(500 words detail)...

Thank you,
Sky</pre>
        </div>
        <div class="mt-4">
          <p class="font-semibold">Sample Output with prompt</p>
          <pre class="mt-2 whitespace-pre-wrap text-slate-800 text-sm md:text-base">Subject: Request for Time Off - March 15-17, 2024

Hi Sarah,

I hope this email finds you well. I would like to request time off from March 15th to March 17th for a family event.

I have ensured that all my current projects are on track and have coordinated with John to cover any urgent matters during my absence.

Thank you for considering my request. Please let me know if you need any additional information.

Best regards,
Alex</pre>
        </div>
      </article>
    </div>
  </section>
</template>

<style scoped>
/* Tailwind utilities drive layout */
</style>
