# Spotify Clone — DevCamp 2.0 · Task 1

A static, multi-page Spotify clone built with **HTML5 and CSS3 only**.
No JavaScript. No frameworks. No build step.

> Live site: **(add your GitHub Pages / Netlify link here after deploying)**
> Repository: **(add your GitHub repo link here)**

---

## Pages

| # | Page | File | What's on it |
|---|------|------|--------------|
| 1 | **Home** | `index.html` | Navbar (logo + Home/Premium/Support/Download), hero with heading + subtext + *Sign up free* button, row of featured playlist cards, footer with link columns |
| 2 | **Browse** | `browse.html` | Same navbar + "Browse all" heading, flex genre cards (Pop, Hip-Hop, Chill, Workout, Synthwave, Indie) — each links to the playlist page |
| 3 | **Playlist Details** | `playlist.html` | Same navbar, playlist cover + title + description, styled **Play** button, track `<table>` (Track / Artist / Album / Duration) |
| 4 | **Sign up** *(optional bonus)* | `signup.html` | `<form>` with text/email/password/date inputs, radio plans, required checkbox |

All pages are linked with plain `<a href="...">` anchors.

## File structure

```
spotify-clone/
├── index.html          # Page 1 — Home
├── browse.html         # Page 2 — Browse
├── playlist.html       # Page 3 — Playlist Details
├── signup.html         # Page 4 — Sign up (bonus)
├── css/
│   └── style.css       # the single external stylesheet used by every page
├── images/
│   ├── logo.svg
│   ├── cover-pop.jpg
│   ├── cover-hiphop.jpg
│   ├── cover-chill.jpg
│   ├── cover-workout.jpg
│   ├── cover-midnight.jpg
│   ├── cover-lofi.jpg
│   ├── cover-acoustic.jpg
│   └── cover-indie.jpg
├── README.md
├── deploy.sh           # one-command publish (macOS / Linux / Git Bash)
└── deploy.ps1          # one-command publish (Windows PowerShell)
```

## Run it locally

Just open `index.html` in a browser. Or serve it on `http://localhost:8000`:

```bash
python3 -m http.server 8000
# then visit http://localhost:8000
```

## ✅ Requirement checklist

| Requirement | Where it lives |
|---|---|
| Semantic `<header>` / `<nav>`, `<main>`, `<footer>` | every page |
| At least one `<form>` with `<input>` | search form in the navbar of every page + full sign-up form in `signup.html` |
| `<img>` with proper `alt` text | all 9 images, plus the inline SVG logo |
| `<a href="">` linking all pages | navbar + footer on every page |
| `<table>` or list for tracks | `<table class="track-table">` in `playlist.html`; `<ul class="artist-list">` and `<ul class="credit-list">` elsewhere |
| External `style.css` — no inline/internal CSS | `css/style.css`, linked once per page |
| Class selectors reused across pages | `.navbar`, `.btn`, `.btn-primary`, `.card`, `.cards-row`, `.genre-card`, `.filter-chip`, `.panel`, `.stat`, `.footer-column` … |
| ID selector for one unique element | `#hero-heading`, `#browse-heading`, `#playlist-title`, `#signup-heading` (one per page) |
| Flexbox used at least twice | navbar, search form, `.cards-row`, `.genre-grid`, `.playlist-hero`, `.footer-inner`, `.choice-group`, `.stats-strip` (8+) |
| Box model used intentionally | `padding`/`margin` on navbar, cards, table cells, form fields; `border-radius` on every card, pill and button; `box-sizing: border-box` globally |
| Consistent palette — green `#1DB954`, black `#191414` | CSS custom properties in `:root` |
| **Bonus:** hover effect on a button / link | `.btn-primary:hover`, `.play-button:hover`, `.card:hover`, `.genre-card:hover`, `.track-table tr:hover`, nav + footer links |

## Design notes

* **Design tokens.** Every colour, radius and shadow lives in `:root` at the top of
  `style.css`, so the palette (`#1DB954` green on `#191414` black) stays consistent
  across all four pages.
* **Layout.** Flexbox does all the heavy lifting — no floats, no grid required.
  Cards use `flex: 1 1 200px` so they wrap gracefully on narrow screens.
* **Box model.** `box-sizing: border-box` is set globally, then padding, margin and
  `border-radius` are applied deliberately (nav height comes from padding; table cell
  padding sets the row rhythm).
* **Responsive.** Four breakpoints — the navbar re-flows below 1200px (search moves to its
  own centred line), the sign-up sidebar folds away below 900px, then below 720px the cards
  shrink and the Album column hides so Track / Artist / Duration stay readable. Verified with
  zero horizontal overflow at 1440 / 1200 / 1024 / 768 / 480 / 320px.
* **Accessibility.** `alt` text on every image, `scope="col"` on table headers,
  `aria-label` on icon-only buttons, a `.visually-hidden` utility for screen-reader-only
  labels, and `:focus-visible` outlines.

## Deploy in 2 minutes

### Option A — GitHub Pages (all in one command)

```bash
cd spotify-clone
bash deploy.sh https://github.com/<your-username>/<repo-name>.git
```

The script initialises git, commits and pushes. Then in GitHub: **Settings → Pages →
Source: `main` / root → Save**. Your site appears at
`https://<your-username>.github.io/<repo-name>/`.

Prefer doing it by hand? Run the script's commands manually:

```bash
git init
git add -A
git commit -m "Spotify clone — DevCamp 2.0 Task 1"
git branch -M main
git remote add origin https://github.com/<your-username>/<repo-name>.git
git push -u origin main
```

### Option B — Netlify drag & drop (30 seconds, no git)

1. Go to <https://app.netlify.com/drop>
2. Drag the whole `spotify-clone` folder onto the page.
3. You instantly get a live URL.

### Option C — Vercel

```bash
npx vercel --prod
```

---

*Built for DevCamp 2.0. This is a learning project and is not affiliated with Spotify AB.*
