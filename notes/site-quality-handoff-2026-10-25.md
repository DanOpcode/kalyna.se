# Performance, security and external validation — 25 October 2026

This extends [the implementation/accessibility review](site-review-2026-10-25.md). PR #68 remains the only PR; neither merge nor deployment was performed. Public measurements describe the existing site, not the unpublished PR.

## Disposition of the complete brief

| Category | Disposition | Evidence or remaining work |
| --- | --- | --- |
| 1. Experience disclosures | Implemented | 12 native disclosures; pointer/Enter/Space; names/states; no-JS, reflow, print and reduced motion. |
| 2. HTML validity | Implemented | Obsolete meta and invalid descendants removed. Nu: no HTML errors; 50 modern-CSS messages per language retained/documented. |
| 3. Keyboard/focus | Implemented | Skip/section links, focus styles, offsets; 34 focus stops per language/theme inspected. |
| 4. Alternatives/language/names | Implemented | Portrait identity, silent redundant logos/SVGs, Ukrainian annotations, translated flower alt, specific profile links. |
| 5. Accessibility review | Implemented | Demonstrated contrast/reflow fixes; axe/keyboard/forced-color/no-JS/spacing tests. Real screen reader and actual browser-chrome zoom require external access; exact checklist supplied. No certification claim. |
| 6. SEO fundamentals | Already correct | Self-canonicals, hreflang, x-default, sitemap, robots and genuine 404 preserved/tested. Index.html consolidation requires external configuration/access; exact rules supplied. |
| 7. Opening/metadata | Implemented | Factual bilingual introduction, Daniel in titles, service-specific descriptions. Company H1 preserved. |
| 8. Accuracy/evidence | Implemented | IMY tense aligned to established completion date; shared representations; section navigation added. Carmenta expansion, personal updates and new pages deferred because specific content is missing: see owner-input list. |
| 9. Sitemap/error page | Implemented | Branded bilingual 404; sitemap already correct. lastmod investigated and unnecessary without meaningful reliable dates. |
| 10. Structured data | Implemented | Stable IDs, supported public facts, larger portrait, parsing/reference checks, external Schema.org validation. Founder/profile-page expansion deferred because authoritative facts/distinct page content are missing. |
| 11. Structured-data explanation | Implemented | Feature support and validity/display distinctions documented; no rich-result/LLM promises. |
| 12. HTML/Markdown consistency | Already correct | Shared authoritative content retained; important facts/resources tested. Canonical HTTP Link headers require external configuration/access. |
| 13. AI retrieval | Already correct | Short llms.txt, both Markdown links, readable HTML, unchanged Content-Signal. Purposes distinguished below. |
| 14. Performance | Investigated and unnecessary | Measurements below do not justify CSS extraction or image/dependency changes. Theme listener improvement implemented for CSP maintainability. |
| 15. Caching | Requires external configuration/access | TTLs measured; precise freshness/release instructions below. No immutable URLs currently exist. |
| 16. Security headers | Implemented | Inline theme handler removed; hash-based CSP generator and enforcement regression test added. Public headers require external configuration/access; not claimed active. |
| 17. External handoff | Requires external configuration/access | Schema.org completed; Rich Results login error, PSI quota and CrUX credentials recorded. Search Console/Bing/Cloudflare steps below. |
| 18. Regression checks | Implemented | Existing tooling extended for discovery/metadata/assets/graphs/shared facts/robots/axe/CSP; no framework/runtime dependencies added. |
| 19. Verification/evidence | Implemented | Production build, formatter, 27 ExUnit and 52 Chromium tests pass; screenshots inspected. Public/preview and real AT limitations distinguished. |
| 20. One PR | Implemented | Updates remain in PR #68 against main. No merge or deployment. |

## AI retrieval and crawler access

