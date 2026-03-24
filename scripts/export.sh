#!/usr/bin/env bash
# export.sh - Robust Marp deck export with dependency checking
# Usage: ./export.sh <input.md> [formats...] [options]
# Formats: html pdf pptx all (default: all)
# Options:
#   --github-pages <dir>  Build for GitHub Pages into <dir>
#   --progress            Add progress bar to HTML
#   --mermaid             Pre-render Mermaid diagrams for PDF/PPTX
#   --editable-pptx       Generate editable PPTX (requires LibreOffice)

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[✓]${NC} $*"; }
warn()  { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*" >&2; }

# --- Parse arguments ---
INPUT=""
FORMATS=()
GITHUB_PAGES_DIR=""
PROGRESS=false
MERMAID=false
EDITABLE_PPTX=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --github-pages) GITHUB_PAGES_DIR="$2"; shift 2 ;;
    --progress)     PROGRESS=true; shift ;;
    --mermaid)      MERMAID=true; shift ;;
    --editable-pptx) EDITABLE_PPTX=true; shift ;;
    -*)             error "Unknown option: $1"; exit 1 ;;
    *)
      if [[ -z "$INPUT" ]]; then
        INPUT="$1"
      else
        FORMATS+=("$1")
      fi
      shift ;;
  esac
done

if [[ -z "$INPUT" ]]; then
  echo "Usage: $0 <input.md> [html|pdf|pptx|all] [options]"
  echo ""
  echo "Formats (default: all):"
  echo "  html    HTML presentation (best for presenting)"
  echo "  pdf     PDF document"
  echo "  pptx    PowerPoint file"
  echo "  all     All three formats"
  echo ""
  echo "Options:"
  echo "  --github-pages <dir>  Build HTML into <dir> for GitHub Pages"
  echo "  --progress            Add progress bar to HTML"
  echo "  --mermaid             Pre-render Mermaid diagrams for PDF/PPTX"
  echo "  --editable-pptx       Generate editable PPTX (needs LibreOffice)"
  exit 1
fi

if [[ ! -f "$INPUT" ]]; then
  error "File not found: $INPUT"
  exit 1
fi

# Default to all formats
if [[ ${#FORMATS[@]} -eq 0 ]] || [[ " ${FORMATS[*]} " =~ " all " ]]; then
  FORMATS=(html pdf pptx)
fi

BASENAME="${INPUT%.md}"

# --- Dependency checks ---
check_marp() {
  if ! npx @marp-team/marp-cli@latest --version &>/dev/null; then
    error "Marp CLI not available. Ensure Node.js is installed."
    error "Marp is invoked via npx - no global install needed."
    exit 1
  fi
  info "Marp CLI available"
}

check_browser() {
  local browsers=("google-chrome" "chromium-browser" "chromium" "microsoft-edge" "firefox")
  for browser in "${browsers[@]}"; do
    if command -v "$browser" &>/dev/null; then
      info "Browser found: $browser"
      return 0
    fi
  done
  return 1
}

check_marp

NEEDS_BROWSER=false
for fmt in "${FORMATS[@]}"; do
  if [[ "$fmt" == "pdf" || "$fmt" == "pptx" ]]; then
    NEEDS_BROWSER=true
    break
  fi
done

if $NEEDS_BROWSER; then
  if ! check_browser; then
    warn "No compatible browser found (Chrome/Chromium/Edge/Firefox)"
    warn "PDF and PPTX export may fail. HTML export will still work."
  fi
fi

# --- Mermaid pre-rendering ---
if $MERMAID; then
  info "Pre-rendering Mermaid diagrams..."

  MERMAID_DIR="${BASENAME}-mermaid"
  mkdir -p "$MERMAID_DIR"

  # Extract Mermaid blocks and render to SVG
  COUNTER=0
  TEMP_INPUT="${BASENAME}-rendered.md"
  cp "$INPUT" "$TEMP_INPUT"

  # Simple Mermaid extraction - find ```mermaid blocks
  while IFS= read -r -d '' block; do
    COUNTER=$((COUNTER + 1))
    MermaidFile="${MERMAID_DIR}/diagram-${COUNTER}.mmd"
    SvgFile="${MERMAID_DIR}/diagram-${COUNTER}.svg"

    echo "$block" > "$MermaidFile"

    if npx @mermaid-js/mermaid-cli@latest -i "$MermaidFile" -o "$SvgFile" -t neutral -b transparent 2>/dev/null; then
      info "Rendered diagram $COUNTER → $SvgFile"
    else
      warn "Failed to render diagram $COUNTER - keeping Mermaid source"
    fi
  done < <(grep -Pzo '(?s)```mermaid\n\K.*?(?=\n```)' "$INPUT" | tr '\0' '\n' | csplit -z -f "${MERMAID_DIR}/block-" - '/^---SPLIT---$/' '{*}' 2>/dev/null || true)

  if [[ $COUNTER -eq 0 ]]; then
    info "No Mermaid blocks found - skipping pre-rendering"
    rm -rf "$MERMAID_DIR"
  fi
fi

# --- Build base Marp flags ---
MARP_FLAGS=(--no-stdin --html)

# Check for local images
if grep -qE '!\[.*\]\(\./|!\[.*\]\(images/' "$INPUT" 2>/dev/null; then
  MARP_FLAGS+=(--allow-local-files)
  info "Local files detected - using --allow-local-files"
fi

# --- Export ---
EXPORTED=()

for fmt in "${FORMATS[@]}"; do
  OUTPUT="${BASENAME}.${fmt}"
  FLAGS=("${MARP_FLAGS[@]}")

  case "$fmt" in
    html)
      if $PROGRESS; then
        FLAGS+=(--bespoke.progress)
      fi
      ;;
    pdf)
      FLAGS+=(--pdf)
      ;;
    pptx)
      FLAGS+=(--pptx)
      ;;
    *)
      warn "Unknown format: $fmt - skipping"
      continue
      ;;
  esac

  info "Exporting ${fmt}..."
  if npx @marp-team/marp-cli@latest "${FLAGS[@]}" "$INPUT" -o "$OUTPUT" 2>&1; then
    info "✓ ${OUTPUT} created ($(du -h "$OUTPUT" | cut -f1))"
    EXPORTED+=("$OUTPUT")
  else
    error "✗ ${fmt} export failed"
  fi
