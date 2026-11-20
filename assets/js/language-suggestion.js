(() => {
  const storageKey = 'site-language-chosen';
  const navigation = document.getElementById('language-navigation');
  const suggestion = document.getElementById('language-suggestion');

  function rememberChoice(language) {
    try { localStorage.setItem(storageKey, language); } catch { /* Storage may be disabled. */ }
    suggestion.hidden = true;
  }

  navigation.addEventListener('click', event => {
    const link = event.target.closest('a[hreflang]');
    if (link) rememberChoice(link.hreflang);
  });

  if (document.documentElement.lang !== 'sv') return;

  let savedLanguage;
  try {
    savedLanguage = localStorage.getItem(storageKey);
  } catch { /* The suggestion still works for this visit. */ }

  if (savedLanguage === 'en') {
    const englishURL = new URL(navigation.querySelector('[hreflang="en"]').href);
    englishURL.search = location.search;
    englishURL.hash = location.hash;
    location.replace(englishURL.href);
    return;
  }
  // Earlier versions stored '1' for both languages and dismissals.
  if (savedLanguage === 'sv' || savedLanguage === '1') return;

  const preferences = navigator.languages?.length ? navigator.languages : [navigator.language];
  const languages = preferences.filter(Boolean).map(locale => locale.toLowerCase().split('-')[0]);
  const preferred = languages.find(language => language === 'sv' || language === 'en');
  if (!languages.length || preferred === 'sv') return;

  suggestion.querySelector('a').addEventListener('click', () => rememberChoice('en'));
  suggestion.querySelector('button').addEventListener('click', () => {
    rememberChoice('sv');
    navigation.querySelector('[hreflang="sv"]').focus();
  });
  suggestion.hidden = false;
})();
