defmodule Kalyna.PortfolioComponents do
  @moduledoc "Shared, language-aware components for the Swedish and English portfolio."
  use Phoenix.Component
  import Kalyna.Translations, only: [t: 2]
  import Kalyna.ExperienceComponents, only: [experience: 1]

  attr(:lang, :string, required: true)

  def portfolio(assigns) do
    ~H"""
    <div class="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 dark:from-slate-900 dark:to-slate-800">
      <div class="flex items-center justify-center gap-2 sm:gap-4 px-2 pt-6 text-xs sm:text-base">
        <nav
          aria-label="Language / Språk"
          class="h-12 flex items-center gap-2 sm:gap-4 px-2 sm:px-3 bg-white dark:bg-slate-800 text-slate-900 dark:text-white border border-slate-300 rounded-lg shadow-lg"
        >
          <a
            href="/"
            lang="sv"
            hreflang="sv"
            aria-current={if @lang == "sv", do: "page"}
            class="underline whitespace-nowrap"
          >
            🇸🇪 Svenska
          </a>
          <a
            href="/en/"
            lang="en"
            hreflang="en"
            aria-current={if @lang == "en", do: "page"}
            class="underline whitespace-nowrap"
          >
            🇬🇧 English
          </a>
        </nav>
        <!-- Theme preference -->
        <label class="h-12 bg-white dark:bg-slate-800 text-slate-900 dark:text-white border border-slate-300 rounded-lg px-2 sm:px-3 shadow-lg flex items-center gap-2">
          <span>{t(@lang, "Tema")}</span>
          <select
            id="theme-preference"
            aria-label={t(@lang, "Tema")}
            onchange="setTheme(this.value)"
            class="bg-white dark:bg-slate-800 rounded"
          >
            <option value="system">System</option>
            <option value="light">{t(@lang, "Ljust")}</option>
            <option value="dark">{t(@lang, "Mörkt")}</option>
          </select>
        </label>
      </div>

      <!-- Hero Section -->
      <.hero lang={@lang} />

      <!-- About Section -->
      <.about lang={@lang} />

      <!-- Technologies Section -->
      <.expertise lang={@lang} />

      <!-- Professional Experience Section -->
      <.experience lang={@lang} />

      <!-- Testimonial Section -->
      <.testimonial lang={@lang} />

      <!-- Personal Section -->
      <.personal lang={@lang} />

      <.network lang={@lang} />

      <!-- Contact Section -->
      <.contact lang={@lang} />

      <!-- Content & Community Section -->
      <.community lang={@lang} />

      <!-- About Kalyna Section -->
      <.about_kalyna lang={@lang} />

      <!-- Company Information Section -->
      <.company_information lang={@lang} />
    </div>

    <script>
      document.getElementById('theme-preference').value = window.themePreference;
    </script>
    """
  end

  attr(:lang, :string, required: true)

  def hero(assigns) do
    ~H"""
    <section class="px-6 py-20 max-w-4xl mx-auto text-center">
      <div class="flex items-center justify-center mb-8">
        <img
          src="/images/logo.webp"
          srcset="/images/logo.webp 64w, /images/logo-128.webp 128w, /images/logo-192.webp 192w"
          sizes="64px"
          width="64"
          height="58"
          alt={t(@lang, "Kalyna Solutions AB logga")}
          class="w-16 mr-4"
        />
        <h1 class="text-5xl font-bold text-slate-900 dark:text-white">
          Kalyna Solutions AB
        </h1>
      </div>
      <p class="text-xl text-slate-600 dark:text-slate-200 mb-8 max-w-2xl mx-auto leading-relaxed">
        {t(@lang, "Expertis inom mjukvaruutveckling och teknisk ledning.")}
      </p>
      <div class="flex flex-col sm:flex-row gap-4 justify-center">
        <a
          href="#contact"
          class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg transition-colors font-medium"
        >
          {t(@lang, "Kontakta mig")}
        </a>
        <a
          href="#about"
          class="border border-slate-300 dark:border-slate-600 text-slate-700 dark:text-slate-200 px-8 py-3 rounded-lg hover:bg-slate-50 dark:hover:bg-slate-800 transition-colors font-medium"
        >
          {t(@lang, "Läs mer")}
        </a>
      </div>
    </section>
    """
  end

  attr(:lang, :string, required: true)

  def about(assigns) do
    ~H"""
    <section id="about" class="px-6 py-16">
      <div class="max-w-4xl mx-auto">
        <div class="grid md:grid-cols-3 gap-12 items-center">
          <div class="md:col-span-1 text-center">
            <img
              src="/images/profile1.webp"
              fetchpriority="high"
              srcset="/images/profile1.webp 192w, /images/profile1-384.webp 384w, /images/profile1-576.webp 576w"
              sizes="192px"
              width="192"
              height="192"
              alt={t(@lang, "Profilbild")}
              class="w-48 h-48 rounded-full mx-auto object-cover shadow-lg"
            />
          </div>
          <div class="md:col-span-2">
            <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8 text-center md:text-left">
              {t(@lang, "Om Daniel Jonsson")}
            </h2>
            <div class="text-slate-600 dark:text-slate-200 space-y-6">
              <p>
                {t(
                  @lang,
                  "Jag är en systemutvecklare med 10+ års erfarenhet av mjukvaruutveckling professionellt inom flera programmeringsspråk. Framförallt har jag arbetat med C#/.NET, men har även gedigen erfarenhet av JavaScript, C++, Python, Swift, HTML och CSS. Jag började programmera som nioåring och har en civilingenjörsexamen i informationsteknik från Chalmers tekniska högskola. Plattformarna som jag har arbetat professionellt med är Windows, Linux, webben, iOS och inbyggda system."
                )}
              </p>
              <p>
                {t(
                  @lang,
                  "Jag har ett analytiskt sinne, är duktig på att lösa komplexa uppgifter och är snabbt produktiv i nya system. Jag är en människokännare, en bra lagspelare och duktig på att lyssna på mina kunder och kollegor."
                )}
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr(:lang, :string, required: true)

  def expertise(assigns) do
    ~H"""
    <section class="px-6 py-16">
      <div class="max-w-4xl mx-auto">
        <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8 text-center">
          {t(@lang, "Teknologier & expertis")}
        </h2>
        <div class="grid md:grid-cols-3 gap-8">
          <div class="text-center">
            <h3 class="text-xl font-semibold text-slate-900 dark:text-slate-100 mb-4">
              {t(@lang, "Roller")}
            </h3>
            <ul class="text-slate-600 dark:text-slate-200 space-y-2">
              <li>{t(@lang, "Teamledare")}</li>
              <li>{t(@lang, "Lead-utvecklare")}</li>
              <li>{t(@lang, "Systemutvecklare")}</li>
            </ul>
          </div>
          <div class="text-center">
            <h3 class="text-xl font-semibold text-slate-900 dark:text-slate-100 mb-4">
              {t(@lang, "Områden")}
            </h3>
            <ul class="text-slate-600 dark:text-slate-200 space-y-2">
              <li>Fullstack</li>
              <li>Backend</li>
              <li>DevOps</li>
            </ul>
          </div>
          <div class="text-center">
            <h3 class="text-xl font-semibold text-slate-900 dark:text-slate-100 mb-4">
              {t(@lang, "Plattformar")}
            </h3>
            <ul class="text-slate-600 dark:text-slate-200 space-y-2">
              <li>Linux</li>
              <li>Windows</li>
              <li>{t(@lang, "Webb")}</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr(:lang, :string, required: true)

  def testimonial(assigns) do
    ~H"""
    <section class="px-6 py-16">
      <div class="max-w-4xl mx-auto">
        <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-12 text-center">
          {t(@lang, "Vad en tidigare kollega säger")}
        </h2>
        <div class="bg-white dark:bg-slate-800 rounded-xl shadow-lg p-8 md:p-12 relative">
          <!-- Quote Icon -->
          <div class="absolute top-6 left-6 text-blue-200 dark:text-blue-200">
            <svg class="w-12 h-12" fill="currentColor" viewBox="0 0 24 24">
              <path d="M14.017 21v-7.391c0-5.704 3.731-9.57 8.983-10.609l.995 2.151c-2.432.917-3.995 3.638-3.995 5.849h4v10h-10zm-14.017 0v-7.391c0-5.704 3.748-9.57 9-10.609l.996 2.151c-2.433.917-3.996 3.638-3.996 5.849h4v10h-10z" />
            </svg>
          </div>

          <div class="pt-8">
            <blockquote class="text-xl md:text-2xl text-slate-700 dark:text-slate-200 leading-relaxed mb-8 italic">
              {t(
                @lang,
                "”Daniel var utvecklare i många projekt (konsult), varav vissa med mig. Han tog stort eget ansvar för planering, ledning och utförande, samt direktkontakt med kund. Han var allmänt (även av ledningen) ansedd som en schweizisk armékniv som kunde skickas in i vilket mjukvaruprojekt som helst och glänsa.”"
              )}
            </blockquote>
            <div class="font-semibold text-slate-900 dark:text-white text-lg">
              {t(@lang, "— Citat från tidigare kollega.")}
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr(:lang, :string, required: true)

  def personal(assigns) do
    ~H"""
    <section class="px-6 py-16">
      <div class="max-w-4xl mx-auto">
        <div class="grid md:grid-cols-3 gap-12 items-center">
          <div class="md:col-span-1 text-center">
            <img
              src="/images/profile2.webp"
              srcset="/images/profile2.webp 192w, /images/profile2-384.webp 384w, /images/profile2-576.webp 576w"
              sizes="192px"
              width="192"
              height="192"
              loading="lazy"
              alt={t(@lang, "Profilbild")}
              class="w-48 h-48 rounded-full mx-auto object-cover shadow-lg mb-6"
            />
          </div>
          <div class="md:col-span-2">
            <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8 text-center md:text-left">
              {t(@lang, "Utanför jobbet")}
            </h2>
            <p class="mb-6 text-slate-600 dark:text-slate-200">
              {t(
                @lang,
                "När jag inte kodar är jag en familjefar, gift med min underbara fru och stolt pappa till vår dotter. Varje år reser vi till Ukraina, även under kriget, för att besöka min frus familj."
              )}
            </p>
            <div class="grid md:grid-cols-2 gap-6 mt-8">
              <div>
                <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                  {t(@lang, "Personliga intressen")}
                </h4>
                <ul class="space-y-2">
                  <li class="flex items-center text-slate-600 dark:text-slate-200">
                    <span class="w-2 h-2 bg-blue-600 rounded-full mr-3"></span>{t(
                      @lang,
                      "Sparande och finans"
                    )}
                  </li>
                  <li class="flex items-center text-slate-600 dark:text-slate-200">
                    <span class="w-2 h-2 bg-green-600 rounded-full mr-3"></span>{t(
                      @lang,
                      "Self-hosting, Linux och öppen källkod"
                    )}
                  </li>
                  <li class="flex items-center text-slate-600 dark:text-slate-200">
                    <span class="w-2 h-2 bg-purple-600 rounded-full mr-3"></span>{t(
                      @lang,
                      "Funktionell programmering (Elixir)"
                    )}
                  </li>
                  <li class="flex items-center text-slate-600 dark:text-slate-200">
                    <span class="w-2 h-2 bg-orange-600 rounded-full mr-3"></span>{t(
                      @lang,
                      "Träning och hälsa"
                    )}
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr(:lang, :string, required: true)

  def network(assigns) do
    ~H"""
    <section class="px-6 py-16">
      <div class="max-w-4xl mx-auto rounded-lg p-10">
        <div class="grid md:grid-cols-3 gap-12 items-center">
          <div class="md:col-span-1 px-4 py-10 rounded-lg bg-[#d9d4fc] dark:bg-[#5e0228]">
            <img
              src="/images/kvadrat-logo.svg"
              width="838"
              height="158"
              loading="lazy"
              alt={t(@lang, "Kvadrat logga")}
              class="max-w-full max-h-full object-contain dark:brightness-0 dark:invert"
            />
          </div>
          <div class="md:col-span-2">
            <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8 text-center md:text-left">
              {t(@lang, "Del av Kvadrat")}
            </h2>
            <p class="text-slate-600 dark:text-slate-200 mb-4">
              {t(
                @lang,
                "Medlem i Kvadrat – Sveriges största nätverk av egenföretagare som hjälper företag och organisationer till förändring, med spetskonsulter inom systemutveckling, digitalisering, informationshantering, ledning, organisations- och verksamhetsutveckling."
              )}
            </p>
            <a
              href="https://www.kvadrat.se/anlita-kvadrat/hitta-konsult/daniel-jonsson/"
              target="_blank"
              class="bg-white dark:bg-slate-700 border border-slate-300 dark:border-slate-600 text-slate-700 dark:text-slate-200 px-6 py-3 rounded-lg hover:bg-slate-50 dark:hover:bg-slate-800 transition-colors font-medium inline-block"
            >
              {t(@lang, "Se min profil")}
            </a>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr(:lang, :string, required: true)

  def contact(assigns) do
    ~H"""
    <section id="contact" class="px-6 py-16 bg-white dark:bg-slate-800">
      <div class="max-w-4xl mx-auto text-center">
        <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8">
          {t(@lang, "Kontakta mig")}
        </h2>
        <p class="text-xl text-slate-600 dark:text-slate-200 mb-8 max-w-2xl mx-auto">
          {t(
            @lang,
            "Har du några behov, tankar eller idéer? Du får gärna kontakta mig oavsett anledning."
          )}
        </p>
        <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-6 max-w-4xl mx-auto">
          <!-- Email -->
          <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
            <div class="w-12 h-12 mx-auto mb-4 bg-blue-100 rounded-full flex items-center justify-center">
              <svg
                class="w-6 h-6 text-blue-600"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                >
                </path>
              </svg>
            </div>
            <h3 class="font-semibold text-slate-900 dark:text-white mb-2">{t(@lang, "E-post")}</h3>
            <a
              href="mailto:daniel@kalyna.se"
              class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors break-all"
            >
              daniel@kalyna.se
            </a>
          </div>

          <!-- Phone -->
          <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
            <div class="w-12 h-12 mx-auto mb-4 bg-green-100 rounded-full flex items-center justify-center">
              <svg
                class="w-6 h-6 text-green-600"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"
                >
                </path>
              </svg>
            </div>
            <h3 class="font-semibold text-slate-900 dark:text-white mb-2">{t(@lang, "Telefon")}</h3>
            <a
              href="tel:+46707329868"
              class="text-green-600 dark:text-green-300 hover:text-green-700 dark:hover:text-blue-400 transition-colors"
            >
              +46 70 732 98 68
            </a>
          </div>

          <!-- Mastodon -->
          <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
            <div class="w-12 h-12 mx-auto mb-4 bg-blue-100 rounded-full flex items-center justify-center">
              <svg
                class="w-6 h-6 text-blue-600"
                fill="currentColor"
                viewBox="0 0 24 24"
                aria-hidden="true"
              >
                <path d="M23.268 5.313c-.35-2.578-2.617-4.61-5.304-5.004C17.51.242 15.792 0 11.813 0h-.03c-3.98 0-4.835.242-5.288.309C3.882.692 1.496 2.518.917 5.127.64 6.412.61 7.837.661 9.143c.074 1.874.088 3.745.26 5.611.118 1.24.325 2.47.62 3.68.55 2.237 2.777 4.098 4.96 4.857 2.336.792 4.849.923 7.256.38.265-.061.527-.132.786-.213.585-.184 1.27-.39 1.774-.753a.057.057 0 0 0 .023-.043v-1.809a.052.052 0 0 0-.02-.041.053.053 0 0 0-.046-.01 20.282 20.282 0 0 1-4.709.545c-2.73 0-3.463-1.284-3.674-1.818a5.593 5.593 0 0 1-.319-1.433.053.053 0 0 1 .066-.054c1.517.363 3.072.546 4.632.546.376 0 .75 0 1.125-.01 1.57-.044 3.224-.124 4.768-.422.038-.008.077-.015.11-.024 2.435-.464 4.753-1.92 4.989-5.604.008-.145.03-1.52.03-1.67.002-.512.167-3.63-.024-5.545zm-3.748 9.195h-2.561V8.29c0-1.309-.55-1.976-1.67-1.976-1.23 0-1.846.79-1.846 2.35v3.403h-2.546V8.663c0-1.56-.617-2.35-1.848-2.35-1.112 0-1.668.668-1.67 1.977v6.218H4.822V8.102c0-1.31.337-2.35 1.011-3.12.696-.77 1.608-1.164 2.74-1.164 1.311 0 2.302.5 2.962 1.498l.638 1.06.638-1.06c.66-.999 1.65-1.498 2.96-1.498 1.13 0 2.043.395 2.74 1.164.675.77 1.012 1.81 1.012 3.12z" />
              </svg>
            </div>
            <h3 class="font-semibold text-slate-900 dark:text-white mb-2">Mastodon</h3>
            <a
              href="https://mastodon.social/@DanOpcode"
              rel="me"
              class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors"
            >
              {t(@lang, "Följ mig på Mastodon")}
            </a>
          </div>
          <!-- LinkedIn -->
          <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
            <div class="w-12 h-12 mx-auto mb-4 bg-blue-100 rounded-full flex items-center justify-center">
              <svg
                class="w-6 h-6 text-blue-600"
                fill="#0072b1"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
              </svg>
            </div>
            <h3 class="font-semibold text-slate-900 dark:text-white mb-2">LinkedIn</h3>
            <a
              href="https://linkedin.com/in/DanOpcode"
              target="_blank"
              class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors"
            >
              {t(@lang, "Se profil")}
            </a>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr(:lang, :string, required: true)

  def community(assigns) do
    ~H"""
    <section class="px-6 py-16">
      <div class="max-w-7xl mx-auto">
        <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-12 text-center">
          {t(@lang, "Innehåll & community")}
        </h2>
        <div class="grid md:grid-cols-2 gap-8">
          <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
            <div class="w-16 h-16 mx-auto mb-4 bg-blue-100 rounded-lg flex items-center justify-center">
              <svg class="w-8 h-8 text-blue-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-5 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-3">
              {t(@lang, "Blogg")}
            </h3>
            <p class="text-slate-600 dark:text-slate-200 mb-4">
              {t(@lang, "Personliga tankar om livet och teknik i textformat.")}
            </p>
            <a
              href="https://www.danopcode.com/"
              class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors font-medium inline-block"
            >
              {t(@lang, "Läs artiklar")}
            </a>
          </div>

          <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
            <div class="w-16 h-16 mx-auto mb-4 bg-red-100 rounded-lg flex items-center justify-center">
              <svg class="w-8 h-8 text-red-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-3">YouTube</h3>
            <p class="text-slate-600 dark:text-slate-200 mb-4">
              {t(@lang, "Personliga tankar om livet och teknik i videoformat.")}
            </p>
            <a
              href="https://www.youtube.com/@DanOpcode"
              target="_blank"
              class="bg-red-600 text-white px-6 py-3 rounded-lg hover:bg-red-700 transition-colors font-medium inline-block"
            >
              {t(@lang, "Titta på videos")}
            </a>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr(:lang, :string, required: true)

  def about_kalyna(assigns) do
    ~H"""
    <section class="px-6 py-16 bg-white dark:bg-slate-800">
      <div class="max-w-4xl mx-auto">
        <div class="grid md:grid-cols-3 gap-12 items-center">
          <div class="md:col-span-1 text-center">
            <img
              src="/images/kalyna.jpg"
              width="248"
              height="248"
              loading="lazy"
              alt="Kalyna (viburnum) flower"
              class="w-48 h-48 lg:w-62 lg:h-62 rounded-full mx-auto object-cover shadow-lg border-4 border-white/20 dark:border-white/30"
            />
          </div>
          <div class="md:col-span-2">
            <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8 text-center md:text-left">
              {t(@lang, "Om Kalyna")}
            </h2>
            <p class="text-slate-600 dark:text-slate-200 leading-relaxed text-lg mb-4">
              {t(
                @lang,
                "“Kalyna“ är det ukrainska ordet “Калина“ skrivet med latinska bokstäver. Калина är en växt som på svenska översätts till"
              )}{" "}<a
                href="https://sv.wikipedia.org/wiki/Skogsolvon"
                title={t(@lang, "Wikipedia-artikel om skogsolvon.")}
                class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors"
              >{t(@lang, "skogsolvon")}</a>{t(
                @lang,
                ". Det är en anrik symbol för Ukraina med lång tradition, och dess bär symboliserar hemlandet. Skogsolvon dyker i Ukraina upp i sånger, konst, broderi och poesi. En numera välkänd sång är “"
              )}<a
                href="https://sv.wikipedia.org/wiki/Ett_r%C3%B6tt_olvon_vid_%C3%A4ngen"
                title={t(@lang, "Wikipedia-artikel om sången 'Ett rött olvon vid ängen'.")}
                class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors"
              >{t(@lang, "Ett rött olvon vid ängen")}</a>{t(
                @lang,
                "“ som skrevs 1914; “Ой у лузі червона калина“ är dess originaltitel och"
              )}{" "}<a
                href="https://www.youtube.com/watch?v=EV_vT0Vud5Q"
                title={t(@lang, "En grupp personer som sjunger sången 'Ой у лузі червона калина'.")}
                class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors"
              >{t(@lang, "sjungs fortfarande")}</a>.
            </p>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr(:lang, :string, required: true)

  def company_information(assigns) do
    ~H"""
    <section class="px-6 py-16 bg-slate-100 dark:bg-slate-900">
      <div class="max-w-4xl mx-auto">
        <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-12 text-center">
          {t(@lang, "Bolagsinformation")}
        </h2>
        <div class="max-w-2xl mx-auto">
          <div class="bg-white dark:bg-slate-800 p-8 rounded-lg shadow-lg">
            <div class="space-y-4 text-slate-600 dark:text-slate-200 mb-8">
              <div class="flex justify-between">
                <span class="font-medium">{t(@lang, "Juridiskt namn:")}</span>
                <span>Kalyna Solutions AB</span>
              </div>
              <div class="flex justify-between">
                <span class="font-medium">{t(@lang, "Organisationsnummer:")}</span>
                <span>559386-8457</span>
              </div>
              <div class="flex justify-between">
                <span class="font-medium">{t(@lang, "VAT-nummer:")}</span>
                <span>SE559386845701</span>
              </div>
              <div class="flex justify-between">
                <span class="font-medium">{t(@lang, "Plats:")}</span>
                <span>{t(@lang, "Stockholm, Sverige")}</span>
              </div>
              <div class="flex justify-between">
                <span class="font-medium">{t(@lang, "Skattestatus:")}</span>
                <span class="text-green-600 dark:text-green-400 font-medium">
                  {t(@lang, "Godkänd för F-skatt")}
                </span>
              </div>
            </div>

            <div class="pt-6 border-t border-slate-200 dark:border-slate-600">
              <h4 class="font-semibold text-slate-900 dark:text-white mb-4 text-center">
                {t(@lang, "Tillgänglighet")}
              </h4>
              <div class="space-y-3 text-slate-600 dark:text-slate-200">
                <div class="flex items-center justify-center">
                  <svg
                    class="w-5 h-5 text-blue-600 dark:text-blue-400 mr-3"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                    >
                    </path>
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                    >
                    </path>
                  </svg>
                  <span>{t(@lang, "Projekt på plats i Stockholmsområdet")}</span>
                </div>
                <div class="flex items-center justify-center">
                  <svg
                    class="w-5 h-5 text-green-600 dark:text-green-400 mr-3"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9v-9m0-9v9"
                    >
                    </path>
                  </svg>
                  <span>{t(@lang, "Remote-projekt")}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