done

# --- Editable PPTX ---
if $EDITABLE_PPTX; then
  info "Generating editable PPTX..."
  EDITABLE_OUTPUT="${BASENAME}-editable.pptx"

  if ! command -v libreoffice &>/dev/null; then
    warn "LibreOffice not found - skipping editable PPTX"
  elif ! python3 -c "import pptx" &>/dev/null; then
    warn "python-pptx not installed - skipping text box fix"
    npx @marp-team/marp-cli@latest --no-stdin --html --pptx --pptx-editable --allow-local-files "$INPUT" -o "$EDITABLE_OUTPUT" 2>&1 || warn "Editable PPTX export failed"
  else
    npx @marp-team/marp-cli@latest --no-stdin --html --pptx --pptx-editable --allow-local-files "$INPUT" -o "$EDITABLE_OUTPUT" 2>&1 && \
    python3 -c "
from pptx import Presentation
from pptx.util import Emu
prs = Presentation('${EDITABLE_OUTPUT}')
margin = Emu(747720)
for slide in prs.slides:
    for shape in slide.shapes:
        if shape.has_text_frame and shape.shape_type == 17:
            tf = shape.text_frame
            if not tf.text.strip() or tf.text.strip().isdigit():
                continue
            font_size = None
            if tf.paragraphs and tf.paragraphs[0].runs:
                font_size = tf.paragraphs[0].runs[0].font.size
            if not font_size:
                continue
            new_width = prs.slide_width - margin - shape.left
            if new_width > shape.width:
                shape.width = new_width
            min_height = int(font_size * 1.4) * 2
            if shape.height < min_height:
                shape.height = min_height
            tf.word_wrap = True
prs.save('${EDITABLE_OUTPUT}')
" 2>&1 && info "✓ ${EDITABLE_OUTPUT} created" || warn "Editable PPTX post-processing failed"
  fi
fi

# --- GitHub Pages ---
if [[ -n "$GITHUB_PAGES_DIR" ]]; then
  info "Building for GitHub Pages → ${GITHUB_PAGES_DIR}/"
  mkdir -p "$GITHUB_PAGES_DIR"

  GH_FLAGS=(--no-stdin --html)
  if $PROGRESS; then
    GH_FLAGS+=(--bespoke.progress)
  fi
  if grep -qE '!\[.*\]\(\./|!\[.*\]\(images/' "$INPUT" 2>/dev/null; then
    GH_FLAGS+=(--allow-local-files)
  fi

  npx @marp-team/marp-cli@latest "${GH_FLAGS[@]}" "$INPUT" -o "${GITHUB_PAGES_DIR}/index.html" 2>&1 && \
    info "✓ ${GITHUB_PAGES_DIR}/index.html created" || error "GitHub Pages build failed"

  # Copy local assets
  for dir in images assets img; do
    if [[ -d "$dir" ]]; then
      cp -r "$dir" "${GITHUB_PAGES_DIR}/" 2>/dev/null && info "Copied ${dir}/ to ${GITHUB_PAGES_DIR}/"
    fi
  done
fi

# --- Summary ---
echo ""
echo "═══════════════════════════════════════"
echo " Export Complete"
echo "═══════════════════════════════════════"
for f in "${EXPORTED[@]}"; do
  echo "  → $f"
done
if [[ -n "$GITHUB_PAGES_DIR" ]]; then
  echo "  → ${GITHUB_PAGES_DIR}/index.html (GitHub Pages)"
fi
echo ""
