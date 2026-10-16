# Company logo sources

Audit for issue #52, 16 October 2026. Preserve the logo identity used during the
engagement; a current rebrand is not automatically the same artwork.

| Logo | Result |
| --- | --- |
| Carmenta | Already SVG: `company_logo_carmenta.svg`. |
| RE:Base / RE:IT | Already SVG: `company_logo_reit.svg`. |
| Mentice | Already SVG: `company_logo_mentice.svg`. |
| Consilium | Already SVG: `company_logo_consilium.svg`. |
| Ericsson | Already SVG: `company_logo_ericsson.svg`. |
| Carnegie | Replaced raster with the matching historical red wordmark from [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Carnegie_Investment_Bank_logo.svg), which attributes the artwork to Carnegie Investment Bank and the source to carnegie.se. Download: https://upload.wikimedia.org/wikipedia/commons/a/a1/Carnegie_Investment_Bank_logo.svg. Current carnegie.se serves a different DNB Carnegie brand. |
| IMY | Downloaded the [official full logo SVG](https://www.imy.se/Static/dist/d8f11c23f74e7124c698.svg), including the agency name. Changed only its white fill (`#FFFFFF`) to `#003b49`, matching the previous raster logo. |
| Altero Consulting | Matching vector not found on the [official site](https://www.alteroconsulting.com/). Retained the original PNG and serve its optimized WebP derivative. |
| AVARN Security | Matching vector not found on the [official site](https://www.avarnsecurity.se/). Retained the original PNG and serve its WebP derivative, including the symbol, wordmark and Security tagline. |
| CELLINK | Use the official full CELLINK / A BICO COMPANY SVG supplied by the owner in [PR #55](https://github.com/DanOpcode/kalyna.se/pull/55#issuecomment-6210255965). [Original attachment](https://github.com/user-attachments/assets/f7ffd46b-f658-4b47-b403-d750926d3485). Changed only the white fill to black for the white logo card. |
| Lab Gruppen | [Official downloads](https://www.labgruppen.com/) returned HTTP 403. Retained the original PNG and serve its optimized WebP derivative. |
| IdAgree | Candidate domains failed DNS resolution or timed out. Retained the original JPEG and serve its optimized WebP derivative. |

## Raster fallbacks

Use original SVG artwork when available. Otherwise, retain the original PNG/JPEG
in `assets/logo-sources/` and generate a WebP in `extra/images/` using
`scripts/optimize-images.py`. The homepage serves the WebP; the source originals
are not published. Do not trace raster artwork into SVGs.

The company derivatives are bounded to 528 × 160 pixels, without upscaling, for
up to 2× their displayed size. Altero uses a 64-colour palette with lossless WebP
encoding; the other raster logos use quality 85 WebP encoding. See the README
for regeneration commands.
