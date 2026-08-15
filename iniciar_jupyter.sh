#!/usr/bin/env bash
# Inicia Jupyter para conectar Cursor cuando no detecta el venv
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
PORT=8888
TOKEN="curso123"

cd "$DIR"
source .venv/bin/activate

echo "Iniciando Jupyter en http://localhost:${PORT}/?token=${TOKEN}"
echo ""
echo "En Cursor:"
echo "  1. Abre el notebook"
echo "  2. Selector de kernel -> Existing Jupyter Server..."
echo "  3. Pega: http://localhost:${PORT}/?token=${TOKEN}"
echo ""
echo "Ctrl+C para detener"
echo ""

jupyter server --port="$PORT" --ServerApp.token="$TOKEN" --ServerApp.password='' --no-browser
