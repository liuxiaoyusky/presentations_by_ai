import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      component: () => import('@/views/Home.vue')
    },
    {
      path: '/demo',
      component: () => import('@/presentations/demo/index.vue')
    },
    {
      path: '/qwen3-next-bench',
      component: () => import('@/presentations/qwen3-next-bench/index.vue')
    },
    {
      path: '/design-language-template',
      component: () => import('@/presentations/design-language-template/index.vue')
    },
    {
      path: '/ai-skill-tree',
      component: () => import('@/presentations/ai-skill-tree/index.vue')
    },
    {
      path: '/ai-skill-tree-cool',
      component: () => import('@/presentations/ai-skill-tree-cool/index.vue')
    },
    {
      path: '/prompt-engineering',
      component: () => import('@/presentations/prompt-engineering/index.vue')
    }
  ],
})

export default router
