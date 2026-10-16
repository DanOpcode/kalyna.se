import { test, expect, type Locator } from '@playwright/test';

async function expectPortraitResource(portrait: Locator, index: number, density: number) {
  await portrait.scrollIntoViewIfNeeded();
  await expect(portrait).toBeVisible();
  await expect.poll(() => portrait.evaluate((image: HTMLImageElement) => image.complete && image.naturalWidth > 0)).toBe(true);
  const resource = await portrait.evaluate(async (image: HTMLImageElement) => {
    // naturalWidth on a srcset image is density-corrected. Decode the chosen
    // file separately to check its actual pixel dimensions.
    const selected = new Image();
    selected.src = image.currentSrc;
    await selected.decode();
    return { url: image.currentSrc, width: selected.naturalWidth, height: selected.naturalHeight };
  });
  const width = Math.min(3, Math.ceil(density)) * 192;
  const suffix = width === 192 ? '' : `-${width}`;
  expect(new URL(resource.url).pathname).toBe(`/images/profile${index + 1}${suffix}.webp`);
  expect(resource.width).toBe(width);
  expect(resource.height).toBe(width);
  const response = await portrait.page().request.get(resource.url);
  expect(response.status()).toBe(200);
  expect(response.headers()['content-type']).toContain('image/webp');
  expect((await response.body()).length).toBeLessThan(50 * 1024);
}

for (const language of ['sv', 'en']) {
  test(`${language}: content, navigation and image loading`, async ({ page }) => {
    const errors: string[] = [];
    page.on('pageerror', error => errors.push(error.message));
    await page.goto(language === 'en' ? '/en/' : '/');
    await expect(page.locator('html')).toHaveAttribute('lang', language);
    const languageSettings = await page.getByRole('navigation', { name: 'Language / Språk' }).boundingBox();
    const themeSettings = await page.locator('label').filter({ has: page.locator('#theme-preference') }).boundingBox();
    expect(languageSettings).not.toBeNull();
    expect(themeSettings).not.toBeNull();
    expect(languageSettings!.height).toBe(themeSettings!.height);
    expect(languageSettings!.y).toBe(themeSettings!.y);
    expect(languageSettings!.x + languageSettings!.width).toBeLessThan(themeSettings!.x);

    await expect(page.getByRole('heading', { name: 'Kalyna Solutions AB', exact: true })).toBeVisible();
    await expect(page.getByRole('link', { name: 'daniel@kalyna.se' })).toHaveAttribute('href', 'mailto:daniel@kalyna.se');
    await expect(page.getByRole('link', { name: /Mastodon/ })).toHaveAttribute('rel', 'me');
    await expect(page.getByRole('link', { name: 'Carmenta', exact: true })).toHaveAttribute('href', 'https://carmenta.com/');
    await expect(page.getByText('2024–2026', { exact: false })).toBeVisible();
    await expect(page.getByText('2022–2025', { exact: false })).toBeVisible();
    const portraits = page.locator('img[src^="/images/profile"]');
    await expect(portraits).toHaveCount(2);
    for (const [index, portrait] of (await portraits.all()).entries()) {
      await expect(portrait).toHaveAttribute('src', `/images/profile${index + 1}.webp`);
      await expect(portrait).toHaveAttribute('sizes', '192px');
      await expect(portrait).toHaveAttribute('srcset', `/images/profile${index + 1}.webp 192w, /images/profile${index + 1}-384.webp 384w, /images/profile${index + 1}-576.webp 576w`);
      await expectPortraitResource(portrait, index, await page.evaluate(() => window.devicePixelRatio));
    }
    const logo = page.getByRole('img', { name: /Carmenta/ });
    await expect(logo).toHaveCSS('filter', 'none');
    await expect(logo.locator('..')).toHaveCSS('background-color', 'rgb(255, 255, 255)');
    await expect(page.locator('body')).toHaveJSProperty('scrollWidth', await page.locator('body').evaluate(el => el.clientWidth));
    const images = page.locator('img');
    for (const image of await images.all()) {
      await image.scrollIntoViewIfNeeded();
      await expect.poll(() => image.evaluate((el: HTMLImageElement) => el.complete && el.naturalWidth > 0)).toBe(true);
    }
    await page.getByRole('link', { name: language === 'en' ? '🇸🇪 Svenska' : '🇬🇧 English' }).click();
    await expect(page.locator('html')).toHaveAttribute('lang', language === 'en' ? 'sv' : 'en');
    expect(errors).toEqual([]);
  });

  test(`${language}: expand and collapse experience`, async ({ page }) => {
    await page.goto(language === 'en' ? '/en/' : '/');
    const cards = page.locator('.company-item');
    await expect(cards).toHaveCount(12);
    for (let index = 0; index < 12; index++) {
      await expect(cards.nth(index).locator('.company-content')).toHaveAttribute('id', `content-company-${index + 1}`);
      await expect(cards.nth(index).getByRole('button')).toHaveAttribute('onclick', `toggleCompany('company-${index + 1}')`);
    }
    await expect(cards.first().getByRole('img', { name: /Carmenta/ })).toBeVisible();
    const more = language === 'en' ? 'Show more' : 'Visa mer';
    const less = language === 'en' ? 'Show less' : 'Visa mindre';
    const first = page.locator('.company-item').filter({ has: page.locator('#content-company-1') }).getByRole('button');
    await first.click();
    await expect(first).toHaveText(less);
    await expect(cards.first().getByText(language === 'en' ? 'I work with DevOps at Carmenta.' : 'Jag arbetar med DevOps hos Carmenta.', { exact: true })).toBeVisible();
    for (const technology of ['.NET', 'C#', 'Docker', 'Linux', 'Windows']) {
      await expect(cards.first().getByText(technology, { exact: true })).toBeVisible();
    }
    const panel = page.locator('#content-company-1');
    await expect.poll(() => panel.evaluate(el => el.clientHeight)).toBeGreaterThan(0);
    await page.getByRole('button', { name: more, exact: true }).first().click();
    await expect(first).toHaveText(more);
    await expect.poll(() => panel.evaluate(el => el.clientHeight)).toBe(0);
    const open = page.getByRole('button', { name: less, exact: true });
    await open.click();
    await expect(page.getByRole('button', { name: less, exact: true })).toHaveCount(0);
  });
}

