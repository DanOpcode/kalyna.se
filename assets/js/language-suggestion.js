(() => {
  const storageKey = 'site-language-chosen';
  const navigation = document.getElementById('language-navigation');
  const suggestion = document.getElementById('language-suggestion');

  function rememberChoice() {
    try { localStorage.setItem(storageKey, '1'); } catch { /* Storage may be disabled. */ }
    suggestion.hidden = true;
  }

  navigation.addEventListener('click', event => {
    if (event.target.closest('a')) rememberChoice();
  });

  if (document.documentElement.lang !== 'sv') return;

  try {
    if (localStorage.getItem(storageKey)) return;
  } catch { /* The suggestion still works for this visit. */ }

  const preferences = navigator.languages?.length ? navigator.languages : [navigator.language];
  const languages = preferences.filter(Boolean).map(locale => locale.toLowerCase().split('-')[0]);
  const preferred = languages.find(language => language === 'sv' || language === 'en');
  if (!languages.length || preferred === 'sv') return;

  suggestion.querySelector('a').addEventListener('click', rememberChoice);
  suggestion.querySelector('button').addEventListener('click', () => {
    rememberChoice();
    navigation.querySelector('[hreflang="sv"]').focus();
  });
  suggestion.hidden = false;
})();
