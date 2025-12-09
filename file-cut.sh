#!/bin/bash
# file-cut.sh
# Procesa un único fichero fastq (pasado como argumento)

set -euo pipefail

FRACTION=5   # alumno05 → 1/5 superior
FILE=$1

echo "Procesando $FILE ..."
TOTAL_LINES=$(wc -l < "$FILE")
CUT_LINES=$(( TOTAL_LINES / FRACTION ))
TMP_OUT="${FILE%.fastq}_cut.fastq"

head -n "$CUT_LINES" "$FILE" > "$TMP_OUT"
mv "$TMP_OUT" "$FILE"

echo "Corte completado en $FILE"

