# Site improvements and validation — 25 October 2026

Scope: branch starts at main 65783bb. Shared Elixir content/components remain authoritative; the production build includes committed HTML, Markdown and the branded 404. No external accounts or separate repositories changed.

## Decisions and fixes

- All 12 cards use native details/summary, with company-specific names and native expanded state. No max-height, clipping, disclosure JavaScript, extra regions, focus movement or focusable hidden descendants. The shared name preserves exclusive opening in browsers supporting grouped details; older browsers can open multiple cards. Both behaviors retain access to all content.
- Print CSS exposes the native details content, including closed cards. Verified in current Chromium with JavaScript disabled. Older browsers lacking ::details-content may require opening cards before printing; check other supported print engines before promising equivalent output there.
- Removed obsolete IE metadata and invalid disclosure button descendants. Decorative SVGs and redundant company/Kvadrat logos are silent. Portraits identify Daniel. Ukrainian words/song title have lang=uk; Swedish flower alternative is translated.
- Added bilingual skip and section links, stable main/expertise/experience IDs, consistent focus indicators, underlined contact links and scroll padding. Settings stay in document flow. No positive tabindex. Reduced motion disables transitions, including the existing project-image movement.
- Changed dark disclosure text to white so the lightest hover background meets normal-text contrast. Reflow fixes allow settings to wrap, grid/flex children to shrink, long text to break, portraits to fit, and the hero logo to retain its intended width.
- Kept company-name H1 and made the adjacent opening identify Daniel, consultancy relationship, Stockholm/remote service area and supported work. Titles and descriptions match in meaning in Swedish/English. No new availability claims.
- IMY's 2024–2026 completed status is established in current source and existing tests. Its contribution now uses past tense in both languages and generated representations.
- Stable JSON-LD entity IDs and references retained. Added supported alternateName, description, public legal name/VAT/telephone and an existing 576×576 portrait (decoded in browser tests). Jason serializes the graph and escapes <. Properties/types reviewed against Schema.org Person, Organization and WebSite; tests parse both graphs, check identities, types, values and internal references. Fragment IDs are entity identifiers, not extra page routes.
- Sitemap remains exactly the two canonical indexable homepages. No reliable per-language meaningful-content modification date exists, so lastmod remains omitted. Static extra/404.html is outside Tableau's page sitemap.
- HTML/Markdown still share copy, dates, roles, technology lists, contact details and assignment content. llms.txt remains short with both Markdown links. Existing Content-Signal declaration is unchanged; it is not a guarantee that a crawler honors the preference, nor a Google ranking mechanism. The supplied task ends mid-sentence at “Content-Signa”; no missing instruction was inferred.

## Validation evidence and limits

