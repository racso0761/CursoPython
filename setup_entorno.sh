#!/usr/bin/env bash
# Crea y configura el entorno virtual para notebooks
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
VENV="$DIR/.venv"

echo "==> Creando entorno virtual .venv (con copias reales, no symlinks) ..."
python3 -m venv --copies "$VENV"

echo "==> Instalando paquetes ..."
"$VENV/bin/pip" install --upgrade pip ipykernel numpy matplotlib jupyter

echo "==> Registrando kernel de Jupyter ..."
"$VENV/bin/python" -m ipykernel install --user --name venv --display-name "Python 3.13.5 (.venv)"

echo ""
echo "==> Verificación"
"$VENV/bin/python" --version
"$VENV/bin/python" -c "import ipykernel; print('ipykernel:', ipykernel.__version__)"
"$VENV/bin/python" -m jupyter kernelspec list

echo ""
echo "Listo. En Cursor:"
echo "  1. Abre Notebooks.code-workspace (no solo el .ipynb)"
echo "  2. Ctrl+Shift+P -> Developer: Reload Window"
echo "  3. Abre el notebook y selecciona kernel: Python 3.13.5 (.venv)"
echo "  4. Ejecuta una celda con Shift+Enter"
