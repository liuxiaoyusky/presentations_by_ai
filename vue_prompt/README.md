# Vue Prompt Project

This folder will host an interactive Vue 3 + Tailwind prompt-builder that follows the workflow outlined in `docs/how_to_create_vue3_template.md`.

## Next Steps

1. Install Node.js 22 if it is not already available (see `docs/how_to_create_vue3_template.md`).
2. Scaffold the project with `npm create vue@latest` using TypeScript, Vue Router, and Pinia.
3. Install Tailwind CSS with `npm install -D tailwindcss postcss autoprefixer` and generate the config via `npx tailwindcss init`.
4. Configure Tailwind content paths for Vite (`./index.html`, `./src/**/*.{vue,js,ts,jsx,tsx}`).
5. Import the generated `style.css` inside `src/main.ts`.
6. Run `npm run dev` to confirm the starter works before layering in prompt-specific features.

## Roadmap Preview

- **Foundation** – Align project metadata (name, description), set up Tailwind base styles, confirm router layout shell, and add global state placeholders in Pinia.
- **Prompt Builder Core** – Design data model for prompts (sections, variables, tags), create editable form components, and persist drafts via local storage or an adapter.
- **Presentation Bridge** – Expose an export flow so the crafted prompts can feed the `vue_ppt` decks (likely through JSON configs or shared modules).
- **Polish & Docs** – Document usage in `/docs`, add internationalization hooks, and create automated checks (lint/type) before integration.

As we proceed we will document additional tasks here (state management, localization, UI shells, etc.).
