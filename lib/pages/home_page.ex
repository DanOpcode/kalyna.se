defmodule Kalyna.HomePage do
  use Tableau.Page,
    layout: Kalyna.RootLayout,
    permalink: "/",
    lang: "sv"

  use Phoenix.Component

  import Kalyna.Translations, only: [t: 2]

  def template(assigns) do
    assigns = Map.put(assigns, :lang, Map.get(assigns.page, :lang, "sv"))

    ~H"""
    <div class="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 dark:from-slate-900 dark:to-slate-800">
      <nav
        aria-label="Language / Språk"
        class="flex justify-center gap-4 px-4 pt-6 text-slate-900 dark:text-white"
      >
        <a
          href="/"
          lang="sv"
          hreflang="sv"
          aria-current={if @lang == "sv", do: "page"}
          class="underline"
        >
          🇸🇪 Svenska
        </a>
        <a
          href="/en/"
          lang="en"
          hreflang="en"
          aria-current={if @lang == "en", do: "page"}
          class="underline"
        >
          🇬🇧 English
        </a>
      </nav>
      <!-- Theme preference -->
      <div class="flex justify-center mt-4">
        <label class="bg-white dark:bg-slate-800 text-slate-900 dark:text-white border border-slate-300 rounded-lg p-3 shadow-lg flex items-center gap-2">
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
      <section class="px-6 py-20 max-w-4xl mx-auto text-center">
        <div class="flex items-center justify-center mb-8">
          <img
            src="/images/logo.png"
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

      <!-- About Section -->
      <section id="about" class="px-6 py-16">
        <div class="max-w-4xl mx-auto">
          <div class="grid md:grid-cols-3 gap-12 items-center">
            <div class="md:col-span-1 text-center">
              <img
                src="/images/profile1.jpg"
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

      <!-- Technologies Section -->
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

      <!-- Professional Experience Section -->
      <section class="px-6 py-16">
        <div class="max-w-7xl mx-auto">
          <h2 class="text-4xl font-bold text-slate-900 dark:text-white mb-8 text-center">
            {t(@lang, "Professionell erfarenhet")}
          </h2>
          <p class="text-slate-600 dark:text-slate-200 text-center mb-12 max-w-2xl mx-auto">
            {t(@lang, "Företag jag arbetat med.")}
          </p>
          <div class="grid lg:grid-cols-2 xl:grid-cols-3 gap-6">
            <!-- Company 1 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_carmenta.svg"
                    alt={t(@lang, "Carmenta logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  <a href="https://carmenta.com/" class="underline">Carmenta</a>
                </h3>
                <p class="text-slate-600 dark:text-slate-200">{t(@lang, "DevOps • 2026–pågående")}</p>
              </div>
              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-1')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>
              <!-- Expandable Content -->
              <div
                id="content-company-1"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(@lang, "Jag arbetar med DevOps hos Carmenta.")}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(@lang, "Jag bidrar med erfarenhet inom mjukvaruutveckling och DevOps.")}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h4>
                      <div class="flex flex-wrap gap-2">
                        <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs">
                          .NET
                        </span>
                        <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs">
                          C#
                        </span>
                        <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs">
                          Docker
                        </span>
                        <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs">
                          Linux
                        </span>
                        <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs">
                          Windows
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Company 2 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg flex items-center justify-center">
                  <img
                    src="/images/company_logo_imy.png"
                    alt={t(@lang, "IMY logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  {t(@lang, "Integritetsskyddsmyndigheten")}
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "DevOps • Konsultuppdrag • 2024–2026")}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-2')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-2"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Utvecklare hos Integritetsskyddsmyndigheten (IMY), där jag arbetade med DevOps-pipelines, applikationsinfrastruktur och releasehantering. I ett tvärfunktionellt team byggde vi diverse applikationer tillsammans."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Jag driver förbättringar i våra utvecklingsprocesser genom att optimera Azure DevOps-arbetsflöden och bidra med viktiga tekniska beslut. Min roll innefattar även programmering i C# och .NET, deltagande i kodgranskningar och dialog med folk ur verksamheten."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h4>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C#",
                              ".NET",
                              "Blazor",
                              "Azure DevOps",
                              "ASP.NET Core",
                              "Entity Framework",
                              "SQL Server",
                              "SQL Server Management Studio (SSMS)",
                              "REST API:er",
                              "Git",
                              "agila metoder (Scrum)",
                              "Visual Studio",
                              "Windows 10"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Company 3 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_reit.svg"
                    alt={t(@lang, "Re:it logga")}
                    class="max-w-full max-h-full object-contain brightness-0"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">Re:it</h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Lead-utvecklare • Konsultuppdrag • 2023–pågående")}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-3')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-3"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Senior utvecklare i ett tvärfunktionellt team med 6 st kollegor, varav 2 st är programmerare. Tillsammans utvecklar vi ett webbaserat ärendehanteringssystem där både externa användare och handläggare kan logga in."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Jag bidrar till projektet genom att arbeta nära koden, vara med i de beslut som tas gällande implementationen, och stötta mina programmerarkollegor. Jag deltar även tillsammans med teamets arkitekt i möten med andra parter gällande integration med de andra parternas system."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h4>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C#",
                              ".NET",
                              "ASP.NET",
                              "Blazor",
                              "Azure",
                              "Azure DevOps",
                              "Entity Framework",
                              "BankID",
                              "JWT",
                              "SQL Server",
                              "SQL Server Management Studio (SSMS)",
                              "HTTP",
                              "REST API",
                              "Git",
                              "Windows 11",
                              "Visual Studio",
                              "agila metoder (Scrum)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Company 4 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_altero.png"
                    alt={t(@lang, "Altero Consulting logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Altero Consulting
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Systemutvecklare • Konsultuppdrag • 2022–2025")}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-4')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-4"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(@lang, "Utveckla en lösning som sammanställer data till ett datalager.")}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Jag arbetade tillsammans med en projektledare i ett projekt där vi tog fram en lösning som automatiskt sammanställer data från databastabeller och Excel-filer till ett datalager. Detta resulterade i att kunden bland annat kan dra större affärsnytta från sin data. Jag jobbade självständigt med mycket kontakt med slutanvändarna för att ta emot feedback och iterativt implementera förbättringar."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h4>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "SQL",
                              "SQL Server",
                              "SQL Server Management Studio (SSMS)",
                              "SQL Server Integration Services (SSIS)",
                              "C#",
                              ".NET Framework",
                              "Python",
                              "HTTP",
                              "REST API",
                              "Git",
                              "Windows 10",
                              "Windows 11",
                              "Windows Server",
                              "Visual Studio",
                              "Visma",
                              "agila metoder (Kanban)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Company 5 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_idagree.jpg"
                    alt={t(@lang, "IdAgree logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">IdAgree</h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Systemutvecklare • Medgrundare • 2024–2024")}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-5')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-5"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Som medgrundare i ett startup-företag, utvecklade jag en prototyp av en tjänst för att skapa kvitton för secondhand-köp."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Jag byggde en webbtjänst från grunden och satte upp både produktionsmiljön och kontinuerlig driftsättning dit. Jag arbetade tillsammans med företagets andra grundare, implementerade funktioner enligt deras önskemål och feedback, samt utvecklade en integration med en tredjepartstjänst för att signera PDF-filer."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h4>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C#",
                              ".NET",
                              "ASP.NET",
                              "Blazor",
                              "Azure",
                              "Azure App Service",
                              "Azure SQL Database",
                              "Entity Framework",
                              "SQL Server",
                              "SQL Server Management Studio (SSMS)",
                              "HTML",
                              "CSS",
                              "HTTP",
                              "REST API",
                              "Git",
                              "GitHub",
                              "GitHub Actions",
                              "Rider"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Company 6 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_carnegie.png"
                    alt={t(@lang, "Carnegie Investment Bank logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Carnegie Investment Bank
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Systemutvecklare, scrum-master • Anställd • 2021–2022")}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-6')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-6"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Vidareutveckling av integration mellan back office- och börshandelssystem, samt av system som används internt av mäklare för hantering av kunders värdepappersportföljer, i ett team med totalt 4-5 st utvecklare."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel var både systemutvecklare och scrum master, och representerade teamet i Scrum of Scrums- och arkitekturmöten. Han hjälpte till med att leverera teamets system under ett back office-systembyte på ett lyckat sätt. Daniel vidareutvecklade därefter teamets applikationer och mikrotjänster. Förutom nya funktioner, migrerade han teamets kodbaser från .NET Core 3.1 till .NET 6, och införde körning av enhetstester och automatisk uppdatering av databaserna i CI/CD-pipeline:n. Han hjälpte ofta till med kodgranskning, skriva release notes och deploya nya versioner av mikrotjänsterna. Han löste också ofta akuta problem som användarna stötte på. Både Daniels teamledare och chef uppskattade hur han alltid tog för sig bland arbetsuppgifterna och gärna var inne i alla delar."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h4>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C#",
                              ".NET",
                              "ASP.NET",
                              "Entity Framework",
                              "SQL",
                              "SQL Server",
                              "SQL Server Management Studio (SSMS)",
                              "WPF",
                              "Telerik UI for WPF",
                              "xUnit.net",
                              "Azure DevOps",
                              "HTML",
                              "CSS",
                              "JavaScript",
                              "Bootstrap",
                              "Python",
                              "RabbitMQ",
                              "JSON",
                              "HTTP",
                              "REST API",
                              "gRPC",
                              "FIX",
                              "QuickFIX",
                              "Git",
                              "Windows 10",
                              "Windows Server",
                              "Visual Studio",
                              "mikrotjänster",
                              "agila metoder (SAFe)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Company 7 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_cellink.png"
                    alt={t(@lang, "Cellink logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">Cellink</h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Teamledare, systemutvecklare • Konsultuppdrag • 2019–2021")}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-7')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-7"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                      {t(@lang, "Teamledare")}
                    </h4>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Teamledare för 6 st kollegor som arbetade med utveckling i WPF, AWS och Flutter. Daniels team utvecklade det grafiska gränssnittet till deras då kommande produkt CELLCYTE X, som är ett mikroskop som forskare kan schemalägga till att ta foton av cellprover."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "I rollen arbetade Daniel tillsammans med produktägaren med att bryta ner förfrågningar på nya funktioner till tekniska krav. Han gjorde grövre tidsestimat, förberedde arbete genom att designa grafiska gränssnitt och undanröjde hinder för teamet. Han stöttade sina kollegor, planerade och delade ut arbetsuppgifter, samt testade och kodgranskade vad de gjort. Daniel ansvarade för nya releaser av mjukvaran. Han samarbetade med teamledaren för embedded-systemet och de designade tillsammans API:er för systemen. Daniel reproducerade och lokaliserade även buggar från testarna. Han gjorde också viss utveckling själv. Vidare så hade han kontakt med säljare och installatörer för att ge teknisk support och ta emot feedback."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h5>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C#",
                              ".NET Framework",
                              "WPF",
                              "Prism",
                              "MSTest",
                              "MQTT",
                              "JSON",
                              "HTTP",
                              "REST API",
                              "Azure DevOps",
                              "Jira",
                              "Confluence",
                              "Python",
                              "AWS",
                              "Balsamiq",
                              "Figma",
                              "Git",
                              "Windows 10",
                              "Visual Studio",
                              "agila metoder (Scrum)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>

                    <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                      {t(@lang, "Systemutvecklare .NET")}
                    </h4>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Från grunden bygga en Windows-applikation, i ett team med 2-7 st utvecklare, för deras då kommande produkt CELLCYTE X, som är ett mikroskop som forskare kan schemalägga till att ta foton av cellprover."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel byggde tillsammans med sina kollegor från grunden en Windows-baserad WPF-applikation. Som insatt i hur mikroskopets inbyggda system fungerade, så kunde han onboarda kollegor in i teamet och bidra till integrationen. I.o.m. att teamet varierade mycket i storlek så var Daniel en viktig person för projektet. Daniel tog även mycket ansvar för releaser av mjukvaran. Han arbetade också med att implementera automatiska tester i form av enhets- och GUI-tester."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h5>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C#",
                              ".NET Framework",
                              "WPF",
                              "Prism",
                              "MSTest",
                              "Microsoft UI Automation",
                              "MQTT",
                              "JSON",
                              "HTTP",
                              "REST API",
                              "Azure DevOps",
                              "Jira",
                              "Git",
                              "Windows 10",
                              "Visual Studio",
                              "agila metoder (Kanban)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>

                    <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                      {t(@lang, "Systemutvecklare C++")}
                    </h4>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Vidareutveckla tillsammans med 2 st kollegor ett inbyggt (embedded) system i deras då kommande produkt CELLCYTE X, som är ett mikroskop som forskare kan schemalägga till att ta foton av cellprover."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel arbetade med det inbyggda systemet som körde Linux (ARM) och var byggt med Yocto. Han vidareutvecklade en C++17-applikation där den mesta av logiken fanns. Bland annat implementerade han persistering av experimentdata i en SQLite-databas med stöd för automatiska uppdateringar av databasschemat. Daniel arbetade även med funktionalitet som var implementerad i Python-skript. Samt arbetade han med kalibrering av hårdvaran och gjorde ändringar i dess 3D-skrivarmjukvara som var skriven i C och baserad på Marlin Firmware. I teamet arbetade de testdrivet med krav på hög nivå av kodtäckning av enhetstester."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h5>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C++17",
                              "GCC",
                              "Google Test (gtest)",
                              "Yocto",
                              "Linux",
                              "CMake",
                              "Jenkins",
                              "MQTT",
                              "JSON",
                              "HTTP",
                              "REST API",
                              "SQL",
                              "SQLite",
                              "Python",
                              "C",
                              "Marlin Firmware",
                              "Jira",
                              "Git",
                              "Visual Studio Code",
                              "agila metoder (Kanban)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Company 8 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_avarn.png"
                    alt={t(@lang, "AVARN Security logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Avarn Security
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Väktare • Behovsanställd • 2020–2021")}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-8')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-8"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <p class="text-slate-600 dark:text-slate-200 text-sm">
                    {t(
                      @lang,
                      "Behovsanställd som väktare. Planerarna på Avarn kunde ringa och erbjuda mig pass när de var i behov av personal, vilket innebar att mina uppgifter kunde skilja sig från ett pass till ett annat. Som exempel så har jag jobbat natt utanför ambulansinfarten till akuten på ett sjukhus, jobbat natt på ett utomhusbad och på en byggarbetsplats, jobbat kvällspass i shoppingcentrum, och vaktat utanför ett förvar under dagtid."
                    )}
                  </p>
                </div>
              </div>
            </div>

            <!-- Company 9 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_labgruppen.png"
                    alt={t(@lang, "Lab Gruppen logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Lab Gruppen
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Systemutvecklare • Konsultuppdrag • 2020–2020")}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-9')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-9"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel och 2 st kollegor hjälpte kunden med att porta en mjukvarulösning för ett inbyggt system utvecklad i C och assembler till att fungera på en annan hårdvaruplattform med en annan DSP (signalprocessor)."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel utvecklade möjligheten att kunna föra över konfigurationsdata från Linux (ARM-processorkärna) till DSP:ns processorkärna, vilket gjorde det möjligt att styra saker som ljudvolym och equalizer-inställningar."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h4>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C",
                              "Linux",
                              "realtidsoperativsystem",
                              "Jira",
                              "Eclipse",
                              "agila metoder (Kanban)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Company 10 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_mentice.svg"
                    alt={t(@lang, "Mentice logga")}
                    class="w-full h-full object-contain"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Mentice
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Lead-utvecklare • Konsultuppdrag • 2017–2019")}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-10')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-10"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                      {t(@lang, "iOS-app")}
                    </h4>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Utveckla en iPad-app för demonstration av kliniska instrument för endovaskulär kirurgi. Till en början var Daniel ensam iOS-utvecklare i projektet, och i 2 st uppföljningsprojekt var han lead-utvecklare för 2 st kollegor."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel implementerade en simulering av en operation med 3D-modeller av kirurgiska instrument. Han integrerade även stöd för att använda ett fysiskt instrument till att genomföra utvalda moment under operationen, där instrumentet kommunicerade med iPaden via Bluetooth (BLE). Projektet mottogs väl av kunden och ledde till 2 st uppföljningsprojekt, i vilka Daniel var lead-utvecklare tillsammans med 2 st kollegor."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h5>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "Swift",
                              "UIKit",
                              "SceneKit",
                              "OpenGL",
                              "BLE",
                              "Blender",
                              "GIMP",
                              "SolidWorks",
                              "Python",
                              "Jira",
                              "Git",
                              "Xcode",
                              "agila metoder (Kanban)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                    <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                      {t(@lang, "Webb-app")}
                    </h4>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel var lead-utvecklare i ett team tillsammans med 2 st utvecklare, där han planerade och tillsammans med dem implementerade en ny version av en webbapplikation där läkare kunde starta övningar i en kirurgisimulator och se resultat från tidigare övningstillfällen. I den nya versionen implementerade de stöd för mer avancerad metrikinsamling, jämförelse av resultaten mot benchmarks, flerspråksstöd, samt möjligheten att kunna konfigurera simulatorövningarna."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel deltog i hela kedjan, från krav till implementation. I början av projektet formulerade Daniel arbetspaket och tidsestimat, ritade GUI-mockups och gjorde ER-diagram över den nya databasmodellen. Kunden var nöjd med planen, och därefter utförde Daniel också en stor del av implementationen tillsammans med sina 2 st kollegor. Han jobbade med både backend och frontend, och hade regelbundet möten med kunden för att ta emot feedback. Kunden var i slutet av projektet väldigt nöjd med resultatet."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h5>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "Python",
                              "Django",
                              "SQLite",
                              "HTML",
                              "CSS",
                              "JavaScript",
                              "jQuery",
                              "jQuery UI",
                              "JSON",
                              "Java",
                              "Balsamiq",
                              "Windows 10",
                              "Visual Studio Code",
                              "agila metoder (Kanban)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Company 11 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_consilium.svg"
                    alt={t(@lang, "Consilium Marine & Safety logga")}
                    class="w-full h-full object-contain"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Consilium Marine & Safety
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(
                    @lang,
                    "Teamledare, lead-utvecklare, systemutvecklare • Konsultuppdrag • 2016–2020"
                  )}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-11')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-11"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                      {t(@lang, "Windows-baserat konfigurationsprogram")}
                    </h4>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Teamledare för 2 st kollegor i ett projekt där Daniel planerade och utförde en omskrivning av ett konfigurationsprogram som användes till att konfigurera övervakningssystem som upptäcker gasläckage ombord på fraktfartyg."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel deltog i hela kedjan, från krav till implementation. Daniel utförde en förstudie innefattande formuleringar av arbetspaket, tidsestimat och GUI-mockups. Daniel var därefter ansvarig för arkitekturen av mjukvaran, kommunikation med kunden och mycket av implementationen. Daniel fördelade ut arbetsuppgifter till sina kollegor, och testade och kodgranskade vad de utvecklat. Övervakningssystemet hade sin egen parser i C++ för att packa och läsa konfigurationsdata, som Daniel integrerade i C#/WPF-applikationen. Vidare så arbetade Daniel testdrivet med hjälp av automatiska tester i form av enhets- och GUI-tester. Slutligen stod Daniel även för överlämningen när Consilium tog över underhållet av applikationen."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h5>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C#",
                              ".NET Framework",
                              "WPF",
                              "AvalonEdit",
                              "NUnit",
                              "Microsoft UI Automation",
                              "C++",
                              "MSVC",
                              "API",
                              "Balsamiq",
                              "Jira",
                              "Git",
                              "Windows 10",
                              "Visual Studio",
                              "agila metoder (Kanban)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                    <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                      {t(@lang, "Windows-baserat brandlarmshanteringssystem")}
                    </h4>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Ensamt ansvarig för underhåll och vidareutveckling av en stor Windows-applikation hos Consilium som kördes på bryggan på fartyg. Applikationen visualiserade alla branddetektorer ombord på fartygets däck och deras statusar."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel implementerade ny funktionalitet, förbättrade användargränssnittet och prestandan, löste buggar och bidrog med teknisk support. Applikationens gränssnitt var byggd med C# och WPF, medan lagret som kommunicerade med brandsystemen var byggd med C++. Daniel vidareutvecklade också en simulator som användes till att spela upp och simulera trafik från ett brandsystem, vilket var användbart vid testning och demonstration av applikationen. Kunden uppskattade stort Daniels hjälp vid behov även på kvällar och helger. Applikationen hade en gammal föregångare (byggd i C++ med MFC och Visual C++ 6) som fortfarande användes på en del fartyg som Daniel också hjälpte till att buggfixa vid behov."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h5>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C#",
                              ".NET Framework",
                              "WPF",
                              "WCF",
                              "Entity Framework",
                              "C++14",
                              "MSVC",
                              "Modbus",
                              "MFC",
                              "SQL Server",
                              "SQL Server Management Studio (SSMS)",
                              "AutoCAD",
                              "Jira",
                              "Git",
                              "VirtualBox",
                              "Windows 7",
                              "Windows 10",
                              "Visual Studio",
                              "Visual C++ 6.0",
                              "agila metoder (Kanban)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                    <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                      {t(@lang, "Webbaserat produktlivscykelsystem")}
                    </h4>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Ensamt ansvarig för underhåll och vidareutveckling av Consiliums instans av Aras Innovator, som är ett PLM-system som används till deras produkter inom brand- och gassäkerhet. I PLM-systemet fanns produkternas komponenter, dokument, ändringshistorik och mjukvara dokumenterat."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h5>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Arbetet var på både frontend- och backend-nivå, och Daniel utvecklade nya funktioner relaterade till presentation av data, export av data och behörighetsnivåer. Daniel utförde också uppdateringar av Aras Innovator till nya versioner."
                        )}
                      </p>
                    </div>
                    <div>
                      <h5 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h5>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "C#",
                              ".NET Framework",
                              "Aras Innovator",
                              "HTML",
                              "CSS",
                              "JavaScript",
                              "HTTP",
                              "SQL Server",
                              "SQL Server Management Studio (SSMS)",
                              "Jira",
                              "Git",
                              "Windows 10",
                              "Windows Server",
                              "Visual Studio",
                              "agila metoder (Kanban)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Company 12 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_ericsson.svg"
                    alt={t(@lang, "Ericsson logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>

              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Ericsson
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Systemutvecklare • Anställd • 2015–2016")}
                </p>
              </div>

              <!-- Expand Button -->
              <button
                onclick="toggleCompany('company-12')"
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>{t(@lang, "Visa mer")}</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg
                    class="w-4 h-4 text-slate-500"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 9l-7 7-7-7"
                    >
                    </path>
                  </svg>
                </div>
              </button>

              <!-- Expandable Content -->
              <div
                id="content-company-12"
                class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
              >
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Uppdrag")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Ensamt ansvarig för att porta en avancerad Excel-arbetsbok med cirka 30 länkade arbetsblad till Python. Arbetsboken uppskattade belastningen på företagets servrar givet en mobiloperatörs trafiklast, vilket användes för att skapa underlag till offerter till dem."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Nytta")}
                      </h4>
                      <p class="text-slate-600 dark:text-slate-200 text-sm">
                        {t(
                          @lang,
                          "Daniel jobbade självständigt med portningsarbetet. Samtidigt implementerade han mer avancerad modellering som inte var möjlig att implementera i Excel. Han byggde även ett grafiskt webbaserat gränssnitt."
                        )}
                      </p>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
                        {t(@lang, "Tekniker")}
                      </h4>
                      <div class="flex flex-wrap gap-2">
                        <span
                          :for={
                            technology <- [
                              "Python",
                              "Pandas",
                              "Flask",
                              "Pywin32",
                              "Named pipe",
                              "SQLite",
                              "SQL",
                              "Excel",
                              "HTML",
                              "CSS",
                              "Bootstrap",
                              "JSON",
                              "Git",
                              "Windows 7",
                              "PyCharm",
                              "agila metoder (Kanban)"
                            ]
                          }
                          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
                        >
                          {t(@lang, technology)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <script>
          function toggleCompany(itemId) {
            const content = document.getElementById('content-' + itemId);
            if (!content) return;
            
            const card = content.closest('.company-item');
            const button = card.querySelector('button');
            const icon = button.querySelector('.expand-icon');
            const buttonText = button.querySelector('span');
            const isExpanded = content.style.maxHeight && content.style.maxHeight !== '0px';
            
            // Close all other expanded items
            document.querySelectorAll('.company-content').forEach(item => {
              if (item.id !== 'content-' + itemId) {
                item.style.maxHeight = '0px';
                const otherCard = item.closest('.company-item');
                const otherButton = otherCard.querySelector('button');
                const otherIcon = otherButton.querySelector('.expand-icon');
                const otherText = otherButton.querySelector('span');
                if (otherIcon) otherIcon.style.transform = 'rotate(0deg)';
                if (otherText) otherText.textContent = document.documentElement.lang === 'en' ? 'Show more' : 'Visa mer';
              }
            });
            
            // Toggle current item
            if (isExpanded) {
              content.style.maxHeight = '0px';
              if (icon) icon.style.transform = 'rotate(0deg)';
              if (buttonText) buttonText.textContent = document.documentElement.lang === 'en' ? 'Show more' : 'Visa mer';
            } else {
              content.style.maxHeight = content.scrollHeight + 'px';
              if (icon) icon.style.transform = 'rotate(180deg)';
              if (buttonText) buttonText.textContent = document.documentElement.lang === 'en' ? 'Show less' : 'Visa mindre';
            }
          }
        </script>
      </section>

      <!-- Testimonial Section -->
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

      <!-- Personal Section -->
      <section class="px-6 py-16">
        <div class="max-w-4xl mx-auto">
          <div class="grid md:grid-cols-3 gap-12 items-center">
            <div class="md:col-span-1 text-center">
              <img
                src="/images/profile2.jpg"
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

      <section class="px-6 py-16">
        <div class="max-w-4xl mx-auto rounded-lg p-10">
          <div class="grid md:grid-cols-3 gap-12 items-center">
            <div class="md:col-span-1 px-4 py-10 rounded-lg bg-[#d9d4fc] dark:bg-[#5e0228]">
              <img
                src="/images/kvadrat-logo.svg"
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

      <!-- Contact Section -->
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

      <!-- Content & Community Section -->
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

      <!-- About Kalyna Section -->
      <section class="px-6 py-16 bg-white dark:bg-slate-800">
        <div class="max-w-4xl mx-auto">
          <div class="grid md:grid-cols-3 gap-12 items-center">
            <div class="md:col-span-1 text-center">
              <img
                src="/images/kalyna.jpg"
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

      <!-- Company Information Section -->
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
    </div>

    <script>
      document.getElementById('theme-preference').value = window.themePreference;
    </script>
    """
  end
end
