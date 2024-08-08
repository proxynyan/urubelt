#!/bin/bash

# Directorio del repositorio
REPO_DIR=~/Desktop/web\ cinturones/urubelt

# Cambiar al directorio del repositorio
cd "$REPO_DIR" || { echo "Directorio $REPO_DIR no encontrado."; exit 1; }

# Fetch los últimos cambios desde el repositorio remoto
echo "Fetching latest changes..."
git fetch origin

# Pull los cambios más recientes desde la rama principal
echo "Pulling changes from origin..."
git pull origin main

# Verificar si hay cambios para añadir y commitear
if [[ -n $(git status --porcelain) ]]; then
  echo "Untracked files found, adding and committing..."
  git add .
  git commit -m "Automatic commit to sync with remote"
  git push origin main
else
  echo "No changes to commit."
fi
