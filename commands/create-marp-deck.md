# Create Marp Slide Deck

Create or edit a presentation using Marp. The archetype system shapes everything: visual theme, content density, tone, layout choices, and narrative structure.

## Arguments

* `$ARGUMENTS` - Topic, file path to existing deck, or outline

## Mode Detection

- **Empty or topic**: New deck → Phase 1
- **Path to `.md` file**: Read it, ask what to change, preserve existing archetype
- **Contains "restyle"**: Read deck, strip `<style>`, apply new archetype

## The Archetype System

Every deck is built for an archetype - aesthetic + intent + audience. The archetype changes how you WRITE, not just how it LOOKS.

| Archetype | Who | Goal | Aesthetic |
|-----------|-----|------|-----------|
| **Builder** | Engineers, hackers | Explain systems clearly | Dark, monospace, terminal-adjacent |
| **Operator** | Execs, PMs, consultants | Drive decisions | Clean, structured, McKinsey calm |
| **Seller** | Founders, sales | Persuade, close | Bold, punchy, YC pitch energy |
| **Creator** | Speakers, designers | Be memorable | Expressive, gradients, visual-first |
| **Educator** | Trainers, enablement | Teach clearly | Warm, friendly, progressive disclosure |

## Phase 1: Interview

### Round 1 (ask all at once):
1. **Goal**: What should the audience walk away with?
2. **Audience**: Who's in the room?
3. **Key points**: Main ideas, even rough
4. **Existing material**: Notes, docs, files?

Read any files/URLs thoroughly before Round 2.

### Round 2 (after Round 1):
5. **Archetype**: Recommend one based on answers. Describe all four if unsure. **If none fit**, trigger custom flow (see below).
6. **Narrative arc**: Suggest the archetype's default framework
7. **Data & visuals**: Code, diagrams (Mermaid), screenshots?
8. **Constraints**: Slide count, duration, branding?
9. **Speaker notes**: Generate per slide?

Summarize and confirm.

### Custom Archetype Flow (when none of the four fit)

If the user rejects all archetypes, build a custom one by asking:

1. **Vibe in 3 words**: "Describe the feeling in 3 words" (e.g., "warm, playful, minimal")
2. **Color direction**: Specific colors, a brand reference ("like Stripe" / "Notion vibes" / "cyberpunk"), or a mood ("earthy and warm")
3. **Density**: Dense/packed, medium, or spacious/airy?
4. **Visual references**: Any presentations, websites, or brands to emulate?

Then construct a custom theme:
- **Vibe → fonts**: corporate=Segoe UI, minimal=Inter, elegant=Georgia, techy=JetBrains Mono headers, bold=Inter weight 800, warm=Georgia/Palatino
- **Colors → palette**: Map their input to primary/secondary/accent. Generate gradient section dividers from primary (darken 30% for start, original for end)
- **Brand shortcuts**: Stripe=#635BFF+#0A2540, Notion=#37352F+#F7F6F3, Linear=#5E6AD2+#1A1B25, Vercel=#000+#0070F3, Apple=#1D1D1F+#F5F5F7, Cyberpunk=#FF00FF+#00FFFF on #0D0D0D
- **Density → sizing**: Dense=20px body/32px h1/7 bullets, Medium=22px/36px/5, Spacious=24px/40px/3
- **Structural base**: Pick the closest built-in archetype for content rules and layout preferences. Tell the user which one.

Present the palette + font + structural base for confirmation before generating.

## Phase 2: Outline

```
OUTLINE: [Title]
Archetype: [name] | Narrative: [framework]
Est. slides: [N] | Duration: [M min]

1. TITLE - [Title + subtitle]
2. HOOK - [Opening question/stat/story]
3. AGENDA - [Sections]
4. SECTION: [Name] ──────────
   4a. [Slide] - [summary] - [layout: diagram/table/code/stat/bullets]
   ...
N-1. TAKEAWAYS - [3-5 points]
N.   CLOSING - [CTA]
```

Tag layouts per slide to force variety upfront. Get approval.

## Phase 3: Generate

### Frontmatter
```
---
marp: true
theme: default
paginate: true
size: 16:9
---
```

### Archetype Content Rules

**Builder**: High density. Terse, precise. Code on 40%+ of slides. Mermaid everywhere. Short noun-phrase bullets. "Redis - sub-ms reads, atomic INCR." Minimal speaker notes. 60-70% standard slide count.

