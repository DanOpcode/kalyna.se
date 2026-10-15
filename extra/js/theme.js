(() => {
  const media = window.matchMedia('(prefers-color-scheme: dark)');
  let saved;
  try { saved = localStorage.getItem('theme'); } catch { /* Storage may be disabled. */ }
  window.themePreference = ['dark', 'light'].includes(saved) ? saved : 'system';
  const apply = () => {
    const dark = window.themePreference === 'dark' ||
      (window.themePreference === 'system' && media.matches);
    document.documentElement.classList.toggle('dark', dark);
    document.documentElement.style.colorScheme = dark ? 'dark' : 'light';
  };
  window.setTheme = (preference) => {
    window.themePreference = ['dark', 'light'].includes(preference) ? preference : 'system';
    try {
      if (window.themePreference === 'system') localStorage.removeItem('theme');
      else localStorage.setItem('theme', window.themePreference);
    } catch { /* Theme selection still works when storage is unavailable. */ }
    apply();
  };
  media.addEventListener('change', apply);
  apply();
})();