- Production: MIX_ENV=prod mix build. ExUnit: 27 passed. Chromium desktop/mobile suite: 42 passed.
- Browser regression tests cover both languages, all 12 disclosures by pointer/Enter/Space, native exclusivity, logical retained focus, no JavaScript, skip link focus, fragments/unique IDs, forced colors, reduced motion, 320 CSS px, text-spacing overrides and combined 200% root text size at 320 px. At a 1280px desktop width, 400% browser zoom corresponds to the tested 320 CSS px reflow width; an actual browser-chrome zoom/screen-reader session was not available.
- Spacing overrides: line-height 1.5, paragraph margin 2em, letter spacing .12em, word spacing .16em. No horizontal overflow in tested cases; all print panels visible.
- Axe-core 4.10.3 run through VM Playwright, WCAG 2 A/AA, 2.1 AA and 2.2 AA tags: zero violations across Swedish/English × light/dark × closed/first-open states. Color-contrast has incomplete results requiring review; this is not a full conformance assessment. Reduced motion used during measurement to avoid sampling theme transitions.
- Actual Chromium computed colors converted to sRGB for contrast. Muted body against the lighter gradient endpoint: light 6.92:1, dark 11.87:1. Badges 7.23:1. Disclosure: light hover 9.45:1, dark hover 4.76:1. Contact links: light 5.25:1, dark 8.06:1. Daily Diff description 12.56:1 and button 13.97:1. Body headings/normal text are darker/lighter than muted text. Blue/red filled buttons and their darker hover states were reviewed with the same 4.5:1 threshold; light/dark text links and hover styles remain distinct via underlines where within prose.
- Focus uses 3px blue #1d4ed8 on light surfaces, cyan #67e8f9 on dark/project surfaces, with 4px offset; reviewed against adjacent surfaces at 3:1. Native arrow inherits text color. Company logos and decorative icons are not relied upon as controls. Forced-colors outline uses system Highlight.
- Important controls have generous padding (summary >=48px normally, settings >=48px, primary actions >=48px). Contact links gain vertical padding. Section links wrap with padding and gaps. Inline prose links retain the inline target-size exception; a 22px height alone is not a demonstrated 2.5.8 failure.
- Full-page Tab traversal checked 34 interactive stops after the skip link in each language/theme, with visible outlines, viewport visibility and no stops inside closed panels; Shift+Tab was also exercised.
- Chromium accessibility tree confirms all native disclosures have unique names and expanded=true/false, with closed panel prose excluded. This is an accessibility-tree inspection, **not a screen-reader test**.
- Nu validation of final generated documents: no HTML errors. Modern Tailwind stylesheet warnings are recorded below.
- Existing tests verify metadata, shared Markdown, image loading/srcsets/dimensions, theme persistence, contact links, headings, crawler resources, canonical/hreflang and sitemap. Local references/fragments and JSON-LD resources additionally checked.
- Live curl checks on 25 October: HTTP → HTTPS 301; apex HTTPS → www 301; /en → /en/ 301; both canonical pages 200; unknown path 404; both Markdown pages 200 with text/markdown; no X-Robots-Tag restriction found. /index.html and /en/index.html return 200 with their own language canonical. These checks describe pre-PR production; nothing was deployed.
- No real screen reader is installed/available here. No claim of full WCAG conformance, ranking gains or search-display changes.

### Exact remaining manual checks

With NVDA + Firefox or VoiceOver + Safari, for each language and both themes:

1. Tab from page start: skip link appears; Enter reaches main. Read title, H1, introduction and landmarks.
2. Navigate summaries: hear “Visa mer om [company]” / “Show more about [company]”, collapsed. Enter and Space open; hear expanded. Read the panel, then close. Closed prose must disappear from reading/navigation. Open another company and confirm previous state updates. Tab/Shift+Tab retains logical focus without hidden stops.
3. Read the Kalyna section: Ukrainian words/title use Ukrainian pronunciation where the installed voice supports it. Check portrait and linked project names.
4. Tab through every link/select/summary in both directions, including section anchors; confirm visible, unobscured focus. Set theme using keyboard, switch language and reload.
5. Use actual browser 400% zoom at 1280px and 200% text-only enlargement. Repeat spacing overrides and open the longest Consilium/Cellink cards; inspect after resize. Check no overlap/clipping/lost actions. Print preview all companies in Safari/Firefox too.
6. Check OS high contrast/forced colors, hover/focus, touch targets and reduced motion on a real device. Automation cannot establish comfortable use or every assistive-technology combination.

## CSS validator interpretation

Nu still flags Tailwind-generated registered @property rules, margin-trim within @supports, and custom properties in transition-property. These are modern CSS, not 50 independent broken styles. Unsupported margin-trim is guarded by feature detection; registered custom properties and transition lists degrade without preventing content access. No Tailwind version change or CSS removal was made to satisfy the validator.

References: [@property](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/At-rules/@property), [transition-property](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/transition-property), [margin-trim](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/margin-trim), [details content](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Selectors/::details-content).

## Owner inputs and future content

Carmenta remains deliberately factual and brief. Needed to expand it: approved assignment scope/product context, Daniel's responsibilities versus team responsibilities, concrete pipeline/infrastructure/tooling work, constraints, publishable outcomes with evidence, and permission to disclose client details. No fabricated outcomes added.

