# Test Project — Pandoc + LaTeX (KOMA-Script) => PDF Documentation

This repository contains a small documentation project showing how to build PDF output from Markdown using Pandoc and a KOMA-Script LaTeX template.

Prerequisites

- Install Pandoc (https://pandoc.org/) and ensure `pandoc` is on your PATH.
- Install a LaTeX distribution (TeX Live or MiKTeX) so `pdflatex`/`xelatex` are available.
- PowerShell (Windows) — the included build script is a PowerShell script.

Repository layout

- `docs/` — Markdown source files.
- `templates/` — Pandoc/LaTeX templates and configuration.
- `images/` — project images used in the documentation.
- `scripts/` — helper scripts; includes `build-documentation.ps1`.
- `output/` — build artifacts (PDFs, intermediate files).

Build (Windows PowerShell)
Open PowerShell in the repository root and run:

```powershell
.\scripts\build-documentation.ps1
```

The script will read the files in `docs/` and produce output in `output/`.

Troubleshooting

- If Pandoc or LaTeX commands are not found, add them to your PATH or install the missing software.
- Check `templates/` if you need to adjust document class or KOMA-Script options.