test('theme follows the system and remembers explicit choices across languages', async ({ page }) => {
  await page.emulateMedia({ colorScheme: 'dark' });
  await page.goto('/');
  const html = page.locator('html');
  const select = page.locator('#theme-preference');
  await expect(select).toHaveValue('system');
  await expect(html).toHaveClass('dark');
  await expect(page.getByRole('img', { name: /Carmenta/ }).locator('..')).toHaveCSS('background-color', 'rgb(255, 255, 255)');
  await page.emulateMedia({ colorScheme: 'light' });
  await expect(html).not.toHaveClass('dark');
  await select.selectOption('dark');
  await page.reload();
  await expect(html).toHaveClass('dark');
  await expect(select).toHaveValue('dark');
  await select.selectOption('light');
  await page.emulateMedia({ colorScheme: 'dark' });
  await expect(html).not.toHaveClass('dark');
  await page.getByRole('link', { name: '🇬🇧 English' }).click();
  await expect(select).toHaveValue('light');
  await select.selectOption('system');
  await expect(html).toHaveClass('dark');
  await page.reload();
  await expect(select).toHaveValue('system');
  await expect(html).toHaveClass('dark');
});

test('theme remains usable when storage is blocked', async ({ page }) => {
  await page.addInitScript(() => {
    Storage.prototype.getItem = () => { throw new Error('Storage blocked'); };
    Storage.prototype.setItem = () => { throw new Error('Storage blocked'); };
    Storage.prototype.removeItem = () => { throw new Error('Storage blocked'); };
  });
  await page.goto('/');
  await page.locator('#theme-preference').selectOption('dark');
  await expect(page.locator('html')).toHaveClass('dark');
  await page.locator('#theme-preference').selectOption('light');
  await expect(page.locator('html')).not.toHaveClass('dark');
});

test('page styles and saved theme work without external CSS or theme requests', async ({ page }) => {
  await page.emulateMedia({ colorScheme: 'light' });
  await page.addInitScript(() => localStorage.setItem('theme', 'dark'));
  const requests: string[] = [];
  await page.route(/\/(css\/site\.css|js\/theme\.js)$/, async route => {
    requests.push(route.request().url());
    await route.abort();
  });
  await page.goto('/');
  await expect(page.locator('html')).toHaveClass('dark');
  await expect(page.locator('#theme-preference')).toHaveValue('dark');
  await expect(page.getByRole('heading', { name: 'Kalyna Solutions AB', exact: true })).toHaveCSS('color', 'rgb(255, 255, 255)');
  await expect(page.locator('img[src="/images/profile1.webp"]')).toHaveAttribute('fetchpriority', 'high');
  expect(requests).toEqual([]);
});

test('portraits choose appropriately sized images on 2x screens', async ({ browser, baseURL }) => {
  const context = await browser.newContext({ baseURL, viewport: { width: 390, height: 844 }, deviceScaleFactor: 2 });
  try {
    const page = await context.newPage();
    await page.goto('/en/');
    const portraits = page.locator('img[src^="/images/profile"]');
    await expect(portraits).toHaveCount(2);
    for (const [index, portrait] of (await portraits.all()).entries()) {
      await expectPortraitResource(portrait, index, 2);
    }
  } finally {
    await context.close();
  }
});

test.describe('without JavaScript', () => {
  test.use({ javaScriptEnabled: false });
  test('both languages retain their production styles', async ({ page }) => {
    for (const path of ['/', '/en/']) {
      await page.goto(path);
      await expect(page.getByRole('heading', { name: 'Kalyna Solutions AB', exact: true })).toHaveCSS('font-size', '48px');
      await expect(page.locator('link[rel="stylesheet"]')).toHaveCount(0);
    }
  });
});
