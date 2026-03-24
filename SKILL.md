---
name: create-marp-deck
description: "Create, edit, and iterate on presentation slide decks using Marp (Markdown Presentation Ecosystem). Use this skill whenever the user wants to create a presentation, slide deck, or talk using Marp or Markdown-based slides. Also triggers for: editing or restyling existing Marp decks, converting notes/docs into slide format, adding/removing/reordering slides in a .md presentation, exporting presentations to HTML/PDF/PPTX, or any mention of 'marp', 'slide deck', 'presentation markdown', or 'deck from markdown'. If the user has an existing Marp .md file and wants changes, use this skill - don't start from scratch."
---

# Create Marp Slide Deck

Build professional presentations using Marp - the Markdown Presentation Ecosystem. This skill handles the full lifecycle: interview → archetype → outline → generate → export → iterate.

## Quick Reference

| Task | Action |
|------|--------|
| Create new deck | Follow Phase 1–5 below |
| Edit existing deck | Jump to [Editing Existing Decks](#editing-existing-decks) |
| Restyle / change archetype | Jump to [Restyling](#restyling-an-existing-deck) |
| Export only | Jump to [Phase 5: Export](#phase-5-export) |
| Marp syntax help | Read `references/marp-syntax.md` |

---

## Before You Start

Read `references/marp-syntax.md` for the full Marp directive and syntax reference.

Check that Marp CLI is available:
```bash
npx @marp-team/marp-cli@latest --version 2>/dev/null || echo "MARP_NOT_FOUND"
```
If not found, the user needs Node.js installed. Marp CLI runs via `npx` (no global install required).

For PDF/PPTX export, a browser is needed:
```bash
which google-chrome || which chromium-browser || which chromium || which microsoft-edge || which firefox || echo "NO_BROWSER"
```

---

## The Archetype System

Every deck is built for an archetype - a combination of aesthetic, intent, and audience. The archetype determines not just colors and fonts, but *how Claude writes the slides*: information density, tone, layout choices, and narrative structure.

Read `references/archetypes.md` for the complete CSS and behavioral rules for each archetype.

| Archetype | Audience | Intent | Aesthetic |
|-----------|----------|--------|-----------|
| **The Builder** | Engineers, hackers, AI devs | Explain complex systems clearly | Dark, minimal, terminal-adjacent |
| **The Operator** | Executives, PMs, consultants | Drive decisions, align stakeholders | Clean, structured, calm confidence |
| **The Seller** | Founders, sales teams, fundraising | Persuade, excite, close deals | Bold, punchy, high-contrast |
| **The Creator** | Designers, speakers, community | Stand out, be memorable | Expressive, gradient-heavy, visual-first |
| **The Educator** | Teachers, trainers, enablement | Teach clearly, reduce cognitive load | Friendly, warm, progressive disclosure |

**How the archetype affects generation:**

Each archetype defines three layers:
1. **Theme** - CSS (colors, fonts, spacing, section classes)
2. **Content strategy** - How to write for this audience (density, tone, what to emphasize)
3. **Structural patterns** - Which slide types to favor, default narrative framework, pacing

---

## Phase 1: Interview

Discover the story before writing slides. Ask in **two rounds**.

### Round 1 - The Story (ask all at once)

1. **Goal**: What should the audience walk away knowing, believing, or doing?
2. **Audience**: Who's in the room? (engineers, execs, mixed, conference, clients, students)
3. **Key points**: Main ideas or sections, even rough
4. **Existing material**: Notes, docs, outlines, or files to work from?

If the user provides files or URLs: **read and absorb thoroughly before Round 2.**

### Round 2 - The Shape (ask after Round 1 answers)

Based on Round 1, **recommend an archetype** with your reasoning. Then ask:

5. **Archetype**: "Based on your audience and goal, I'd recommend **The [X]** because [reason]. Does that feel right, or do you want a different vibe?" - briefly describe all four options. **If none fit**, trigger the custom archetype flow (see below).
6. **Narrative arc**: Suggest the archetype's default framework (see `references/archetypes.md`). Offer alternatives if the content calls for it.
7. **Data & visuals**: Specific data, code, diagrams (Mermaid)? Should I create diagrams?
8. **Constraints**: Slide count, talk duration, things to avoid, branding?
9. **Speaker notes**: Generate talking points per slide?

Summarize in 3-5 sentences and confirm before proceeding.

### Custom Archetype Flow

If the user says none of the four archetypes fit, **don't force one**. Build a custom archetype on the fly by asking:

1. **Vibe in 3 words**: "Describe the feeling you want in 3 words." (e.g., "warm, playful, minimal" or "aggressive, dark, techy" or "elegant, airy, calm")
2. **Color direction**: "What colors feel right? A specific palette, a reference brand, or a mood?" Accept any of:
   - Specific hex values or color names ("navy and gold")
   - Brand references ("like Stripe's website" or "Notion vibes")
   - Mood descriptions ("earthy and warm" or "neon cyberpunk")
3. **Density preference**: "Should slides be dense with information, or spacious with breathing room?"
4. **Any visual references?**: "Any presentations, websites, or brands whose look you admire? Share links or names if you have them."

Then **construct a custom CSS theme** based on their answers:
- Map their vibe words to font choices (playful → rounded sans-serif, corporate → Segoe/Helvetica, techy → monospace accents, elegant → serif headers)
- Map their color direction to a palette (primary, secondary, accent) and generate gradient section dividers
- Map their density preference to font sizes, padding, and bullets-per-slide rules
- Use the closest built-in archetype as a structural base for content strategy and layout preferences - tell the user which one you're using as the skeleton

Read `references/archetypes.md` section "Building a Custom Archetype" for the CSS construction guide.

The custom archetype gets the same three layers as any built-in one:
- **Theme**: Custom CSS generated from their answers
- **Content strategy**: Borrowed from the closest built-in archetype (adjusted for density preference)
- **Structural patterns**: Borrowed from the closest built-in archetype

---

## Phase 2: Outline

Before generating Markdown, produce a **slide-by-slide outline** for approval:

```
OUTLINE: [Deck Title]
Archetype: [name] | Narrative: [framework]
Est. slides: [N] | Est. duration: [M min]

1. TITLE SLIDE - [Title + subtitle + key details]
2. HOOK - [Opening question/stat/story]
3. AGENDA - [Section overview]
4. SECTION: [Name] ──────────
   4a. [Slide title] - [1-line summary] - [layout: diagram/table/code/stat/bullets]
   4b. [Slide title] - [1-line summary] - [layout: ...]
...
N-1. KEY TAKEAWAYS - [3-5 points]
N.   CLOSING - [CTA / next steps]
```

Note the `[layout: ...]` tag on each slide - this forces layout variety planning upfront instead of defaulting to bullets everywhere.

Get confirmation or changes before Phase 3.

---

## Phase 3: Generate the Deck

Read `references/archetypes.md` and `references/marp-syntax.md` before generating.

### File Setup

```
presentations/[slug-name].md
```

### Frontmatter

```markdown
---
marp: true
theme: default
paginate: true
size: 16:9
---
```

### Theme CSS

Paste the complete CSS for the chosen archetype from `references/archetypes.md` immediately after frontmatter.

### Content Rules (archetype-driven)

**Every archetype has specific content rules** defined in `references/archetypes.md`. Follow them. The key rules that apply universally:

**Formatting:**
- Sentence case for all headings (only capitalize first word + proper nouns)
- No trailing periods on bullets or table cells
- Backticks for technical identifiers (`names`, `files`, `keys`)
- **Bold** for key emphasis
- `>` blockquotes for callouts
- `---` for slide breaks

**Visual variety (the squint test):**
- Never repeat the same layout on consecutive slides
- Every content slide needs at least one visual element (table, code, diagram, image, blockquote, stat callout)
- If two consecutive slides look the same shape when squinted, change one

**Speaker notes** (when requested):
```markdown
<!--
- Key talking point
- Transition: "This leads us to..."
- [~2 min on this slide]
-->
```

### Mermaid Diagrams

Write inline for HTML output. For PDF/PPTX, pre-render to SVG:
```bash
npx @mermaid-js/mermaid-cli@latest -i diagram.mmd -o diagram.svg -t neutral -b transparent
```
Then reference: `![bg contain](./diagram.svg)`

### Slide Structure

1. **Title slide** - `<!-- _paginate: false -->` `<!-- _class: lead title-slide -->`
2. **Hook slide** - Opening question, stat, or story that frames the problem
3. **Agenda** - Section overview
4. **Content sections** - Each gets a section divider + content slides with breadcrumb headers
5. **Key takeaways** - Summary of the whole deck
6. **Closing** - CTA, next steps, Q&A, contact

**Breadcrumb navigation:**
```markdown
<!-- header: "Part 1 · **Part 2** · Part 3" -->
```
Active section is **bold**. Reset with `<!-- _header: "" -->` before section dividers.

---

## Phase 4: Review & Iterate

Self-review pass before presenting to the user:

1. Does every slide have exactly one clear idea?
2. Are breadcrumb headers correct and consistent?
3. Do section divider classes match CSS definitions?
4. Does the deck follow the archetype's content rules? (density, tone, layout preferences)
5. Is the narrative arc clear - does slide N flow into N+1?
6. Are speaker notes present (if requested)?
7. Would this make sense to someone seeing it cold?

Then ask: "What sections need more/less depth? Anything off?"

---

## Phase 5: Export

Always use `--no-stdin` (prevents hanging) and `--html` (enables `<style>` + Mermaid).

```bash
# HTML (best for presenting)
npx @marp-team/marp-cli@latest --no-stdin --html DECK.md -o DECK.html

# PDF
npx @marp-team/marp-cli@latest --no-stdin --html --pdf DECK.md -o DECK.pdf

# PPTX
npx @marp-team/marp-cli@latest --no-stdin --html --pptx DECK.md -o DECK.pptx

# GitHub Pages
mkdir -p docs && npx @marp-team/marp-cli@latest --no-stdin --html DECK.md -o docs/index.html
```

Add `--allow-local-files` for local images in PDF/PPTX. Add `--bespoke.progress` for progress bar in HTML. Use `scripts/export.sh` for multi-format export with dependency checking.

---

## Editing Existing Decks

1. **Read the entire file first.** Understand structure, archetype, conventions.
2. **Preserve existing style** unless asked to restyle. Match heading conventions, bullet style, formatting.
3. **For adding slides**: Find the right insertion point. Match breadcrumbs and section classes.
4. **For removing**: Check if content should merge into adjacent slides. Update navigation.
5. **For restructuring**: Present a new outline first.
6. **After edits**: Re-read full deck, fix broken breadcrumbs, verify flow.

### Restyling an Existing Deck

1. Read and extract all content (strip `<style>` block)
2. Ask which archetype the user wants (show the five options)
3. Apply the new archetype's CSS *and* content rules - restyling may mean restructuring slides to match the new archetype's density/tone expectations
4. Verify all section classes match new CSS
5. Re-export

---

## Dependencies

**Required:** Node.js (for `npx`), `@marp-team/marp-cli` (via npx)
**For PDF/PPTX:** Chrome, Chromium, Edge, or Firefox
**For Mermaid in PDF/PPTX:** `@mermaid-js/mermaid-cli` (via npx)
**Optional:** `python-pptx` + LibreOffice for editable PPTX
