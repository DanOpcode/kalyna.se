defmodule Kalyna.ExperienceComponents do
  @moduledoc "Experience cards and assignment details shared by both portfolio languages."
  use Phoenix.Component
  import Kalyna.Translations, only: [t: 2]

  attr(:lang, :string, required: true)

  def experience(assigns) do
    ~H"""
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
          <.experience_card id="company-1" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_carmenta.svg"
                    width="512"
                    height="94"
                    loading="lazy"
                    alt={t(@lang, "Carmenta logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  <a href="https://carmenta.com/" class="underline">Carmenta</a>
                </h3>
                <p class="text-slate-600 dark:text-slate-200">{t(@lang, "DevOps • 2026–pågående")}</p>
              </div>
            </:heading>
            <div class="pt-4 border-t border-slate-200 mt-4">
              <div class="space-y-6">
                <.experience_detail lang={@lang} title="Uppdrag">
                  {t(@lang, "Jag arbetar med DevOps hos Carmenta.")}
                </.experience_detail>
                <.experience_detail lang={@lang} title="Nytta">
                  {t(@lang, "Jag bidrar med erfarenhet inom mjukvaruutveckling och DevOps.")}
                </.experience_detail>
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
          </.experience_card>
          <!-- Company 2 -->
          <.experience_card id="company-2" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_imy.svg"
                    width="1567"
                    height="284"
                    loading="lazy"
                    alt={t(@lang, "IMY logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  {t(@lang, "Integritetsskyddsmyndigheten")}
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "DevOps • Konsultuppdrag • 2024–2026")}
                </p>
              </div>
            </:heading>
            <div class="pt-4 border-t border-slate-200 mt-4">
              <div class="space-y-6">
                <.experience_detail lang={@lang} title="Uppdrag">
                  {t(
                    @lang,
                    "Utvecklare hos Integritetsskyddsmyndigheten (IMY), där jag arbetade med DevOps-pipelines, applikationsinfrastruktur och releasehantering. I ett tvärfunktionellt team byggde vi diverse applikationer tillsammans."
                  )}
                </.experience_detail>
                <.experience_detail lang={@lang} title="Nytta">
                  {t(
                    @lang,
                    "Jag driver förbättringar i våra utvecklingsprocesser genom att optimera Azure DevOps-arbetsflöden och bidra med viktiga tekniska beslut. Min roll innefattar även programmering i C# och .NET, deltagande i kodgranskningar och dialog med folk ur verksamheten."
                  )}
                </.experience_detail>
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
          </.experience_card>

          <!-- Company 3 -->
          <.experience_card id="company-3" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_reit.svg"
                    width="161"
                    height="59"
                    loading="lazy"
                    alt={t(@lang, "Re:it logga")}
                    class="max-w-full max-h-full object-contain brightness-0"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">Re:it</h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Lead-utvecklare • Konsultuppdrag • 2023–pågående")}
                </p>
              </div>
            </:heading>
            <div class="pt-4 border-t border-slate-200 mt-4">
              <div class="space-y-6">
                <.experience_detail lang={@lang} title="Uppdrag">
                  {t(
                    @lang,
                    "Senior utvecklare i ett tvärfunktionellt team med 6 st kollegor, varav 2 st är programmerare. Tillsammans utvecklar vi ett webbaserat ärendehanteringssystem där både externa användare och handläggare kan logga in."
                  )}
                </.experience_detail>
                <.experience_detail lang={@lang} title="Nytta">
                  {t(
                    @lang,
                    "Jag bidrar till projektet genom att arbeta nära koden, vara med i de beslut som tas gällande implementationen, och stötta mina programmerarkollegor. Jag deltar även tillsammans med teamets arkitekt i möten med andra parter gällande integration med de andra parternas system."
                  )}
                </.experience_detail>
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
          </.experience_card>

          <!-- Company 4 -->
          <.experience_card id="company-4" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_altero.webp"
                    width="429"
                    height="223"
                    loading="lazy"
                    alt={t(@lang, "Altero Consulting logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Altero Consulting
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Systemutvecklare • Konsultuppdrag • 2022–2025")}
                </p>
              </div>
            </:heading>
            <div class="pt-4 border-t border-slate-200 mt-4">
              <div class="space-y-6">
                <.experience_detail lang={@lang} title="Uppdrag">
                  {t(@lang, "Utveckla en lösning som sammanställer data till ett datalager.")}
                </.experience_detail>
                <.experience_detail lang={@lang} title="Nytta">
                  {t(
                    @lang,
                    "Jag arbetade tillsammans med en projektledare i ett projekt där vi tog fram en lösning som automatiskt sammanställer data från databastabeller och Excel-filer till ett datalager. Detta resulterade i att kunden bland annat kan dra större affärsnytta från sin data. Jag jobbade självständigt med mycket kontakt med slutanvändarna för att ta emot feedback och iterativt implementera förbättringar."
                  )}
                </.experience_detail>
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
          </.experience_card>

          <!-- Company 5 -->
          <.experience_card id="company-5" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_idagree.webp"
                    width="200"
                    height="200"
                    loading="lazy"
                    alt={t(@lang, "IdAgree logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">IdAgree</h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Systemutvecklare • Medgrundare • 2024–2024")}
                </p>
              </div>
            </:heading>
            <div class="pt-4 border-t border-slate-200 mt-4">
              <div class="space-y-6">
                <.experience_detail lang={@lang} title="Uppdrag">
                  {t(
                    @lang,
                    "Som medgrundare i ett startup-företag, utvecklade jag en prototyp av en tjänst för att skapa kvitton för secondhand-köp."
                  )}
                </.experience_detail>
                <.experience_detail lang={@lang} title="Nytta">
                  {t(
                    @lang,
                    "Jag byggde en webbtjänst från grunden och satte upp både produktionsmiljön och kontinuerlig driftsättning dit. Jag arbetade tillsammans med företagets andra grundare, implementerade funktioner enligt deras önskemål och feedback, samt utvecklade en integration med en tredjepartstjänst för att signera PDF-filer."
                  )}
                </.experience_detail>
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
          </.experience_card>

          <!-- Company 6 -->
          <.experience_card id="company-6" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_carnegie.svg"
                    width="320"
                    height="112"
                    loading="lazy"
                    alt={t(@lang, "Carnegie Investment Bank logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Carnegie Investment Bank
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Systemutvecklare, scrum-master • Anställd • 2021–2022")}
                </p>
              </div>
            </:heading>
            <div class="pt-4 border-t border-slate-200 mt-4">
              <div class="space-y-6">
                <.experience_detail lang={@lang} title="Uppdrag">
                  {t(
                    @lang,
                    "Vidareutveckling av integration mellan back office- och börshandelssystem, samt av system som används internt av mäklare för hantering av kunders värdepappersportföljer, i ett team med totalt 4-5 st utvecklare."
                  )}
                </.experience_detail>
                <.experience_detail lang={@lang} title="Nytta">
                  {t(
                    @lang,
                    "Daniel var både systemutvecklare och scrum master, och representerade teamet i Scrum of Scrums- och arkitekturmöten. Han hjälpte till med att leverera teamets system under ett back office-systembyte på ett lyckat sätt. Daniel vidareutvecklade därefter teamets applikationer och mikrotjänster. Förutom nya funktioner, migrerade han teamets kodbaser från .NET Core 3.1 till .NET 6, och införde körning av enhetstester och automatisk uppdatering av databaserna i CI/CD-pipeline:n. Han hjälpte ofta till med kodgranskning, skriva release notes och deploya nya versioner av mikrotjänsterna. Han löste också ofta akuta problem som användarna stötte på. Både Daniels teamledare och chef uppskattade hur han alltid tog för sig bland arbetsuppgifterna och gärna var inne i alla delar."
                  )}
                </.experience_detail>
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
          </.experience_card>

          <!-- Company 7 -->
          <.experience_card id="company-7" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_cellink.svg"
                    width="1512"
                    height="319"
                    loading="lazy"
                    alt={t(@lang, "Cellink logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">Cellink</h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Teamledare, systemutvecklare • Konsultuppdrag • 2019–2021")}
                </p>
              </div>
            </:heading>
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
          </.experience_card>

          <!-- Company 8 -->
          <.experience_card id="company-8" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_avarn.webp"
                    width="264"
                    height="72"
                    loading="lazy"
                    alt={t(@lang, "AVARN Security logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Avarn Security
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Väktare • Behovsanställd • 2020–2021")}
                </p>
              </div>
            </:heading>
            <div class="pt-4 border-t border-slate-200 mt-4">
              <p class="text-slate-600 dark:text-slate-200 text-sm">
                {t(
                  @lang,
                  "Behovsanställd som väktare. Planerarna på Avarn kunde ringa och erbjuda mig pass när de var i behov av personal, vilket innebar att mina uppgifter kunde skilja sig från ett pass till ett annat. Som exempel så har jag jobbat natt utanför ambulansinfarten till akuten på ett sjukhus, jobbat natt på ett utomhusbad och på en byggarbetsplats, jobbat kvällspass i shoppingcentrum, och vaktat utanför ett förvar under dagtid."
                )}
              </p>
            </div>
          </.experience_card>

          <!-- Company 9 -->
          <.experience_card id="company-9" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_labgruppen.webp"
                    width="1809"
                    height="155"
                    loading="lazy"
                    alt={t(@lang, "Lab Gruppen logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Lab Gruppen
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Systemutvecklare • Konsultuppdrag • 2020–2020")}
                </p>
              </div>
            </:heading>
            <div class="pt-4 border-t border-slate-200 mt-4">
              <div class="space-y-6">
                <.experience_detail lang={@lang} title="Uppdrag">
                  {t(
                    @lang,
                    "Daniel och 2 st kollegor hjälpte kunden med att porta en mjukvarulösning för ett inbyggt system utvecklad i C och assembler till att fungera på en annan hårdvaruplattform med en annan DSP (signalprocessor)."
                  )}
                </.experience_detail>
                <.experience_detail lang={@lang} title="Nytta">
                  {t(
                    @lang,
                    "Daniel utvecklade möjligheten att kunna föra över konfigurationsdata från Linux (ARM-processorkärna) till DSP:ns processorkärna, vilket gjorde det möjligt att styra saker som ljudvolym och equalizer-inställningar."
                  )}
                </.experience_detail>
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
          </.experience_card>

          <!-- Company 10 -->
          <.experience_card id="company-10" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_mentice.svg"
                    width="1529"
                    height="253"
                    loading="lazy"
                    alt={t(@lang, "Mentice logga")}
                    class="w-full h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Mentice
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Lead-utvecklare • Konsultuppdrag • 2017–2019")}
                </p>
              </div>
            </:heading>
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
          </.experience_card>

          <!-- Company 11 -->
          <.experience_card id="company-11" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_consilium.svg"
                    width="187"
                    height="32"
                    loading="lazy"
                    alt={t(@lang, "Consilium Marine & Safety logga")}
                    class="w-full h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
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
            </:heading>
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
          </.experience_card>

          <!-- Company 12 -->
          <.experience_card id="company-12" lang={@lang}>
            <:logo>
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
                  <img
                    src="/images/company_logo_ericsson.svg"
                    width="214"
                    height="45"
                    loading="lazy"
                    alt={t(@lang, "Ericsson logga")}
                    class="max-w-full max-h-full object-contain"
                  />
                </div>
              </div>
            </:logo>
            <:heading>
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
                  Ericsson
                </h3>
                <p class="text-slate-600 dark:text-slate-200">
                  {t(@lang, "Systemutvecklare • Anställd • 2015–2016")}
                </p>
              </div>
            </:heading>
            <div class="pt-4 border-t border-slate-200 mt-4">
              <div class="space-y-6">
                <.experience_detail lang={@lang} title="Uppdrag">
                  {t(
                    @lang,
                    "Ensamt ansvarig för att porta en avancerad Excel-arbetsbok med cirka 30 länkade arbetsblad till Python. Arbetsboken uppskattade belastningen på företagets servrar givet en mobiloperatörs trafiklast, vilket användes för att skapa underlag till offerter till dem."
                  )}
                </.experience_detail>
                <.experience_detail lang={@lang} title="Nytta">
                  {t(
                    @lang,
                    "Daniel jobbade självständigt med portningsarbetet. Samtidigt implementerade han mer avancerad modellering som inte var möjlig att implementera i Excel. Han byggde även ett grafiskt webbaserat gränssnitt."
                  )}
                </.experience_detail>
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
          </.experience_card>
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
    """
  end

  attr(:id, :string, required: true)
  attr(:lang, :string, required: true)
  slot(:logo, required: true)
  slot(:heading, required: true)
  slot(:inner_block, required: true)

  def experience_card(assigns) do
    ~H"""
    <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
      {render_slot(@logo)}
      {render_slot(@heading)}
      <!-- Expand Button -->
      <button
        onclick={"toggleCompany('#{@id}')"}
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
        id={"content-#{@id}"}
        class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out"
      >
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end

  attr(:lang, :string, required: true)
  attr(:title, :string, required: true)
  slot(:inner_block, required: true)

  def experience_detail(assigns) do
    ~H"""
    <div>
      <h4 class="font-semibold text-slate-900 dark:text-white mb-3">
        {t(@lang, @title)}
      </h4>
      <p class="text-slate-600 dark:text-slate-200 text-sm">
        {render_slot(@inner_block)}
      </p>
    </div>
    """
  end
end
