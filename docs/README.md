# docs

- `Pascal2J-Compiler-Roadmap.pdf` — the implementation and study roadmap (36 pp.).
- `roadmap.html` — its source. The PDF is rendered from it; edit the HTML, never the PDF.

Regenerate with any headless Chromium:

    chromium --headless --no-pdf-header-footer --print-to-pdf=Pascal2J-Compiler-Roadmap.pdf roadmap.html

(or via Playwright's `page.pdf(format="A4", print_background=True)` if you want the page-number footer).
