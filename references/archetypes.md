# Archetypes

Each archetype is a complete system: visual theme + content strategy + slide structure. The archetype doesn't just change colors - it changes how you **generate content**, how dense each slide is, which patterns you favor, and what narrative frameworks fit.

## Table of Contents
1. [Archetype Selection Guide](#archetype-selection-guide)
2. [The Builder](#the-builder)
3. [The Operator](#the-operator)
4. [The Storyteller](#the-storyteller)
5. [The Educator](#the-educator)
6. [Customizing Archetypes](#customizing-archetypes)
7. [Building a Custom Archetype](#building-a-custom-archetype)

---

## Selection Guide

| Audience → | Engineers / Technical | Execs / Stakeholders | Investors / Prospects | Mixed / General | Learners / New hires |
|------------|---------------------|---------------------|----------------------|----------------|---------------------|
| **Explain a system** | Builder | Operator | Seller | Creator | Educator |
| **Drive a decision** | Builder | Operator | Seller | Operator | - |
| **Persuade / excite** | Builder | Seller | Seller | Creator | - |
| **Teach a concept** | Builder | Educator | - | Educator | Educator |
| **Share progress** | Builder | Operator | Operator | Creator | - |

When the user says... → recommend:
- "architecture review" / "technical deep-dive" / "RFC walkthrough" → **Builder**
- "board meeting" / "status update" / "strategy deck" / "quarterly review" → **Operator**
- "pitch deck" / "demo" / "fundraising" / "sales deck" / "proposal" → **Seller**
- "conference talk" / "meetup" / "keynote" / "brand presentation" → **Creator**
- "training" / "onboarding" / "workshop" / "lesson" / "tutorial" → **Educator**

---

## 1. The Builder

> *The Linear / Notion / VSCode aesthetic. Dark mode, high signal density, zero fluff.*

### Identity

| | |
|---|---|
| **Vibe** | Dark, minimal, terminal-adjacent - "don't waste my time" |
| **Goal** | Explain complex systems clearly without fluff |
| **Context** | Architecture reviews, internal demos, technical talks, RFC walkthroughs |
| **Audience** | Engineers, hackers, AI devs, technical leads |

### Content Rules

These rules shape how Claude **generates slide content** for this archetype:

- **Density**: High. More information per slide than any other archetype. 4-6 bullets are fine if each is substantive.
- **Language**: Terse, precise, technical. No filler words. "Handles 50k rps" not "Our system is capable of handling up to 50,000 requests per second."
- **Code**: Use liberally. Code blocks on 40%+ of content slides. Always syntax-highlighted.
- **Diagrams**: Mermaid on every architecture/flow slide. Prefer `graph LR` (horizontal) for pipelines, `graph TD` for hierarchies.
- **Bullets**: Short, noun-phrase led. "Redis - sub-ms reads, atomic INCR" not "We use Redis because it provides sub-millisecond read latency."
- **Tables**: Use for comparisons. Dense is fine - builders read tables.
- **Speaker notes**: Minimal. Builders present from the slides, not from notes.
- **Slide count**: Dense decks run shorter. Target 60-70% of standard slide count.
- **What to avoid**: Marketing language, vague statements, slides with no code/data/diagram.

### Recommended Patterns

Favor: Code+Explanation, Architecture Diagram, Sequence Diagram, Before/After Table, Tradeoff Comparison
Avoid: Quote slides, Big Number callouts (unless it's a benchmark), Icon+Text rows

### Narrative Frameworks

**Primary**: Compare & Contrast (for evaluations), What → So What → Now What (for conference talks)
**Secondary**: Problem → Solution → Impact (for proposals)

### CSS Theme

Section classes: `title-slide`, `section-cyan`, `section-green`, `section-purple`

```html
<style>
/* === THE BUILDER === */
section {
  font-family: 'Inter', 'SF Pro Display', system-ui, sans-serif;
  font-size: 22px;
  color: #c9d1d9;
  background-color: #0d1117;
  padding: 40px 60px;
}
h1 { font-size: 34px; font-weight: 600; color: #e6edf3; margin-bottom: 16px; }
h2 { font-size: 26px; font-weight: 600; color: #58a6ff; margin-bottom: 12px; }
h3 { font-size: 20px; font-weight: 600; color: #8b949e; }
strong { color: #58a6ff; }
table { font-size: 17px; border-collapse: collapse; width: 100%; }
th {
  background-color: #161b22;
  color: #58a6ff;
  font-weight: 600;
  padding: 8px 12px;
  border-bottom: 1px solid #30363d;
  text-align: left;
}
td { padding: 6px 12px; border-bottom: 1px solid #21262d; }
blockquote {
  font-size: 18px;
  border-left: 3px solid #58a6ff;
  background-color: #161b22;
  padding: 10px 16px;
  border-radius: 0 6px 6px 0;
  color: #8b949e;
}
pre {
  font-size: 14px;
  background-color: #161b22;
  border: 1px solid #30363d;
  border-radius: 6px;
  padding: 16px;
}
code {
  font-size: 14px;
  font-family: 'JetBrains Mono', 'Fira Code', 'Cascadia Code', monospace;
  color: #79c0ff;
}
pre code { color: #c9d1d9; }
a { color: #58a6ff; text-decoration: none; }
header { font-size: 12px; color: #484f58; font-family: 'JetBrains Mono', monospace; }
header strong { color: #58a6ff; font-weight: 600; }
footer { font-size: 11px; color: #484f58; font-family: 'JetBrains Mono', monospace; }
section.title-slide {
  background: linear-gradient(160deg, #010409 0%, #0d1117 40%, #161b22 100%);
  color: #e6edf3;
  display: flex; flex-direction: column; justify-content: center; text-align: center;
}
section.title-slide h1 { font-size: 42px; color: #e6edf3; }
section.title-slide h2 { font-size: 22px; color: #8b949e; font-weight: 400; }
section.title-slide strong { color: #58a6ff; }
section.section-cyan {
  background: linear-gradient(135deg, #051d28 0%, #0c4a6e 100%);
  color: #e6edf3;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-green {
  background: linear-gradient(135deg, #041f13 0%, #166534 100%);
  color: #e6edf3;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-purple {
  background: linear-gradient(135deg, #1a0533 0%, #6d28d9 100%);
  color: #e6edf3;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-cyan h1, section.section-green h1, section.section-purple h1 { color: #e6edf3; }
section.section-cyan h2 { color: #67e8f9; }
section.section-green h2 { color: #86efac; }
section.section-purple h2 { color: #c4b5fd; }
section.section-cyan strong, section.section-green strong, section.section-purple strong { color: #fff; }
</style>
```

---

## 2. The Operator

> *The McKinsey / BCG aesthetic. Calm confidence, top-down logic, every slide answers "so what?"*

### Identity

| | |
|---|---|
| **Vibe** | Clean, structured, authoritative - "I've done the analysis" |
| **Goal** | Drive decisions, align stakeholders, convey status |
| **Context** | Board meetings, strategy decks, quarterly reviews, status updates |
| **Audience** | Executives, PMs, consultants, cross-functional leadership |

### Content Rules

- **Density**: Medium. One insight per slide. White space signals confidence.
- **Language**: Assertion-first. Lead every slide with the conclusion, then support it. "Churn dropped 23% after the onboarding redesign" not "We redesigned onboarding and here's what happened."
- **Code**: Almost never. If unavoidable, pseudocode only, max 5 lines.
- **Diagrams**: Sparingly. High-level only (3-5 boxes). Mermaid for process flows, never for implementation detail.
- **Bullets**: Insight-led. Each bullet is a finding, not a description. Start with the "so what."
- **Tables**: Use for metrics, comparisons, status. Always include a "Change" or "Impact" column.
- **Speaker notes**: Yes - verbose. Operators present FROM notes, the slide is the anchor.
- **Slide count**: Standard. Budget 1 minute per slide.
- **Pyramid Principle**: Structure every section top-down: conclusion first, supporting evidence below. Never build up to a conclusion - state it, then justify.
- **What to avoid**: Technical jargon, implementation details, code blocks, dense tables (max 5 rows).

### Recommended Patterns

Favor: Before/After Table, Big Number Callout, Timeline, Key Takeaways, Executive Summary
Avoid: Code slides, deep architecture diagrams, raw data dumps

### Narrative Frameworks

**Primary**: Situation → Complication → Resolution (strategic), Chronological (status updates)
**Secondary**: Problem → Solution → Impact (proposals)

### CSS Theme

Section classes: `title-slide`, `section-navy`, `section-slate`, `section-sage`

```html
<style>
/* === THE OPERATOR === */
section {
  font-family: 'Georgia', 'Times New Roman', serif;
  font-size: 22px;
  color: #1e293b;
  background-color: #fafaf9;
  padding: 50px 70px;
}
h1 {
  font-family: 'Helvetica Neue', 'Arial', sans-serif;
  font-size: 36px;
  font-weight: 700;
  color: #0f172a;
  margin-bottom: 20px;
  letter-spacing: -0.3px;
}
h2 {
  font-family: 'Helvetica Neue', 'Arial', sans-serif;
  font-size: 26px;
  font-weight: 600;
  color: #334155;
  margin-bottom: 12px;
}
h3 {
  font-family: 'Helvetica Neue', 'Arial', sans-serif;
  font-size: 20px;
  font-weight: 600;
  color: #64748b;
}
strong { color: #0f172a; }
table { font-size: 18px; border-collapse: collapse; width: 100%; }
th {
  color: #0f172a;
  font-family: 'Helvetica Neue', sans-serif;
  font-weight: 600;
  padding: 10px 14px;
  border-bottom: 2px solid #0f172a;
  text-align: left;
}
td { padding: 8px 14px; border-bottom: 1px solid #e2e8f0; }
blockquote {
  font-size: 22px;
  font-style: italic;
  border-left: 3px solid #94a3b8;
  padding: 8px 24px;
  color: #475569;
}
pre {
  font-size: 14px;
  background-color: #f1f5f9;
  border: 1px solid #e2e8f0;
  border-radius: 4px;
  padding: 16px;
}
code {
  font-size: 14px;
  font-family: 'SF Mono', 'Menlo', monospace;
}
a { color: #1e40af; text-decoration: underline; }
header {
  font-family: 'Helvetica Neue', sans-serif;
  font-size: 12px;
  color: #94a3b8;
  text-transform: uppercase;
  letter-spacing: 1.5px;
}
header strong { color: #334155; font-weight: 600; }
footer {
  font-family: 'Helvetica Neue', sans-serif;
  font-size: 11px;
  color: #94a3b8;
}
section.title-slide {
  background: #0f172a;
  color: #fff;
  display: flex; flex-direction: column; justify-content: center;
  text-align: left;
  padding: 60px 80px;
}
section.title-slide h1 { font-size: 48px; color: #fff; line-height: 1.15; }
section.title-slide h2 { font-size: 22px; color: #94a3b8; font-weight: 400; }
section.title-slide strong { color: #cbd5e1; }
section.section-navy {
  background: #0f172a; color: #fff;
  display: flex; flex-direction: column; justify-content: center; padding: 60px 80px;
}
section.section-slate {
  background: #334155; color: #fff;
  display: flex; flex-direction: column; justify-content: center; padding: 60px 80px;
}
section.section-sage {
  background: #f1f5f9; color: #0f172a;
  display: flex; flex-direction: column; justify-content: center; padding: 60px 80px;
}
section.section-navy h1, section.section-slate h1 { color: #fff; }
section.section-navy h2 { color: #94a3b8; font-weight: 400; }
section.section-slate h2 { color: #cbd5e1; font-weight: 400; }
section.section-sage h1 { color: #0f172a; }
section.section-sage h2 { color: #64748b; font-weight: 400; }
</style>
```

---

## 3. The Seller

> *Y Combinator / Stripe pitch energy. Big type, emotional hooks, metrics like trophies.*

### Identity

| | |
|---|---|
| **Vibe** | Bold, punchy, controlled confidence - "you need this" |
| **Goal** | Persuade, excite, close the deal or secure the investment |
| **Context** | Pitch decks, demos, fundraising, sales proposals |
| **Audience** | Investors, prospects, buyers, decision-makers |

### Content Rules

- **Density**: Low. Less text per slide than any other archetype. One statement, one metric, or one image per slide.
- **Language**: Active, urgent, outcome-focused. "Cut onboarding from 3 weeks to 2 days" not "Our platform streamlines the onboarding process."
- **Code**: Never. If you must show product, use screenshots or simplified pseudocode.
- **Diagrams**: Only for "how it works" - one simple diagram, max 4 boxes. Never show implementation.
- **Bullets**: Max 3 per slide. Each is a punchy benefit, not a feature.
- **Tables**: Only for "before/after" impact. Keep to 3-4 rows.
- **Speaker notes**: Yes - critical. The SPEAKER tells the story, the slides are visual anchors.
- **Slide count**: Higher than average. Fast-paced, 30-45 seconds per slide.
- **Pacing**: Build tension through the deck: Problem → pain → solution → proof → ask. Every slide either increases urgency or delivers relief.
- **Numbers**: Display metrics LARGE (48-96pt). "87% reduction" not "we reduced errors by 87%."
- **What to avoid**: Walls of text, technical detail, tables with >4 rows, any slide that doesn't advance the story.

### Recommended Patterns

Favor: Big Number Callout, Before/After, Quote Slide, Title+Single Statement, Image Split
Avoid: Dense tables, code blocks, multi-level hierarchies, detailed architecture

### Narrative Frameworks

**Primary**: Problem → Solution → Impact (always)
**Secondary**: What → So What → Now What (for demos)

### CSS Theme

Section classes: `title-slide`, `section-electric`, `section-ember`, `section-deep`

```html
<style>
/* === THE SELLER === */
section {
  font-family: 'Inter', 'Helvetica Neue', system-ui, sans-serif;
  font-size: 24px;
  color: #1e293b;
  background-color: #ffffff;
  padding: 40px 60px;
}
h1 {
  font-size: 42px;
  font-weight: 800;
  color: #0f172a;
  letter-spacing: -0.5px;
  margin-bottom: 16px;
}
h2 { font-size: 30px; font-weight: 700; color: #6d28d9; margin-bottom: 12px; }
h3 { font-size: 22px; font-weight: 700; color: #475569; }
strong { color: #6d28d9; }
table { font-size: 20px; border-collapse: collapse; width: 100%; }
th {
  background: linear-gradient(135deg, #6d28d9, #4f46e5);
  color: #fff;
  font-weight: 600;
  padding: 12px 16px;
  border-radius: 0;
}
td { padding: 10px 16px; border-bottom: 1px solid #e2e8f0; font-size: 18px; }
blockquote {
  font-size: 26px;
  font-weight: 500;
  border-left: 5px solid #6d28d9;
  background: linear-gradient(135deg, #f5f3ff 0%, #eef2ff 100%);
  padding: 20px 28px;
  border-radius: 0 12px 12px 0;
}
pre {
  font-size: 15px;
  background: #1e293b;
  color: #e2e8f0;
  border-radius: 12px;
  padding: 20px;
}
code { font-size: 15px; font-family: 'Cascadia Code', 'Fira Code', monospace; }
a { color: #6d28d9; font-weight: 600; text-decoration: none; }
img { border-radius: 12px; }
header { font-size: 13px; color: #94a3b8; font-weight: 500; }
header strong { color: #6d28d9; font-weight: 700; }
footer { font-size: 12px; color: #94a3b8; }
section.title-slide {
  background: linear-gradient(135deg, #6d28d9 0%, #4f46e5 50%, #2563eb 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center; text-align: center;
}
section.title-slide h1 {
  font-size: 52px; color: #fff;
  text-shadow: 0 2px 20px rgba(0,0,0,0.2);
}
section.title-slide h2 { font-size: 24px; color: rgba(255,255,255,0.9); font-weight: 400; }
section.title-slide strong { color: #fff; }
section.section-electric {
  background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-ember {
  background: linear-gradient(135deg, #b91c1c 0%, #f59e0b 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-deep {
  background: linear-gradient(135deg, #0f172a 0%, #1e3a5f 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-electric h1, section.section-ember h1, section.section-deep h1 { color: #fff; }
section.section-electric h2 { color: #c4b5fd; }
section.section-ember h2 { color: #fef3c7; }
section.section-deep h2 { color: #93c5fd; }
section.section-electric strong, section.section-ember strong, section.section-deep strong { color: #fff; }
</style>
```

---

## 4. The Creator

> *Expressive, aesthetic-forward, memorable. The slides ARE the experience.*

### Identity

| | |
|---|---|
| **Vibe** | Trendy, bold, visually distinctive - "remember this talk" |
| **Goal** | Stand out, create an experience, be memorable |
| **Context** | Conference keynotes, meetup talks, brand presentations, content showcases |
| **Audience** | Mixed/general, designers, marketers, community |

### Content Rules

- **Density**: Low-medium. Generous whitespace. Let the design breathe.
- **Language**: Conversational, sometimes provocative. Short sentences. Questions as slide titles.
- **Code**: Only if the talk is about code - and then make it a visual element, not a reference.
- **Diagrams**: Sparingly. Prefer split-background images over Mermaid when possible.
- **Bullets**: Max 3, with generous spacing. Or skip bullets entirely - use standalone statements.
- **Tables**: Rarely. When used, keep to 3 rows max.
- **Speaker notes**: Yes - the speaker carries the narrative, slides are visual punctuation.
- **Slide count**: High. Rapid-fire, 20-30 seconds per slide. More slides = more visual rhythm.
- **Visual elements**: Every slide needs a strong visual identity. Background images, bold colors, large type. No plain text slides.
- **What to avoid**: Dense information, corporate templates, predictable layouts, walls of bullets.

### Marp-Specific Constraints

Be honest: Marp is markdown, not Figma. The Creator archetype pushes Marp to its limits. What works well: bold gradients via CSS, split backgrounds (`![bg left:50%]`), large typography via scoped styles, color contrast. What doesn't work: custom fonts (limited to system fonts), complex image compositions, precise spatial layouts. If the user needs true design freedom, recommend exporting to PPTX and finishing in a design tool.

### Recommended Patterns

Favor: Image Split, Big Number Callout, Quote Slide, Full-Background slides, Standalone Statement
Avoid: Dense tables, multi-column data, code blocks, detailed architectures

### Narrative Frameworks

**Primary**: What → So What → Now What (conference talks)
**Secondary**: Problem → Solution → Impact (product storytelling)

### CSS Theme

Section classes: `title-slide`, `section-sunset`, `section-ocean`, `section-neon`

```html
<style>
/* === THE CREATOR === */
section {
  font-family: 'Inter', 'Helvetica Neue', system-ui, sans-serif;
  font-size: 24px;
  color: #1e293b;
  background-color: #ffffff;
  padding: 50px 70px;
}
h1 {
  font-size: 44px;
  font-weight: 800;
  color: #0f172a;
  letter-spacing: -1px;
  line-height: 1.1;
  margin-bottom: 20px;
}
h2 { font-size: 28px; font-weight: 700; color: #be185d; margin-bottom: 12px; }
h3 { font-size: 22px; font-weight: 700; color: #6b7280; }
strong { color: #be185d; }
table { font-size: 18px; border-collapse: collapse; width: 100%; }
th {
  background: linear-gradient(135deg, #be185d, #9333ea);
  color: #fff;
  font-weight: 600;
  padding: 12px 16px;
}
td { padding: 10px 16px; border-bottom: 1px solid #f3e8ff; }
blockquote {
  font-size: 28px;
  font-weight: 600;
  border: none;
  background: linear-gradient(135deg, #fdf2f8 0%, #f5f3ff 100%);
  padding: 24px 32px;
  border-radius: 16px;
  color: #581c87;
}
pre {
  font-size: 15px;
  background: #1e1b2e;
  color: #e2e8f0;
  border-radius: 16px;
  padding: 20px;
}
code { font-size: 15px; font-family: 'Cascadia Code', monospace; }
a { color: #be185d; font-weight: 700; text-decoration: none; }
img { border-radius: 16px; }
header { font-size: 13px; color: #a1a1aa; font-weight: 500; }
header strong { color: #be185d; font-weight: 700; }
footer { font-size: 12px; color: #a1a1aa; }
section.title-slide {
  background: linear-gradient(135deg, #ec4899 0%, #8b5cf6 50%, #3b82f6 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center; text-align: center;
}
section.title-slide h1 {
  font-size: 56px; color: #fff;
  text-shadow: 0 4px 30px rgba(0,0,0,0.15);
}
section.title-slide h2 { font-size: 24px; color: rgba(255,255,255,0.85); font-weight: 400; }
section.title-slide strong { color: #fff; }
section.section-sunset {
  background: linear-gradient(135deg, #dc2626 0%, #f59e0b 50%, #fbbf24 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-ocean {
  background: linear-gradient(135deg, #0ea5e9 0%, #6366f1 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-neon {
  background: linear-gradient(135deg, #a855f7 0%, #ec4899 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-sunset h1, section.section-ocean h1, section.section-neon h1 {
  color: #fff;
  text-shadow: 0 2px 10px rgba(0,0,0,0.15);
}
section.section-sunset h2 { color: #fef3c7; }
section.section-ocean h2 { color: #c7d2fe; }
section.section-neon h2 { color: #fce7f3; }
section.section-sunset strong, section.section-ocean strong, section.section-neon strong { color: #fff; }
</style>
```

---

## 5. The Educator

> *Clear, warm, cognitively optimized. Teach, don't impress.*

### Identity

| | |
|---|---|
| **Vibe** | Friendly, structured, patient - "I want you to understand this" |
| **Goal** | Transfer knowledge, build understanding, enable the audience |
| **Context** | Training sessions, onboarding, workshops, internal enablement, tutorials |
| **Audience** | Learners, new hires, non-specialists, workshop attendees |

### Content Rules

- **Density**: Low. One concept per slide. Err on the side of too little, not too much.
- **Language**: Clear, warm, jargon-free. Define terms when first used. "This is like a traffic cop for your data" > "The router dispatches events to consumers."
- **Code**: Minimal, and always with a plain-English explanation on the same slide. Build up code in stages across slides (show lines 1-3, then 1-6, then 1-10).
- **Diagrams**: Yes - simplified. Use Mermaid for step-by-step builds (show the same diagram growing across slides).
- **Bullets**: 2-3 max. Each is a simple, clear statement.
- **Tables**: Only for "at a glance" summaries. Never dense comparisons.
- **Speaker notes**: Verbose - with transitions, analogies, and questions to ask the audience.
- **Progressive disclosure**: Use Marp's fragmented lists (`*` marker) so items appear one at a time in HTML presentation.
- **Recap slides**: Add a 2-3 bullet recap slide at the end of each section. Repetition is a feature, not a bug.
- **Examples**: Every concept slide should be followed by an example slide. Concept → Example → Concept → Example.
- **What to avoid**: Information overload, assumed knowledge, jargon without definition, skipping examples.

### Recommended Patterns

Favor: Bullet List (sparse), Diagram (simplified), Before/After, Quote/Callout, Recap slides, Icon+Text
Avoid: Dense code, complex architecture diagrams, multi-axis comparisons

### Narrative Frameworks

**Primary**: What → So What → Now What (building understanding)
**Secondary**: Chronological (step-by-step walkthroughs)

### CSS Theme

Section classes: `title-slide`, `section-blue`, `section-teal`, `section-warm`

```html
<style>
/* === THE EDUCATOR === */
section {
  font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
  font-size: 24px;
  color: #1e293b;
  background-color: #ffffff;
  padding: 50px 65px;
  line-height: 1.6;
}
h1 {
  font-size: 36px;
  font-weight: 700;
  color: #0c4a6e;
  margin-bottom: 20px;
}
h2 { font-size: 28px; font-weight: 600; color: #0369a1; margin-bottom: 14px; }
h3 { font-size: 22px; font-weight: 600; color: #64748b; }
strong { color: #0369a1; }
table { font-size: 18px; border-collapse: collapse; width: 100%; }
th {
  background-color: #e0f2fe;
  color: #0c4a6e;
  font-weight: 600;
  padding: 10px 14px;
  border-bottom: 2px solid #0ea5e9;
}
td { padding: 10px 14px; border-bottom: 1px solid #e2e8f0; }
blockquote {
  font-size: 22px;
  border-left: 4px solid #0ea5e9;
  background-color: #f0f9ff;
  padding: 14px 22px;
  border-radius: 0 10px 10px 0;
}
pre {
  font-size: 16px;
  background-color: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 10px;
  padding: 18px;
  line-height: 1.5;
}
code {
  font-size: 16px;
  font-family: 'Cascadia Code', 'Fira Code', monospace;
  color: #0369a1;
}
pre code { color: #1e293b; }
a { color: #0369a1; text-decoration: underline; }
header { font-size: 13px; color: #94a3b8; }
header strong { color: #0369a1; font-weight: 600; }
footer { font-size: 12px; color: #94a3b8; }
section.title-slide {
  background: linear-gradient(135deg, #0c4a6e 0%, #0369a1 50%, #0ea5e9 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center; text-align: center;
}
section.title-slide h1 { font-size: 44px; color: #fff; }
section.title-slide h2 { font-size: 22px; color: #bae6fd; font-weight: 400; }
section.title-slide strong { color: #e0f2fe; }
section.section-blue {
  background: linear-gradient(135deg, #0c4a6e 0%, #0369a1 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-teal {
  background: linear-gradient(135deg, #134e4a 0%, #0d9488 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-warm {
  background: linear-gradient(135deg, #78350f 0%, #d97706 100%);
  color: #fff;
  display: flex; flex-direction: column; justify-content: center;
}
section.section-blue h1, section.section-teal h1, section.section-warm h1 { color: #fff; }
section.section-blue h2 { color: #bae6fd; }
section.section-teal h2 { color: #99f6e4; }
section.section-warm h2 { color: #fef3c7; }
section.section-blue strong, section.section-teal strong, section.section-warm strong { color: #fff; }
</style>
```

---

## Customizing Archetypes

All archetypes use the same structural pattern. To customize:

### Changing colors

Replace values in these key locations:
- `section` background + text color
- `h1`, `h2` heading colors
- `strong` emphasis color
- `th` table header background
- `blockquote` border + background
- Section divider class gradients

### Adding a logo

```css
section::after {
  content: '';
  position: absolute;
  right: 30px;
  top: 20px;
  width: 120px;
  height: 40px;
  background: url('./logo.png') no-repeat center / contain;
}
section.title-slide::after,
section[class*="section-"]::after {
  display: none;
}
```

### Mixing archetypes

Sometimes a deck needs The Builder for the architecture section but The Operator for the executive summary. Use `<style scoped>` to override the archetype CSS on specific slides:

```markdown
<!-- Switch to Operator style for exec summary -->
<style scoped>
section { font-family: 'Georgia', serif; background: #fafaf9; color: #1e293b; }
h1 { font-family: 'Helvetica Neue', sans-serif; font-size: 36px; color: #0f172a; }
</style>

# Executive Summary

...
```

This should be rare. If you're mixing archetypes on more than 2-3 slides, you probably need to split into two decks.

---

## Building a Custom Archetype

When none of the four built-in archetypes fit, construct one from the user's answers.

### Step 1: Map vibe words to font choices

| Vibe words | Header font | Body font | Monospace |
|-----------|-------------|-----------|-----------|
| corporate, professional, trustworthy | 'Segoe UI', system-ui | 'Segoe UI', system-ui | 'Cascadia Code' |
| minimal, clean, modern | 'Inter', 'Helvetica Neue' | 'Inter', system-ui | 'JetBrains Mono' |
| elegant, refined, sophisticated | 'Georgia', serif | 'Georgia', serif | 'SF Mono' |
| playful, friendly, approachable | 'Inter', system-ui (with rounded feel via letter-spacing) | 'Inter', system-ui | 'Fira Code' |
| techy, hacker, dev | 'JetBrains Mono', monospace | 'Inter', system-ui | 'JetBrains Mono' |
| bold, punchy, energetic | 'Inter', system-ui (weight: 800) | 'Inter', system-ui | 'Cascadia Code' |
| warm, earthy, organic | 'Georgia', 'Palatino', serif | 'Georgia', serif | 'Courier New' |

### Step 2: Map color direction to a palette

**From specific colors**: Use them directly. Generate 2 gradient pairs from the primary color for section dividers (darken by 30% for start, original for end).

**From brand references**:

| Brand reference | Primary | Secondary | Accent | Background |
|----------------|---------|-----------|--------|------------|
| "Stripe vibes" | `#635BFF` | `#0A2540` | `#00D4AA` | `#ffffff` |
| "Notion vibes" | `#37352F` | `#F7F6F3` | `#EB5757` | `#ffffff` |
| "Linear vibes" | `#5E6AD2` | `#1A1B25` | `#F2C94C` | `#1a1b25` |
| "Apple vibes" | `#1D1D1F` | `#F5F5F7` | `#0071E3` | `#ffffff` |
| "Vercel vibes" | `#000000` | `#111111` | `#0070F3` | `#000000` |
| "GitHub vibes" | `#24292F` | `#F6F8FA` | `#2F81F7` | `#ffffff` |
| "Cyberpunk" | `#FF00FF` | `#0D0D0D` | `#00FFFF` | `#0d0d0d` |
| "Y Combinator" | `#FB651E` | `#1A1A1A` | `#FFFFFF` | `#ffffff` |

**From mood descriptions**: Use this mapping:

| Mood | Primary | Accent | Background |
|------|---------|--------|------------|
| warm, cozy | `#B85042` (terracotta) | `#A7BEAE` (sage) | `#FDF6EC` (cream) |
| cool, calm | `#065A82` (ocean) | `#21295C` (midnight) | `#F0F9FF` (ice) |
| earthy, natural | `#2C5F2D` (forest) | `#97BC62` (moss) | `#F5F5F0` (linen) |
| energetic, bold | `#DC2626` (red) | `#F59E0B` (amber) | `#ffffff` |
| luxurious, premium | `#1A1A2E` (midnight) | `#C9A227` (gold) | `#1a1a2e` |
| fresh, light | `#059669` (emerald) | `#06B6D4` (cyan) | `#ffffff` |
| dark, moody | `#1E1E2E` (charcoal) | `#89B4FA` (periwinkle) | `#1e1e2e` |

### Step 3: Map density to sizing

| Density preference | Body font | H1 | Max bullets | Padding | Line height |
|-------------------|-----------|-----|-------------|---------|-------------|
| Dense / packed | 20px | 32px | 7 | 36px 52px | 1.4 |
| Medium | 22px | 36px | 5 | 44px 60px | 1.5 |
| Spacious / airy | 24px | 40px | 3 | 52px 72px | 1.7 |

### Step 4: Pick structural base

Choose the closest built-in archetype for content strategy and layout preferences:

- User wants dense + technical → base on **Builder** content rules
- User wants structured + decisive → base on **Operator** content rules
- User wants persuasive + bold → base on **Storyteller** content rules
- User wants clear + progressive → base on **Educator** content rules

Tell the user: "I'll use The [X]'s content structure as the skeleton - same slide pacing and narrative approach - but with your custom visual style."

### Step 5: Generate the CSS

Use the Builder/Operator/Storyteller/Educator CSS as a template. Replace:
- All color values with the custom palette
- Font families with the mapped fonts
- Font sizes with the density-mapped sizes
- Padding with the density-mapped padding
- Generate 3 section divider classes using gradient pairs from the primary color

Name the section classes descriptively based on the palette: `section-primary`, `section-secondary`, `section-accent` (or more specific names if the colors suggest them, like `section-ocean`, `section-gold`).

### Step 6: Present and confirm

Show the user:
- The color palette you chose (with hex values)
- The font pairing
- Which archetype you're using as the structural base
- A brief description: "Dark background, monospace headers, spacious layout, Storyteller content structure"

Get confirmation before generating the deck. The user may want to adjust colors or density after seeing the summary.