**Operator**: Medium density. Assertion-first - lead with the conclusion. Pyramid principle (top-down). Almost no code. "So what?" on every slide. Verbose speaker notes. 1 min/slide.

**Seller**: Low density. One statement or metric per slide. Active, urgent language. Never show code. Metrics displayed LARGE (48-96pt). Max 3 bullets. Fast pace, 30-45 sec/slide. Speaker notes carry the story.

**Creator**: Low-medium density. Generous whitespace. Conversational, provocative. Visual elements on every slide. Max 3 bullets or skip bullets entirely. High slide count, 20-30 sec/slide. Rapid visual rhythm.

**Educator**: Low density. One concept per slide. Warm, jargon-free. Define terms when first used. Concept→Example→Concept→Example pattern. Fragmented lists (`*`) for progressive reveal. Recap slide after each section. Verbose speaker notes with analogies.

### Universal Rules
- Sentence case headings
- No trailing periods on bullets
- Backticks for technical identifiers
- **Bold** for emphasis
- `>` blockquotes for callouts
- Never repeat same layout on consecutive slides
- Every content slide needs a visual element

### Slide Structure
1. **Title**: `<!-- _paginate: false -->` `<!-- _class: lead title-slide -->`
2. **Hook**: Opening question, stat, or story
3. **Agenda**: Section overview
4. **Sections**: Divider (`<!-- _header: "" -->` `<!-- _class: lead section-NAME -->`) + content with breadcrumbs (`<!-- header: "Part 1 · **Part 2** · Part 3" -->`)
5. **Takeaways**: 3-5 bullet summary
6. **Closing**: CTA / Q&A

### Mermaid (Builder/Educator archetypes primarily)
Write inline for HTML. Pre-render for PDF/PPTX:
```bash
npx @mermaid-js/mermaid-cli@latest -i diagram.mmd -o diagram.svg -t neutral -b transparent
```

## Phase 4: Review
1. One idea per slide? 2. Breadcrumbs correct? 3. CSS classes match? 4. Archetype content rules followed? 5. Narrative flows? 6. Speaker notes present (if asked)?

## Phase 5: Export
```bash
npx @marp-team/marp-cli@latest --no-stdin --html DECK.md -o DECK.html
npx @marp-team/marp-cli@latest --no-stdin --html --pdf DECK.md -o DECK.pdf
npx @marp-team/marp-cli@latest --no-stdin --html --pptx DECK.md -o DECK.pptx
```
Always `--no-stdin --html`. Add `--allow-local-files` for local images.

## Editing Existing Decks
1. Read entire file first. 2. Preserve existing archetype unless restyling. 3. Match breadcrumbs and section classes. 4. After edits: re-read, fix breadcrumbs, verify flow.

## Narrative Frameworks

| Framework | Structure | Default for |
|-----------|-----------|-------------|
| **Problem → Solution → Impact** | Pain → Cure → Proof | Seller, Builder (proposals) |
| **Situation → Complication → Resolution** | Context → Shift → Plan | Operator |
| **What → So What → Now What** | Thing → Why care → What to do | Creator, Educator |
| **Chronological** | Timeline + analysis | Operator (status), Educator (walkthroughs) |
| **Compare & Contrast** | A vs B → Recommendation | Builder |

## Pacing

| Duration | Builder | Operator | Seller | Creator | Educator |
|----------|---------|----------|--------|---------|----------|
| 5 min | 6-8 | 8-10 | 12-15 | 12-15 | 8-10 |
| 15 min | 12-16 | 15-20 | 25-30 | 25-35 | 15-20 |
| 30 min | 20-28 | 25-35 | 40-50 | 40-55 | 25-35 |

---

## ARCHETYPE CSS

