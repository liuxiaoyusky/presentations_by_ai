#!/usr/bin/env bash
set -euo pipefail

# Extract PDF pages to PNG images.
# Usage: tools/extract-ppt-pages.sh <input.pdf> <out-dir>

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <input.pdf> <out-dir>" >&2
  exit 1
fi

IN="$1"
OUT="$2"
mkdir -p "$OUT"

if command -v pdftoppm >/dev/null 2>&1; then
  pdftoppm -png -rx 200 -ry 200 "$IN" "$OUT/page"
elif command -v mutool >/dev/null 2>&1; then
  mutool draw -o "$OUT/page-%03d.png" -r 200 "$IN"
elif command -v gs >/dev/null 2>&1; then
  gs -q -dNOPAUSE -dBATCH -sDEVICE=png16m -r200 -sOutputFile="$OUT/page-%03d.png" "$IN"
elif command -v magick >/dev/null 2>&1; then
  magick -density 200 "$IN" "$OUT/page-%03d.png"
elif command -v convert >/dev/null 2>&1; then
  convert -density 200 "$IN" "$OUT/page-%03d.png"
else
  echo "No PDF rasterizer found. Install one of: poppler (pdftoppm), mupdf (mutool), ghostscript (gs), or ImageMagick (magick/convert)." >&2
  exit 2
fi

echo "Extracted images to: $OUT"
