#!/usr/bin/env bash
# One-command publish to GitHub Pages. Run from inside the portfolio folder.
set -euo pipefail
REPO_URL="${1:-https://github.com/ZineddineBK-DEV/MyPortfolio.git}"

cd "$(dirname "$0")"
[ -f index.html ] || { echo "index.html missing — run build.py first"; exit 1; }
[ -f CV_Zineddine_Boubaker.pdf ] || { echo "CV PDF missing"; exit 1; }

if [ ! -d .git ]; then
  git init
  git branch -M main
fi

git add -A
git commit -m "Portfolio update $(date +%Y-%m-%d)" || echo "nothing new to commit"

if ! git remote get-url origin >/dev/null 2>&1; then
  git remote add origin "$REPO_URL"
fi

git push -u origin main
echo
echo "Pushed. Now: GitHub → Settings → Pages → Source: 'Deploy from a branch' → main / (root) → Save."
echo "Live in 1-2 minutes at: https://zineddinebk-dev.github.io/MyPortfolio/"