### The Builder
Classes: `title-slide`, `section-cyan`, `section-green`, `section-purple`
```html
<style>
section { font-family: 'Inter', system-ui, sans-serif; font-size: 22px; color: #c9d1d9; background: #0d1117; padding: 40px 60px; }
h1 { font-size: 34px; font-weight: 600; color: #e6edf3; }
h2 { font-size: 26px; font-weight: 600; color: #58a6ff; }
h3 { font-size: 20px; font-weight: 600; color: #8b949e; }
strong { color: #58a6ff; }
table { font-size: 17px; border-collapse: collapse; width: 100%; }
th { background: #161b22; color: #58a6ff; font-weight: 600; padding: 8px 12px; border-bottom: 1px solid #30363d; text-align: left; }
td { padding: 6px 12px; border-bottom: 1px solid #21262d; }
blockquote { font-size: 18px; border-left: 3px solid #58a6ff; background: #161b22; padding: 10px 16px; border-radius: 0 6px 6px 0; color: #8b949e; }
pre { font-size: 14px; background: #161b22; border: 1px solid #30363d; border-radius: 6px; padding: 16px; }
code { font-size: 14px; font-family: 'JetBrains Mono', 'Fira Code', monospace; color: #79c0ff; }
pre code { color: #c9d1d9; }
a { color: #58a6ff; }
header { font-size: 12px; color: #484f58; font-family: 'JetBrains Mono', monospace; }
header strong { color: #58a6ff; }
footer { font-size: 11px; color: #484f58; }
section.title-slide { background: linear-gradient(160deg, #010409 0%, #0d1117 40%, #161b22 100%); color: #e6edf3; display: flex; flex-direction: column; justify-content: center; text-align: center; }
section.title-slide h1 { font-size: 42px; color: #e6edf3; }
section.title-slide h2 { font-size: 22px; color: #8b949e; font-weight: 400; }
section.title-slide strong { color: #58a6ff; }
section.section-cyan { background: linear-gradient(135deg, #051d28 0%, #0c4a6e 100%); color: #e6edf3; display: flex; flex-direction: column; justify-content: center; }
section.section-green { background: linear-gradient(135deg, #041f13 0%, #166534 100%); color: #e6edf3; display: flex; flex-direction: column; justify-content: center; }
section.section-purple { background: linear-gradient(135deg, #1a0533 0%, #6d28d9 100%); color: #e6edf3; display: flex; flex-direction: column; justify-content: center; }
section.section-cyan h1, section.section-green h1, section.section-purple h1 { color: #e6edf3; }
section.section-cyan h2 { color: #67e8f9; } section.section-green h2 { color: #86efac; } section.section-purple h2 { color: #c4b5fd; }
section.section-cyan strong, section.section-green strong, section.section-purple strong { color: #fff; }
</style>
```

### The Operator
Classes: `title-slide`, `section-navy`, `section-slate`, `section-sage`
```html
<style>
section { font-family: 'Georgia', serif; font-size: 22px; color: #1e293b; background: #fafaf9; padding: 50px 70px; }
h1 { font-family: 'Helvetica Neue', sans-serif; font-size: 36px; font-weight: 700; color: #0f172a; letter-spacing: -0.3px; }
h2 { font-family: 'Helvetica Neue', sans-serif; font-size: 26px; font-weight: 600; color: #334155; }
h3 { font-family: 'Helvetica Neue', sans-serif; font-size: 20px; font-weight: 600; color: #64748b; }
strong { color: #0f172a; }
table { font-size: 18px; border-collapse: collapse; width: 100%; }
th { color: #0f172a; font-family: 'Helvetica Neue', sans-serif; font-weight: 600; padding: 10px 14px; border-bottom: 2px solid #0f172a; text-align: left; }
td { padding: 8px 14px; border-bottom: 1px solid #e2e8f0; }
blockquote { font-size: 22px; font-style: italic; border-left: 3px solid #94a3b8; padding: 8px 24px; color: #475569; }
pre { font-size: 14px; background: #f1f5f9; border: 1px solid #e2e8f0; border-radius: 4px; padding: 16px; }
code { font-size: 14px; font-family: 'SF Mono', monospace; }
a { color: #1e40af; text-decoration: underline; }
header { font-family: 'Helvetica Neue', sans-serif; font-size: 12px; color: #94a3b8; text-transform: uppercase; letter-spacing: 1.5px; }
header strong { color: #334155; }
footer { font-family: 'Helvetica Neue', sans-serif; font-size: 11px; color: #94a3b8; }
section.title-slide { background: #0f172a; color: #fff; display: flex; flex-direction: column; justify-content: center; text-align: left; padding: 60px 80px; }
section.title-slide h1 { font-size: 48px; color: #fff; line-height: 1.15; }
section.title-slide h2 { font-size: 22px; color: #94a3b8; font-weight: 400; }
section.title-slide strong { color: #cbd5e1; }
section.section-navy { background: #0f172a; color: #fff; display: flex; flex-direction: column; justify-content: center; padding: 60px 80px; }
section.section-slate { background: #334155; color: #fff; display: flex; flex-direction: column; justify-content: center; padding: 60px 80px; }
section.section-sage { background: #f1f5f9; color: #0f172a; display: flex; flex-direction: column; justify-content: center; padding: 60px 80px; }
section.section-navy h1, section.section-slate h1 { color: #fff; }
section.section-navy h2 { color: #94a3b8; } section.section-slate h2 { color: #cbd5e1; }
section.section-sage h1 { color: #0f172a; } section.section-sage h2 { color: #64748b; }
</style>
```

