#!/usr/bin/env bash
# Vygeneruje SVG ke všem .puml souborům v této složce (rekurzivně).
# Běží přes Docker, takže není potřeba lokální Java ani plantuml.jar.
#
# Použití:
#   ./diagrams/render.sh            vygeneruje vše v diagrams/
#   ./diagrams/render.sh soubor.puml  vygeneruje jeden soubor
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Verze je připíchnutá schválně – musí souhlasit s PLANTUML_IMAGE
# v .github/workflows/diagramy.yml, jinak kontrola v CI hlásí rozdíly
# jen kvůli jiné verzi PlantUML.
IMAGE="plantuml/plantuml:1.2026.8"

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
