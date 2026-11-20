(() => {
  const storageKey = 'site-language-chosen';
  const navigation = document.getElementById('language-navigation');

  function rememberChoice(language) {
    try { localStorage.setItem(storageKey, language); } catch { /* Storage may be disabled. */ }
  }

  navigation.addEventListener('click', event => {
    const link = event.target.closest('a[hreflang]');
    if (link) rememberChoice(link.hreflang);
  });

  if (document.documentElement.lang !== 'sv') return;

  let savedLanguage;
  try {
    savedLanguage = localStorage.getItem(storageKey);
  } catch { return; }

  if (savedLanguage === 'en') {
    const englishURL = new URL(navigation.querySelector('[hreflang="en"]').href);
    englishURL.search = location.search;
    englishURL.hash = location.hash;
    location.replace(englishURL.href);
  }
})();
