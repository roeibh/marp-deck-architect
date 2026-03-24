# Contributing to marp-deck-architect

Thanks for your interest in improving this skill. Here's how to contribute.

## Ways to Contribute

### Add a New Archetype

An archetype is three layers, not just CSS. If you're adding one, you need all three:

1. **Theme CSS**: Add the complete CSS in `references/archetypes.md` following the existing pattern. Every archetype needs: base styles, typography (h1/h2/h3), table/blockquote/pre/code styling, header/footer, title slide class, and at least 3 section divider classes.
2. **Content strategy**: Define density rules (bullets per slide, code line limits), tone guidance (what language to use/avoid), emphasis priorities (what matters for this audience), and layout preferences (ranked list of favored slide types).
3. **Structural patterns**: Set a default narrative framework, pacing table (slides per duration), and any archetype-specific slide types (like the Educator's `.recap` class or progressive reveal patterns).

After adding to `references/archetypes.md`:
- Add a condensed version of the CSS to `commands/create-marp-deck.md` (the slash command is self-contained)
- Add a row to the archetype table in `SKILL.md`
- Update the selection matrix in `references/archetypes.md`
- Update the framework × archetype matrix in `references/storytelling.md`
- Create an example deck in `examples/` demonstrating the archetype

Test with a real deck — export to HTML, PDF, and PPTX and verify all section classes render correctly.

### Improve an Existing Archetype

If a built-in archetype's CSS, content rules, or layout preferences could be better:

1. Describe the problem — what output does the current archetype produce that isn't working?
2. Propose the change with before/after examples
3. Update both `references/archetypes.md` (full version) AND `commands/create-marp-deck.md` (condensed version) — they must stay in sync

### Add to the Custom Archetype System

The custom archetype flow (when users reject all four built-ins) uses lookup tables in `references/archetypes.md` under "Building a Custom Archetype." You can contribute:
- New brand reference palettes (Step 2)
- New mood → color mappings (Step 2)
- New vibe word → font mappings (Step 1)

### Add Slide Patterns

1. Add patterns to `references/slide-patterns.md`
2. Each pattern needs: a descriptive name, the complete Markdown example, and a note on which archetypes favor it
3. Keep examples generic — no proprietary content, no real company names
4. Someone should be able to copy-paste the pattern directly into a deck

### Add a Narrative Framework

1. Add to `references/storytelling.md`
2. Include: the structure outline, which archetypes it maps to, common mistakes, and slide count guidance
3. Update the framework × archetype matrix at the top of `references/storytelling.md`
4. Update the framework defaults table in `SKILL.md`

### Add Example Decks

1. Create a `.md` file in `examples/` named `{archetype}-{topic}.md` (e.g., `operator-quarterly-review.md`)
2. The deck should be 10-20 slides and follow the archetype's content strategy rules
3. Include varied layouts — tables, diagrams, code (if Builder), stat callouts, blockquotes
4. Include speaker notes on at least 3-4 slides
5. Export to HTML and verify it renders correctly
6. **No proprietary content** — use generic, universally applicable examples

### Improve the Export Script

1. Edit `scripts/export.sh`
2. All changes must be backward-compatible — existing flags and behavior must not break
3. Test on macOS and Linux

## Development Guidelines

### Keep SKILL.md Under 500 Lines

The main `SKILL.md` is the skill orchestrator. Heavy content belongs in `references/` files. If SKILL.md approaches the limit, move content to a reference file and add a pointer.

### Claude Code Command Must Be Self-Contained

`commands/create-marp-deck.md` is a Claude Code slash command — it cannot reference external files. All essential content (archetype CSS, content rules, interview flow, custom archetype flow) must be inline. It's a condensed version of the full skill. When updating archetypes or flows, update **both** files.

### The Two-File Rule

Any change to archetype CSS, interview questions, content strategy, or the custom archetype flow must be reflected in:
1. The relevant `references/*.md` file (full version)
2. `commands/create-marp-deck.md` (condensed version)

PRs that update one but not the other will be asked to fix the sync.

### Test Your Changes

Before submitting:

1. Create a deck using the skill with your changes
2. Export to all three formats (HTML, PDF, PPTX)
3. Verify Mermaid diagrams render in HTML
4. Verify breadcrumb navigation is correct
5. Check that section divider CSS classes match the `<style>` definitions
6. If you changed an archetype's content rules, verify the generated deck follows them (density, tone, layout variety)

## Submitting Changes

1. Fork the repo
2. Create a feature branch: `git checkout -b add-archetype-academic`
3. Make your changes
4. Test with a real deck
5. Submit a PR describing what you changed and why

## Code Style

- Markdown: 2-space indentation for nested lists
- CSS: Properties on separate lines in reference files, condensed (single-line per rule) in the command file
- Bash: `set -euo pipefail`, consistent error/warn/info output functions
- No trailing whitespace

## Questions?

Open an issue. For archetype requests, describe the audience, intent, and aesthetic you're targeting. For pattern requests, include a sketch or description of the layout.