### The Seller
Classes: `title-slide`, `section-electric`, `section-ember`, `section-deep`
```html
<style>
section { font-family: 'Inter', system-ui, sans-serif; font-size: 24px; color: #1e293b; background: #fff; padding: 40px 60px; }
h1 { font-size: 42px; font-weight: 800; color: #0f172a; letter-spacing: -0.5px; }
h2 { font-size: 30px; font-weight: 700; color: #6d28d9; }
h3 { font-size: 22px; font-weight: 700; color: #475569; }
strong { color: #6d28d9; }
table { font-size: 20px; border-collapse: collapse; width: 100%; }
th { background: linear-gradient(135deg, #6d28d9, #4f46e5); color: #fff; font-weight: 600; padding: 12px 16px; }
td { padding: 10px 16px; border-bottom: 1px solid #e2e8f0; font-size: 18px; }
blockquote { font-size: 26px; font-weight: 500; border-left: 5px solid #6d28d9; background: linear-gradient(135deg, #f5f3ff, #eef2ff); padding: 20px 28px; border-radius: 0 12px 12px 0; }
pre { font-size: 15px; background: #1e293b; color: #e2e8f0; border-radius: 12px; padding: 20px; }
code { font-size: 15px; font-family: 'Cascadia Code', monospace; }
a { color: #6d28d9; font-weight: 600; }
img { border-radius: 12px; }
header { font-size: 13px; color: #94a3b8; font-weight: 500; }
header strong { color: #6d28d9; font-weight: 700; }
footer { font-size: 12px; color: #94a3b8; }
section.title-slide { background: linear-gradient(135deg, #6d28d9 0%, #4f46e5 50%, #2563eb 100%); color: #fff; display: flex; flex-direction: column; justify-content: center; text-align: center; }
section.title-slide h1 { font-size: 52px; color: #fff; text-shadow: 0 2px 20px rgba(0,0,0,0.2); }
section.title-slide h2 { font-size: 24px; color: rgba(255,255,255,0.9); font-weight: 400; }
section.title-slide strong { color: #fff; }
section.section-electric { background: linear-gradient(135deg, #4f46e5, #7c3aed); color: #fff; display: flex; flex-direction: column; justify-content: center; }
section.section-ember { background: linear-gradient(135deg, #b91c1c, #f59e0b); color: #fff; display: flex; flex-direction: column; justify-content: center; }
section.section-deep { background: linear-gradient(135deg, #0f172a, #1e3a5f); color: #fff; display: flex; flex-direction: column; justify-content: center; }
section.section-electric h1, section.section-ember h1, section.section-deep h1 { color: #fff; }
section.section-electric h2 { color: #c4b5fd; } section.section-ember h2 { color: #fef3c7; } section.section-deep h2 { color: #93c5fd; }
section.section-electric strong, section.section-ember strong, section.section-deep strong { color: #fff; }
</style>
```

