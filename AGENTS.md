# AGENTS.md — Presentation Building Playbook

This repository uses a shared presentation system under `vue_ppt/src/shared/` with backgrounds, i18n, and a unified slide container. Follow these rules to keep decks consistent and easy to extend.

## Template Reference (Canonical)
- Use `vue_ppt/src/presentations/design-language-template/` as the visual reference for:
  - Title/hero layout (container width, spacing, soft glass card, animated gradient backdrop)
  - Outline/overview grid (responsive 1/2/3 column cards, indices, elevation)
  - Typography scale and spacing (e.g., title `text-5xl md:text-7xl` with tight tracking; subhead `text-lg md:text-2xl`)
- When creating or refactoring slides, mirror the layout/spacing decisions found in this template unless a deck has explicit requirements that differ.

## Shared Layout Presets (Preferred)
Located at `vue_ppt/src/shared/layouts/`:
- `SlideSection.vue` — full‑screen safe area with consistent padding
- `TwoColumn.vue` — 60/40 responsive 2‑col split for text + summary/visuals
- `CardPanel.vue` — soft glass card with consistent radius/border/shadow
- `CardGrid.vue` — responsive grid for 2–3 cards across
- `QuoteBlock.vue` — accessible callout/quote styling

Use these instead of ad‑hoc CSS where possible. Prefer Tailwind utilities with theme tokens.

## Operating Principles (Decks)
1. Single source of truth: backgrounds and navigation live in `vue_ppt/src/shared/`.
2. Discoverability: register each deck in `vue_ppt/src/router/index.ts` and add to `vue_ppt/src/views/Home.vue`.
3. Keyboard parity: overlay open `Ctrl/Cmd + Shift + P`, close `Esc`.
4. i18n: store deck strings under `src/presentations/<slug>/locales/<locale>.json` (or `src/locales/<locale>/deck-<slug>.json` if legacy). No hardcoded multi‑lingual copy in components.
   - Exception: The `prompt-engineering` deck is English‑only during development. Do not set up localization for it; inline copy in Vue components is allowed.
5. Unified presentation context: keep theme/background/locale in `presentation-context` and rely on `BackgroundManager`.
6. Tailwind v3 only.
7. Template adherence: For new slides and decks, reference `design-language-template` for layout and type scale.

## Backgrounds & Theme
- Prefer a single cohesive background per deck (e.g., `soft-mesh`) to avoid layered effects. Restrict background registry when necessary.
- Slides should have transparent shells and sit on the deck background. Use `CardPanel` or soft glass cards for legibility.

## Sizing & Legibility
- Deck shell cap: keep the content width capped at `min(1200px, 100%)` via the deck shell to prevent overly wide line lengths on large screens.
- Body text scale: target base body at ~18px on mobile and ~20px on desktop. A practical pattern:
  - `.deck-shell :deep(p) { font-size: 1.125rem; line-height: 1.65; }`
  - `@media (min-width: 768px) { .deck-shell :deep(p) { font-size: 1.25rem; } }`
  - Apply similar scaling to list items: `.deck-shell :deep(li)` ~18–19px.
- Headings (reference pattern from `design-language-template`):
  - Cover title: `text-6xl md:text-8xl`
  - Section title: `text-5xl md:text-6xl`
  - Formula or key line: `text-3xl md:text-4xl` (bold/black)
  - Card title: `text-2xl md:text-3xl`; card body: `text-base md:text-lg`
- Containers & spacing:
  - Section container: `max-w-7xl px-8 md:px-10 lg:px-12 py-10 md:py-14`
  - Use consistent soft cards for content blocks (see `CardPanel.vue`).
- Target overall scale: when in doubt, increase component and font sizing by ~30–35% over baseline app UI for presentation contexts.

## Paths
- Template reference deck: `vue_ppt/src/presentations/design-language-template/`
- Prompt deck example: `vue_ppt/src/presentations/prompt-engineering/`
- Layout presets: `vue_ppt/src/shared/layouts/`
- Router: `vue_ppt/src/router/index.ts`
- Home: `vue_ppt/src/views/Home.vue`

## New Deck Checklist
1. Scaffold `src/presentations/<slug>/index.vue` with `<script setup lang="ts">`.
2. Provide i18n messages under `src/presentations/<slug>/locales/en.json` (and others as needed).
3. Use `SlideSection`, `TwoColumn`, `CardPanel`, `CardGrid`, and `QuoteBlock` for structure.
4. Keep slide backgrounds transparent; pick a single background in the presentation context.
5. Register route + home link.
6. Verify dev: `npm run dev`; build: `npm run build`.

## Notes for Agents
- Prefer keyed i18n entries for lists (e.g., `agenda.item1..itemN`) instead of arrays to avoid iterator issues.
- Keep accent usage minimal: one gradient headline or one chip per slide.
- Contribute improvements to layout presets instead of duplicating CSS in slides.

## Color Palette Guidance
- Design pages based on a 5‑color palette. Default set:
  - `#93AD90`
  - `#F4CDA5`
  - `#F79A8C`
  - `#E26A6A`
  - `#24353D`
- Map thoughtfully to roles (suggested):
  - Primary/Accent: `#E26A6A` or `#F79A8C`
  - Secondary/Highlight: `#F4CDA5`
  - Support/Success: `#93AD90`
  - Neutral/Dark text & UI: `#24353D`
- Keep contrast accessible; prefer one accent per slide.
