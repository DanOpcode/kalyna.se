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
| Altero Consulting | [Official site](https://www.alteroconsulting.com/) (also alteroconsulting.se) serves the matching logo as PNG. No matching vector found. Reduced the existing WebP from 16,740 to 5,400 bytes using a 64-colour palette with lossless WebP encoding; checked appearance against the original. |
| AVARN Security | [Official Swedish site](https://www.avarnsecurity.se/) uses an animated symbol plus raster wordmark (`/Static/gfx/logo-only-text.png`). [Identity page](https://www.avarnsecurity.se/om-oss/vision-och-identitet/) did not expose a matching downloadable vector. Retained full logo. |
| CELLINK | [Official site](https://www.cellink.com/) serves raster CELLINK wordmarks; the SVG references found were BICO investor logos. Retained the existing CELLINK / A BICO COMPANY artwork. |
| Lab Gruppen | Checked [official website](https://www.labgruppen.com/) and its downloads endpoint; automated downloads returned HTTP 403. No verified matching vector retrieved. Retained current logo. |
| IdAgree | Tried idagree.se (DNS failure) and idagree.com (timeout). No verified vector retrieved. Retained current logo. |

For the remaining five raster logos, an original SVG, AI, EPS, or vector PDF from
the company/designer is the best source. AI/EPS/vector PDF can be converted to SVG
with lettering outlined and a tight viewBox. A high-resolution raster can be
traced, but small lettering and curves need manual correction and visual approval.
An SVG containing an embedded PNG does not provide vector sharpness or the
expected size reduction. Existing WebP assets remain preferable to an inaccurate
trace or a different company's similarly named logo.