Personal/family/travel copy is unchanged: no authoritative newer owner statement exists in this repository. Owner should confirm whether annual travel, family wording, dates/current assignments, contact/profile URLs and the network description remain current.

Do not create near-duplicate service/profile pages from this one-page portfolio. A future useful bilingual service page could explain C#/.NET maintenance/migrations, fullstack integrations and DevOps delivery, each with confirmed scope, process, typical deliverables and a real project example. Substantial Cellink/Consilium case studies could use existing assignment/contribution material as a starting point, but need owner-approved problem context, constraints, individual contribution, current disclosure permission, and demonstrable outcomes. Add translated navigation, self-canonicals and sitemap URLs only when publishing distinct substantial pages.

## Hosting follow-up (not applied)

GitHub Pages serves committed docs; it ignores Netlify-style _headers/_redirects. Cloudflare is already in front of it. Keep existing HTTPS, www and /en/ rules and genuine missing-path 404 behavior.

In Cloudflare zone kalyna.se → Rules, prepare the following narrowly scoped rules as drafts, then review ordering with existing rules. They require proxied hostnames; no repository configuration can enact them.

1. Two Single Redirects (custom filter; static target; 301; Preserve query string enabled):
   - http.host eq "www.kalyna.se" and http.request.uri.path eq "/index.html" → https://www.kalyna.se/
   - http.host eq "www.kalyna.se" and http.request.uri.path eq "/en/index.html" → https://www.kalyna.se/en/
   Avoid blanket path rewrites or redirecting unknown paths to home.
2. Two Response Header Transform Rules, operation **Add static**, header **Link** (preserves other Link fields):
   - http.host eq "www.kalyna.se" and http.request.uri.path eq "/index.md"
     value: <https://www.kalyna.se/>; rel="canonical"
   - http.host eq "www.kalyna.se" and http.request.uri.path eq "/en/index.md"
     value: <https://www.kalyna.se/en/>; rel="canonical"
   Inspect existing rules first to avoid duplicate canonical Link values. Do not alter Content-Type, robots, cache policy or Markdown accessibility.
3. After the owner authorizes and applies hosting rules, verify with curl -I on all four exact paths and query-string variants. index.html should redirect once to the correct language, Markdown should remain 200 text/markdown with the expected Link header. Repeat unknown-path 404, homepage 200, http/apex and /en redirects. After this PR is eventually merged, also verify an unknown nested path serves the branded HTML with status 404 (direct /404.html may itself return 200).

Official instructions: [Single Redirect settings](https://developers.cloudflare.com/rules/url-forwarding/single-redirects/settings/), [Response Header Transform Rules](https://developers.cloudflare.com/rules/transform/response-header-modification/). This is duplicate-format management, not evidence of an urgent indexing failure.

Optional Search Console follow-up after an owner-approved release: inspect each canonical URL, rendered HTML and sitemap status. Request recrawl if appropriate; do not expect an immediate visible search feature.

## What structured data does

Google documents [WebSite for site-name preferences](https://developers.google.com/search/docs/appearance/site-names), [Organization for organization/logo information](https://developers.google.com/search/docs/appearance/structured-data/organization), and Person within [Article authors](https://developers.google.com/search/docs/appearance/structured-data/article) and [ProfilePage mainEntity](https://developers.google.com/search/docs/appearance/structured-data/profile-page). This company homepage is not relabeled ProfilePage.

A standalone Person graph does not guarantee a person card, knowledge panel or rich result. Schema validity, supported-feature eligibility, indexing and actual display are separate. Rich Results Test does not cover every Schema.org type or site-name markup; “No eligible items” alone does not invalidate Person data. There is no verified evidence from this audit that ChatGPT consumes this graph or gives it extra visibility. Markdown and llms.txt are optional retrieval aids, not Google requirements or ranking promises.

For the separate DanOpcode blog, recommend a future owner-reviewed sameAs identity link from its existing Person author to https://www.kalyna.se/#daniel-jonsson (and/or an author url to https://www.kalyna.se/#about). Keep the blog's own established author ID. No change to that repository is included here.
