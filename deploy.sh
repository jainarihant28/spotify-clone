#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# DevCamp 2.0 — Task 1 : publish the Spotify clone to GitHub in one command.
#
#   bash deploy.sh https://github.com/<your-username>/<repo-name>.git
#
# Then open:  GitHub repo -> Settings -> Pages -> Source: "main" / "root" -> Save
# Your live link becomes:  https://<your-username>.github.io/<repo-name>/
# ---------------------------------------------------------------------------
set -euo pipefail

REMOTE="${1:-}"

if [ -z "$REMOTE" ]; then
  echo "Usage: bash deploy.sh <remote-git-url>"
  echo "Example: bash deploy.sh https://github.com/aditi/spotify-clone.git"
  exit 1
fi

echo "==> Preparing repository"
if [ ! -d .git ]; then
  git init
fi

git add -A
git -c user.name="$(git config user.name || echo 'DevCamp Student')" \
    -c user.email="$(git config user.email || echo 'student@example.com')" \
    commit -m "Spotify clone — DevCamp 2.0 Task 1 (HTML + CSS, 4 pages)" || echo "   (nothing new to commit)"

git branch -M main

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REMOTE"
else
  git remote add origin "$REMOTE"
fi

echo "==> Pushing to $REMOTE"
git push -u origin main

echo
echo "Done. Next step: GitHub -> Settings -> Pages -> Source: main / root -> Save."
echo "Live URL will be https://<your-username>.github.io/<repo-name>/"
