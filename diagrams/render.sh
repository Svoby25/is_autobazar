#!/usr/bin/env bash
# Vygeneruje SVG ke všem .puml souborům v této složce (rekurzivně).
# Běží přes Docker, takže není potřeba lokální Java ani plantuml.jar.
#
# Použití:
#   ./diagrams/render.sh            vygeneruje vše v diagrams/
#   ./diagrams/render.sh soubor.puml  vygeneruje jeden soubor
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE="plantuml/plantuml:latest"

if [ $# -gt 0 ]; then
  TARGET="$1"
else
  TARGET="-r ."
fi

docker run --rm \
  -v "$DIR:/work" \
  -w /work \
  -u "$(id -u):$(id -g)" \
  "$IMAGE" -tsvg $TARGET

echo "Hotovo. Vygenerované SVG leží vedle zdrojových .puml."