Preserve exactly Content-Signal: search=yes, ai-input=yes, ai-train=yes. Search crawling discovers/indexes content; user-requested retrieval fetches material for a user's immediate request; training crawling collects data for model training. These purposes differ. A publisher preference does not prove any consumer follows it. Allowing model training is not necessary for search visibility. No speculative AI files were added; ordinary Swedish/English prose identifies Daniel and his services without JSON-LD. See [Google's AI features guidance](https://developers.google.com/search/docs/appearance/ai-features).

Requests used curl's own identity or normal browser/Lighthouse user agents, not verified crawler identities. Earlier differing Python/curl responses do not establish a Cloudflare defect. No security exception or bot bypass was applied.

## Performance measurements

Lighthouse **13.5.0**, temporary npm-exec installation outside the project, using existing VM Chromium **155.0.8059.12**. No separate Playwright/browser installation, project package or dependency upgrade. Exact settings, timestamps, request lists and tested URLs: [compact evidence JSON](performance-2026-10-25.json). HTML hashes identify the measured build; a subsequent formatter removed one blank line without changing behavior.

| Single-navigation run | Performance | FCP | LCP | CLS | TBT |
| --- | --- | --- | --- | --- | --- |
| Local generated Swedish, mobile | 100 | 1.28s | 1.58s | 0 | 0ms |
| Local generated English, desktop | 100 | 0.30s | 0.34s | 0 | 0ms |
| Public Swedish, mobile (pre-PR) | 99 | 1.40s | 1.40s | 0.042 | 0ms |

Lab observations, not promises or field Core Web Vitals. Machine load, network, geography and single-run variability limit comparison. Local Python serves uncompressed HTML without cache policy, Cloudflare or edge analytics injection. No controlled before/after gain is claimed. TBT is a lab blocking measure, **not INP**; navigation runs do not establish representative INP or its 75th percentile.

Mobile: 412×823 CSS px, DPR 1.75, simulated throttling, 4× CPU slowdown, 150ms RTT/~1.6Mbps. Desktop: 1350×940 CSS px, DPR 1, simulated throttling, 1× CPU; full RTT/throughput settings are in JSON. Responsive srcset/sizes, explicit dimensions, high-priority initial portrait and lower-page lazy loading are unchanged.

Local Swedish LCP was introductory text; English desktop LCP was about text. The portrait is not assumed always to be LCP. No render-blocking network stylesheet, external font or extra runtime JS bundle appeared. Inline CSS is ~29.5KB, source HTML ~124.5KB Swedish/~122.2KB English, theme source 1,271 bytes. Exact Lighthouse script bootup values are in JSON; total blocking time and local CLS were zero. Public CLS 0.042 versus local zero does not establish cause or a field improvement. The ~1MB social PNG is sharing metadata, not an initial-page image request.

Retaining inline CSS avoids another critical request; no measured rendering problem justifies refactoring it. A larger future multi-page site could benefit from shared cacheable CSS. Local cache-audit warnings reflect Python, not production.

Reproduce after a production build and serving docs on 4101:

    CHROME_PATH=/opt/playwright/chromium-1247/chrome-linux64/chrome npm exec --yes --package=lighthouse@13.5.0 -- lighthouse http://127.0.0.1:4101/ --only-categories=performance --chrome-flags='--headless --no-sandbox' --output=json --output-path=/tmp/kalyna-mobile.json

Add --preset=desktop and use /en/ for the recorded desktop configuration.

### Negotiated compression at the real edge

curl **8.18.0** performed GETs with Accept-Encoding br, gzip and identity. Values are downloaded encoded body bytes (size_download), not source sizes. Status 200, Content-Encoding and Vary: Accept-Encoding were checked.

| Public URL | Identity | Brotli | gzip |
| --- | --- | --- | --- |
| / | 122,787 bytes | 21,314 bytes | 21,354 bytes |
| /en/ | 120,505 bytes | 19,945 bytes | 20,262 bytes |

Markdown also negotiated Brotli: /index.md 7,856 bytes; /en/index.md 6,665 bytes. Compression is present; no change proposed. Reproduce, inspect the saved headers, then repeat for gzip/identity and /en/:

    curl -sS -H 'Accept-Encoding: br' -D /tmp/headers -o /tmp/body -w '%{size_download}\n' https://www.kalyna.se/

With --compressed, curl decodes the saved body; distinguish its size from transfer bytes.

### Analytics and field limits

No Cloudflare beacon appeared in sampled curl HTML or public Lighthouse requests. No analytics snippet exists in this repository. This does not establish absence for every visitor/configuration: the earlier audit saw analytics and injection can vary. A direct static.cloudflareinsights.com request failed to connect here (HTTP 000), so beacon download/execution cost was **not measured**. Analytics was neither removed nor added. The CSP candidate permits its documented script/connection hosts; owner must verify actual injection/destinations before enforcement. Existing Cloudflare Web Analytics may provide useful real-user data, but this audit has no account access.

Public Swedish/mobile PageSpeed API: **429 RESOURCE_EXHAUSTED**, shared daily quota exceeded. Direct CrUX query for https://www.kalyna.se: **403 PERMISSION_DENIED**, API identity required. No CrUX/Search Console field data obtained; traffic sufficiency is unknown, not proven insufficient. Record “insufficient data” only if the actual tool reports it. [Core Web Vitals guidance](https://developers.google.com/search/docs/appearance/core-web-vitals).

## Caching responsibilities and exact external actions

Repository: generated URLs/bytes, image selection and shared content. GitHub Pages: origin headers; this repo cannot activate _headers files. Cloudflare: edge/browser TTL overrides and purges. Current responses: HTML/Markdown max-age=600 (CF DYNAMIC); sampled mutable images max-age=2678400 (31 days); robots max-age=14400.

No URLs are content-fingerprinted. Width suffixes are **not** immutable identifiers. Do not add immutable/year-long TTLs to existing mutable URLs. Future content-hashed assets could use public, max-age=31536000, immutable only if old versions remain immutable and retained.

Owner actions, draft/review first. Scope every expression to http.host eq "www.kalyna.se", excluding news.kalyna.se:

1. Cache Rule for exact paths {"/" "/en/" "/index.html" "/en/index.html" "/index.md" "/en/index.md" "/llms.txt" "/sitemap.xml" "/robots.txt" "/404.html"}: **Bypass cache**. Keep HTML/Markdown's 600-second browser TTL. A Response Header Transform rule on these exact paths can set Cache-Control to public, max-age=600, must-revalidate so discovery files share the same freshness. This header does not itself change edge caching; the Cache Rule does. Do not use Cache Everything.
2. Cache Rule: http.host eq "www.kalyna.se" and starts_with(http.request.uri.path, "/images/"). **Eligible for cache**, Edge TTL override **1 hour**, Browser TTL override **1 hour**; check plan limits/order and owner acceptance of shortening the current 31-day browser TTL. No immutable.
3. Release matching HTML, Markdown, llms.txt and metadata together from committed docs. Purge exact changed public URLs, /, /en/, both Markdown URLs and changed image variants. Purging Cloudflare cannot evict already fresh browser copies. If a changed image must update immediately, give it a new versioned filename and update all HTML/Markdown/schema/social references together.
4. Verify actual GET Cache-Control/Age/CF-Cache-Status, both language contents and canonical headers after deployment, then repeat warm. Proposed rules are **not deployed**.

[Cache Rules settings](https://developers.cloudflare.com/cache/how-to/cache-rules/settings/). Keep existing redirects and the exact Markdown canonical/index.html rules in the implementation review.

## Security findings and staged configuration

Homepage/Markdown/image GET samples lacked HSTS, CSP, nosniff and Referrer-Policy. The unknown-path **404 already has** a restrictive CSP: default-src 'none'; style-src 'unsafe-inline'; img-src data:; connect-src 'self'. Preserve it; homepage absence does not mean absence everywhere. news.kalyna.se has separate headers outside this task.

Implemented: pre-paint theme initialization retained; dropdown synchronization/change binding now uses DOMContentLoaded/addEventListener. scripts/csp-candidate.py hashes exact production script/style bytes from both languages and branded 404, including JSON-LD conservatively. It prints a candidate; it deploys nothing. A regression test enforces it locally and checks both theme choices, disclosures and CSS without console errors. No unsafe-eval, unsafe-inline or wildcard host allowances.

Owner configuration, **not applied**:

1. Response Header Transform Rule, http.host eq "www.kalyna.se"; **Set static**:
   - X-Content-Type-Options: nosniff
   - Referrer-Policy: strict-origin-when-cross-origin
   - X-Frame-Options: DENY
   - Permissions-Policy: camera=(), microphone=(), geolocation=(), payment=()
   The site has no embeds or camera/mic/location/payment functionality. Do not affect other subdomains.
2. After each production build, run python3 scripts/csp-candidate.py. On exact HTML paths {"/" "/en/" "/index.html" "/en/index.html" "/404.html"}, set **Content-Security-Policy-Report-Only** to its printed value. Retain existing enforced CSP. Do not replace CSP globally or on GitHub's unknown-path response.
3. Candidate allows static.cloudflareinsights.com scripts and cloudflareinsights.com connections. Verify real edge additions, SVGs/assets, both themes/languages and analytics requests under report-only. Without an approved reporting endpoint there are browser diagnostics, not centralized reports. If the owner already has a collector, configure report-to/Reporting-Endpoints there; no invented tracking endpoint.
4. Before later enforcement, account for exact injected script/style bytes, resolve reports and retest storage-blocked/theme behavior. One inline byte changes its hash. Synchronize hashes with deployed/cached bytes and rollbacks. Manual hash maintenance is why enforcement is not recommended blindly. Report-only frame-ancestors does not block framing; X-Frame-Options supplies independent framing protection.
5. HSTS: HTTPS succeeded for www (200), apex (301) and linked news (200); complete subdomain/certificate inventory unavailable. After owner confirms enduring apex/www HTTPS and certificate renewal, a **hostname-scoped** rule for http.host in {"www.kalyna.se" "kalyna.se"} may set Strict-Transport-Security: max-age=86400 initially. No includeSubDomains or preload. Extend duration only after operational review; do not apply an unverified zone-wide policy.
6. Recheck negotiated GET headers on homepages, Markdown, images and unknown paths; verify real 404, content types, redirects and social-image fetches. No security-header ranking claim.

References: [report-only CSP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy-Report-Only), [Cloudflare response headers](https://developers.cloudflare.com/rules/transform/response-header-modification/), [HSTS operations](https://developers.cloudflare.com/ssl/edge-certificates/additional-options/http-strict-transport-security/).

## External validation and owner handoff

Completed without account access:

- **Schema.org Validator**, https://validator.schema.org/: each generated language's JSON-LD submitted in its script wrapper, code mode. Both: **0 errors, 0 warnings**, WebSite with referenced Person/Organization expanded inside it. This checks vocabulary/values, not Google eligibility, indexing or remote-image access. Local tests separately check images/references.
- **Rich Results Test**, https://search.google.com/test/rich-results: submitted generated Swedish graph in code mode; returned **“Something went wrong — Log in and try again”**. No eligibility result, CAPTCHA bypass or login attempt. Owner should repeat both full generated HTML pages/code and deployed URLs. Test does not support site-name markup/every Schema.org type; standalone Person is not guaranteed a rich result.
- OG/Twitter titles/descriptions/canonicals, image MIME/dimensions and references pass tests; public 1200×630 social PNG returned 200 image/png. No authenticated social-preview debugger available; platform-rendered cards remain unverified. Social cards generally use OG/Twitter, not proof of Person graph ingestion.
- Schema/error screenshots captured and visually inspected, plus initial local desktop/mobile/disclosure screenshots. No external failure presented as a pass.

After owner-approved deployment, using **existing** properties/accounts:

1. **Search Console:** URL Inspection on https://www.kalyna.se/ and https://www.kalyna.se/en/. Record indexing status, Google-selected/user-declared canonical and last crawl. Test live URL → View tested page → inspect rendered HTML/screenshot/languages/metadata/schema. Sitemaps → verify/submit https://www.kalyna.se/sitemap.xml and review processing/discovered URLs. Request indexing where appropriate. A 200 is not indexing evidence.
2. **Bing Webmaster Tools:** Sitemaps → check discovery/last processing; URL Inspection for both pages → review discovery/crawl/index status and canonical details where shown. Do not create new accounts/properties.
3. **Cloudflare:** Security Events/available bot logs → inspect real verified crawler requests, blocks/challenges/rate limits, request time/path, verified-bot classification and rule ID. Diagnose relevant events first; validate crawler identities using official guidance when needed. Do not infer access from spoofed user agents or disable broad protections. If events are unavailable/absent, record that evidence gap.
4. **Performance/field:** repeat deployed Lighthouse/PageSpeed on both URLs, mobile/desktop. Existing CrUX credentials, PageSpeed field panels or Search Console Core Web Vitals → record reporting window, URL/origin scope, 75th-percentile LCP/INP/CLS and sample availability. Say insufficient traffic only when actually reported; today's errors do not show that. Review existing Cloudflare Web Analytics if enabled.
5. **Social:** existing sharing debuggers or an ordinary test share of each canonical URL → verify image/title/description after cache refresh. No JSON-LD ingestion claim.
6. Complete real screen-reader/actual zoom/other print-engine checks in the initial review. No WCAG certification or search-display guarantee.

## Regression commands and outcomes

- Production build succeeds; generated changes committed.
- mix format --check-formatted passes after final formatting; mix test: 27 passed.
- AXE_SOURCE=/tmp/kalyna-axe.min.js npm test: 52 passed, desktop/mobile Chromium. For reproduction obtain axe-core 4.10.3 locally (e.g. its published cdnjs axe.min.js) and supply an absolute path. Normal npm test skips only optional axe cases if AXE_SOURCE is absent. No runtime dependency added.
- Tests cover console errors, image loading/selection, IDs/fragments/assets/links, shared HTML/Markdown facts, canonical/hreflang/sitemap, graph references, robots/llms, keyboard/disclosures/themes/storage/no-JS/print/reflow/spacing and locally enforced CSP.
- No separate lint or TypeScript-check command is configured. Playwright transpiles/executes the TypeScript tests; no independent tsc pass claimed.
- Nu: no HTML errors, retained modern Tailwind limitations. Final listener-change revalidation checks the same outcome.
