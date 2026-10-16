# ---------------------------------------------------------------------------
# DevCamp 2.0 — Task 1 : publish the Spotify clone to GitHub (Windows).
#
#   powershell -ExecutionPolicy Bypass -File .\deploy.ps1 https://github.com/<user>/<repo>.git
#
# Then open:  GitHub repo -> Settings -> Pages -> Source: "main" / "root" -> Save
# Your live link becomes:  https://<your-username>.github.io/<repo-name>/
# ---------------------------------------------------------------------------
param(
    [Parameter(Mandatory = $true)]
    [string]$Remote
)

Write-Host "==> Preparing repository"
if (-not (Test-Path ".git")) { git init }

git add -A

$userName  = (git config user.name);  if (-not $userName)  { $userName  = "DevCamp Student" }
$userEmail = (git config user.email); if (-not $userEmail) { $userEmail = "student@example.com" }

git -c user.name="$userName" -c user.email="$userEmail" `
    commit -m "Spotify clone - DevCamp 2.0 Task 1 (HTML + CSS, 4 pages)"

git branch -M main

$existing = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) { git remote set-url origin $Remote } else { git remote add origin $Remote }

Write-Host "==> Pushing to $Remote"
git push -u origin main

Write-Host ""
Write-Host "Done. Next step: GitHub -> Settings -> Pages -> Source: main / root -> Save."
Write-Host "Live URL will be https://<your-username>.github.io/<repo-name>/"