### The Creator
Classes: `title-slide`, `section-sunset`, `section-ocean`, `section-neon`
```html
<style>
section { font-family: 'Inter', system-ui, sans-serif; font-size: 24px; color: #1e293b; background: #fff; padding: 50px 70px; }
h1 { font-size: 44px; font-weight: 800; color: #0f172a; letter-spacing: -1px; line-height: 1.1; }
h2 { font-size: 28px; font-weight: 700; color: #be185d; }
h3 { font-size: 22px; font-weight: 700; color: #6b7280; }
strong { color: #be185d; }
table { font-size: 18px; border-collapse: collapse; width: 100%; }
th { background: linear-gradient(135deg, #be185d, #9333ea); color: #fff; font-weight: 600; padding: 12px 16px; }
td { padding: 10px 16px; border-bottom: 1px solid #f3e8ff; }
blockquote { font-size: 28px; font-weight: 600; border: none; background: linear-gradient(135deg, #fdf2f8, #f5f3ff); padding: 24px 32px; border-radius: 16px; color: #581c87; }
pre { font-size: 15px; background: #1e1b2e; color: #e2e8f0; border-radius: 16px; padding: 20px; }
code { font-size: 15px; font-family: 'Cascadia Code', monospace; }
a { color: #be185d; font-weight: 700; }
img { border-radius: 16px; }
header { font-size: 13px; color: #a1a1aa; font-weight: 500; }
header strong { color: #be185d; font-weight: 700; }
footer { font-size: 12px; color: #a1a1aa; }
section.title-slide { background: linear-gradient(135deg, #ec4899 0%, #8b5cf6 50%, #3b82f6 100%); color: #fff; display: flex; flex-direction: column; justify-content: center; text-align: center; }
section.title-slide h1 { font-size: 56px; color: #fff; text-shadow: 0 4px 30px rgba(0,0,0,0.15); }
section.title-slide h2 { font-size: 24px; color: rgba(255,255,255,0.85); font-weight: 400; }
section.title-slide strong { color: #fff; }
section.section-sunset { background: linear-gradient(135deg, #dc2626, #f59e0b, #fbbf24); color: #fff; display: flex; flex-direction: column; justify-content: center; }
section.section-ocean { background: linear-gradient(135deg, #0ea5e9, #6366f1); color: #fff; display: flex; flex-direction: column; justify-content: center; }
section.section-neon { background: linear-gradient(135deg, #a855f7, #ec4899); color: #fff; display: flex; flex-direction: column; justify-content: center; }
section.section-sunset h1, section.section-ocean h1, section.section-neon h1 { color: #fff; text-shadow: 0 2px 10px rgba(0,0,0,0.15); }
section.section-sunset h2 { color: #fef3c7; } section.section-ocean h2 { color: #c7d2fe; } section.section-neon h2 { color: #fce7f3; }
section.section-sunset strong, section.section-ocean strong, section.section-neon strong { color: #fff; }
</style>
```

### The Educator
Classes: `title-slide`, `section-blue`, `section-teal`, `section-warm`
```html
<style>
section { font-family: 'Segoe UI', system-ui, sans-serif; font-size: 24px; color: #1e293b; background: #fff; padding: 50px 65px; line-height: 1.6; }
h1 { font-size: 36px; font-weight: 700; color: #0c4a6e; }
h2 { font-size: 28px; font-weight: 600; color: #0369a1; }
h3 { font-size: 22px; font-weight: 600; color: #64748b; }
strong { color: #0369a1; }
table { font-size: 18px; border-collapse: collapse; width: 100%; }
th { background: #e0f2fe; color: #0c4a6e; font-weight: 600; padding: 10px 14px; border-bottom: 2px solid #0ea5e9; }
td { padding: 10px 14px; border-bottom: 1px solid #e2e8f0; }
blockquote { font-size: 22px; border-left: 4px solid #0ea5e9; background: #f0f9ff; padding: 14px 22px; border-radius: 0 10px 10px 0; }
pre { font-size: 16px; background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 10px; padding: 18px; line-height: 1.5; }
code { font-size: 16px; font-family: 'Cascadia Code', monospace; color: #0369a1; }
pre code { color: #1e293b; }
a { color: #0369a1; text-decoration: underline; }
header { font-size: 13px; color: #94a3b8; }
header strong { color: #0369a1; }
footer { font-size: 12px; color: #94a3b8; }
section.title-slide { background: linear-gradient(135deg, #0c4a6e, #0369a1, #0ea5e9); color: #fff; display: flex; flex-direction: column; justify-content: center; text-align: center; }
section.title-slide h1 { font-size: 44px; color: #fff; }
section.title-slide h2 { font-size: 22px; color: #bae6fd; font-weight: 400; }
section.title-slide strong { color: #e0f2fe; }
section.section-blue { background: linear-gradient(135deg, #0c4a6e, #0369a1); color: #fff; display: flex; flex-direction: column; justify-content: center; }
section.section-teal { background: linear-gradient(135deg, #134e4a, #0d9488); color: #fff; display: flex; flex-direction: column; justify-content: center; }
section.section-warm { background: linear-gradient(135deg, #78350f, #d97706); color: #fff; display: flex; flex-direction: column; justify-content: center; }
section.section-blue h1, section.section-teal h1, section.section-warm h1 { color: #fff; }
section.section-blue h2 { color: #bae6fd; } section.section-teal h2 { color: #99f6e4; } section.section-warm h2 { color: #fef3c7; }
section.section-blue strong, section.section-teal strong, section.section-warm strong { color: #fff; }
</style>
```
