import { test, expect } from 'playwright/test';

for (const [path, lang] of [['/', 'sv'], ['/en/', 'en']]) {
  test(lang + ': canonical formats, discovery and local resources remain consistent', async ({ page, request }) => {
    await page.goto(path);
    const canonical = 'https://www.kalyna.se' + path;
    await expect(page.locator('link[rel="canonical"]')).toHaveAttribute('href', canonical);
    for (const [code, url] of [['sv', '/'], ['en', '/en/'], ['x-default', '/']]) {
      await expect(page.locator('link[hreflang="' + code + '"]')).toHaveAttribute('href', 'https://www.kalyna.se' + url);
    }
    await expect(page.locator('link[type="text/markdown"]')).toHaveAttribute('href', canonical + 'index.md');
    const markdown = await (await request.get(path + 'index.md')).text();
    for (const fact of ['Daniel Jonsson', 'Kalyna Solutions AB', 'daniel@kalyna.se', 'Carmenta', '2024–2026', '2022–2025', 'C#', 'DevOps']) {
      expect(markdown).toContain(fact);
      await expect(page.locator('main')).toContainText(fact);
    }
    const resources = await page.locator('[src], link[href], a[href], [srcset]').evaluateAll(elements =>
      [...new Set(elements.flatMap(el => [
        el.getAttribute('src'), el.getAttribute('href'),
        ...(el.getAttribute('srcset')?.split(',').map(item => item.trim().split(' ')[0]) ?? [])
      ]).filter((url): url is string => !!url))]);
    for (const resource of resources) {
      const url = new URL(resource, canonical);
      if (url.origin !== 'https://www.kalyna.se') continue;
      const response = await request.get(url.pathname);
      expect(response.ok(), url.href).toBe(true);
      if (url.hash && url.pathname === path) {
        expect(await page.locator('[id]').evaluateAll((els, id) => els.some(el => el.id === id), decodeURIComponent(url.hash.slice(1)))).toBe(true);
      }
    }
    const graph = JSON.parse(await page.locator('script[type="application/ld+json"]').innerText())['@graph'];
    const ids = graph.map(node => node['@id']);
    expect(new Set(ids).size).toBe(ids.length);
    for (const node of graph) {
      for (const value of Object.values(node)) {
        if (value && typeof value === 'object' && '@id' in value) expect(ids).toContain(value['@id']);
      }
      for (const key of ['image', 'logo']) if (node[key]) expect((await request.get(new URL(node[key]).pathname)).ok()).toBe(true);
    }
    expect(await page.locator('[onclick], [onchange]').count()).toBe(0);
    const sitemap = await (await request.get('/sitemap.xml')).text();
    expect([...sitemap.matchAll(/<loc>(.*?)<\/loc>/g)].map(match => match[1]).sort()).toEqual(['https://www.kalyna.se/', 'https://www.kalyna.se/en/']);
    const robots = await (await request.get('/robots.txt')).text();
    expect(robots).toContain('Content-Signal: search=yes, ai-input=yes, ai-train=yes');
    const index = await (await request.get('/llms.txt')).text();
    expect(index).toContain('https://www.kalyna.se/index.md');
    expect(index).toContain('https://www.kalyna.se/en/index.md');
  });

  test(lang + ': axe accessibility review (provide AXE_SOURCE)', async ({ page }) => {
    test.skip(!process.env.AXE_SOURCE, 'Set AXE_SOURCE to a local axe-core script; no project runtime dependency required.');
    await page.goto(path);
    await page.emulateMedia({ reducedMotion: 'reduce' });
    await page.addScriptTag({ path: process.env.AXE_SOURCE! });
    for (const theme of ['light', 'dark']) {
      await page.locator('#theme-preference').selectOption(theme);
      for (const open of [false, true]) {
        if (open) await page.locator('summary').first().click();
        const violations = await page.evaluate(async () => {
          const result = await (window as any).axe.run(document, {
            runOnly: { type: 'tag', values: ['wcag2a', 'wcag2aa', 'wcag21aa', 'wcag22aa'] }
          });
          return result.violations.map(v => ({ id: v.id, nodes: v.nodes.map(n => n.target) }));
        });
        expect(violations, theme + (open ? ' open' : ' closed')).toEqual([]);
        if (open) await page.locator('summary').first().click();
      }
    }
  });
}
