# Portfolio — Zineddine Boubaker

One self-contained file. No build step, no dependencies, no external requests:
the fonts are embedded, the icons are inline SVG, the JavaScript is vanilla.
It therefore works from `file://`, from a USB stick, or on any static host.

```
portfolio/
├── index.html                      ← the site (open this)
├── CV_Zineddine_Boubaker.pdf       ← linked from the three Download buttons
├── .nojekyll                       ← tells GitHub Pages to skip Jekyll
├── template.html                   ← source with {{FONT_*}} placeholders
├── build.py                        ← inlines the fonts → index.html
└── README.md
```

## Editing

Edit `template.html`, then run `python3 build.py` to regenerate `index.html`.
The script refuses to run twice on an already-built file, so the fonts can
never be embedded twice (`index.html` should stay around 180 KB).

If you only need a one-off text change, editing `index.html` directly is fine
too — just keep a copy.

## Publishing on GitHub Pages (recruiter-friendly)

Yes — this is exactly what GitHub Pages is for, and the site is already set up
for it. The CV download works there because the PDF sits next to `index.html`
and Pages serves it as `application/pdf`. Verified over HTTP: status 200,
`Content-type: application/pdf`.

### One-time setup, about 5 minutes

```bash
cd portfolio                       # the folder with index.html + the PDF
git init
git add .
git commit -m "Portfolio"
git branch -M main
git remote add origin https://github.com/ZineddineBK-DEV/MyPortfolio.git
git push -u origin main
```

Then in the browser:

1. Repository → **Settings** → **Pages**
2. Source: **Deploy from a branch** · Branch: **main** · Folder: **/ (root)**
3. **Save**. First build takes 1–2 minutes.

Your URL: **https://zineddinebk-dev.github.io/MyPortfolio/**

Rules for a repository page: the repo must be **public**, and `index.html` must
sit in the folder you point Pages at (root, here). The `.nojekyll` file in this
folder stops GitHub from running Jekyll over the files — keep it.

### Two things that make it work for recruiters

- **The CV filename.** Every download link carries
  `download="CV_Zineddine_Boubaker.pdf"`, so the recruiter gets
  `CV_Zineddine_Boubaker.pdf` and not a hashed file or an open browser tab. The
  link is in three places: header, hero and footer — including the hero, because
  the header button is hidden on phones.
- **A short URL.** `https://zineddinebk-dev.github.io/MyPortfolio/` is what this repo gives. If
  you want `zineddine.dev` or similar, buy the domain and point a CNAME at
  `zineddinebk-dev.github.io` in Settings → Pages → Custom domain.

### After it is live

Put the URL in four places, or the site does nothing:

1. CV header (next to the e-mail address)
2. LinkedIn profile → **Website** field (this one gets real traffic)
3. Your e-mail signature
4. Every application e-mail body

Check it on a phone before you send it out. Recruiters read on phones.

### Updating later

```bash
git add -A && git commit -m "Update projects" && git push
```
Pages rebuilds automatically in under a minute. To replace the CV, overwrite
`portfolio/CV_Zineddine_Boubaker.pdf` with the new PDF, then commit and push.

## The eight projects — verify each one before you deploy

The portfolio claims eight systems. Two came from your description, the rest is
either on your CV or inferred from the stack you already list. Anything you
cannot describe for two minutes in an interview must be deleted — a good
interviewer spends the whole conversation on the projects you claim.

| Project | Source | What you must be able to answer |
|---|---|---|
| Resource Management Dashboard | your CV | approval workflow, permission model |
| Ticketing & Resource Management System | your CV | data model, knowledge base, notifications |
| **Data Center Automation Portal** | your brief | which vSphere calls, how you handled long-running tasks |
| **Lab Environment Manager** | your brief | template → VM set, quota and expiry rules |
| Server & Storage Monitoring | inferred (your brief: "monitor server storage and everything vSphere APIs expose") | which metrics, how often collected, retention |
| Project Management Dashboard | your CV | Flutter offline sync conflict handling |
| Internal Reporting & KPI Service | inferred — **verify or delete** | aggregation pipelines, why a separate read path |
| Data Center Monitoring Dashboard (IoT) | your CV | MQTT topics, alerting rules |

Two specifics worth checking, because they are the kind of detail that gets
probed:

- The automation page says the application **signs into vSphere with its own
  service account**. If you actually used a per-user session or a personal
  account, change that line — it is a real design difference.
- It says provisioning runs as **tracked jobs with a state machine** rather
  than one long HTTP request. If your implementation simply awaited the call,
  soften it, or describe it as you actually did it.

Nothing here invents an employer. Every project sits under Prologic or your
freelance work, which is what keeps the story consistent with the CV.

## Before you send it out

1. **Add two public repositories.** The site says the project code isn't
   public, which is honest but leaves the GitHub link thin. Two small demo
   projects close that gap — for example a Node + Express REST API with JWT
   and tests, and an ESP32 → MQTT → dashboard mini project. README with a
   screenshot and a one-command start is enough.
2. **Check the reference section** — it shows Amir's quote. It only stays
   there once he has confirmed it is accurate.
3. **Add German** if you apply to employers advertising in German. A short
   `Lebenslauf` version of the CV and a German intro sentence in the hero
   would remove a common doubt.
4. **Update the "Learning" line** in the About facts as you progress with
   .NET and Azure — the Lachmann & Rink ad asks for both.
