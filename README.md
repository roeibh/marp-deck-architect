# 🎯 create-marp-deck

A Claude skill for creating professional presentations using [Marp](https://marp.app/). Works in **Claude Code** and **Claude.ai**.

> Archetypes, not just themes. The system doesn't just change colors - it changes how Claude *thinks about building your deck*.

## The Archetype System

Every deck is built for an archetype - a combination of aesthetic, intent, and audience context.

### The Builder
*Engineers, hackers, AI devs*
Dark mode, minimal, terminal-adjacent. High signal density. Code blocks and Mermaid diagrams over stock images. "Don't waste my time."

### The Operator
*Executives, PMs, consultants*
Clean, structured, McKinsey calm. Every slide answers "so what?" Pyramid principle, decision frameworks, insight-driven headlines.

### The Seller
*Founders, sales teams, fundraising*
Bold, punchy, YC pitch energy. Big numbers displayed like trophies. Visual momentum building toward an ask. Max 3 bullets per slide.

### The Creator
*Designers, speakers, community*
Expressive, gradient-heavy, visual-first. Generous whitespace, provocative questions as headlines. The slides ARE the experience.

### The Educator
*Teachers, trainers, enablement*
Friendly, clear, cognitively optimized. Progressive disclosure with fragmented lists. Concept → Example → Practice. Recap checkpoints every 5-7 slides.

## What the Archetype Changes

Each archetype defines three layers - not just visual design:

| Layer | What it controls |
|-------|-----------------|
| **Theme** | CSS: colors, fonts, spacing, section classes |
| **Content strategy** | How Claude writes: density, tone, what to emphasize, what to avoid |
| **Structural patterns** | Which layouts to favor, default narrative framework, pacing |

## Features

- **5 archetypes** with complete CSS + behavioral rules
- **5 narrative frameworks** mapped to archetypes (PSI, SCR, WSN, Chronological, Compare & Contrast)
- **Story-first interview** - 2 rounds, not 5 sequential questions
- **Outline approval** before any Markdown is generated
- **Mermaid diagrams** - inline for HTML, pre-render pipeline for PDF/PPTX
- **Speaker notes** - optional, with timing cues and transitions
- **Edit existing decks** - add, remove, restyle, restructure
- **Multi-format export** - HTML, PDF, PPTX, GitHub Pages
- **15+ slide layout patterns** tagged by archetype affinity

## Installation

### Prerequisites

- **Node.js** (Marp CLI runs via `npx`)
- **Chrome / Chromium / Edge / Firefox** (for PDF/PPTX export)

### Claude Code

```bash
# Copy
cp commands/create-marp-deck.md ~/.claude/commands/

# Or symlink
ln -s $(pwd)/commands/create-marp-deck.md ~/.claude/commands/
```

### Claude.ai

Copy the entire `create-marp-deck/` directory to your skills path.

## Usage

```bash
# New deck
/create-marp-deck Microservices migration strategy

# Edit existing
/create-marp-deck presentations/q1-review.md

# Restyle
/create-marp-deck restyle presentations/demo.md to The Builder
```

## Project Structure

```
create-marp-deck/
├── SKILL.md                          # Main orchestrator (Claude.ai)
├── commands/
│   └── create-marp-deck.md           # Self-contained slash command (Claude Code)
├── references/
│   ├── archetypes.md                 # 5 archetypes: CSS + content rules + patterns
│   ├── marp-syntax.md                # Complete Marp directive reference
│   ├── slide-patterns.md             # 15+ layouts tagged by archetype
│   └── storytelling.md               # 5 narrative frameworks
├── examples/
│   └── builder-technical-deep-dive.md
├── scripts/
│   └── export.sh                     # Multi-format export with dep checks
├── CONTRIBUTING.md
├── CHANGELOG.md
└── LICENSE                           # MIT
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). The most impactful contributions: new archetypes, slide patterns, and example decks.

## License

[MIT](LICENSE)
