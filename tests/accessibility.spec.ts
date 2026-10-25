import { test, expect } from 'playwright/test';

for (const lang of ['sv', 'en']) {
  test(lang + ': native disclosures without scripts, reflow, spacing and print', async ({ browser }) => {
    const context = await browser.newContext({ javaScriptEnabled: false, viewport: { width: 320, height: 800 } });
    const page = await context.newPage();
    await page.goto('http://127.0.0.1:4100' + (lang === 'en' ? '/en/' : '/'));
    await page.keyboard.press('Tab');
    await expect(page.locator('.skip-link')).toBeFocused();
    await page.keyboard.press('Enter');
    await expect(page.locator('main')).toBeFocused();
    for (const card of await page.locator('.company-item').all()) {
      await card.locator('summary').click();
      await expect(card.locator('.company-content')).toBeVisible();
    }
    await page.evaluate(() => { const style = document.createElement('style'); style.textContent = '* { line-height: 1.5 !important; letter-spacing: .12em !important; word-spacing: .16em !important; } p { margin-bottom: 2em !important; }'; document.head.append(style); });
    await expect(page.locator('body')).toHaveJSProperty('scrollWidth', 320);
    await page.evaluate(() => { document.documentElement.style.fontSize = '200%'; });
    await expect(page.locator('body')).toHaveJSProperty('scrollWidth', 320);
    await page.emulateMedia({ media: 'print' });
    for (const panel of await page.locator('.company-content').all()) await expect(panel).toBeVisible();
    await context.close();
  });

  test(lang + ': landmarks, links, keyboard order and forced colors', async ({ page }) => {
    await page.goto(lang === 'en' ? '/en/' : '/');
    await expect(page.locator('h1')).toHaveCount(1);
    await expect(page.getByRole('main')).toHaveCount(1);
    const ids = await page.locator('[id]').evaluateAll(els => els.map(el => el.id));
    expect(new Set(ids).size).toBe(ids.length);
    for (const href of await page.locator('a[href^="#"]').evaluateAll(els => els.map(el => el.getAttribute('href')!.slice(1)))) expect(ids).toContain(href);
    await page.emulateMedia({ forcedColors: 'active', reducedMotion: 'reduce' });
    const focusables = page.locator('a, select, summary');
    for (const element of await focusables.all()) {
      await element.focus();
      await expect(element).toBeFocused();
      expect(await element.evaluate(el => getComputedStyle(el).outlineStyle)).not.toBe('none');
    }
    const summary = page.locator('summary').first();
    await summary.focus();
    await page.keyboard.press('Enter');
    await expect(page.locator('details').first()).toHaveAttribute('open', '');
    await expect(summary).toBeFocused();
    await page.keyboard.press('Space');
    await expect(page.locator('details').first()).not.toHaveAttribute('open', '');
  });
}
