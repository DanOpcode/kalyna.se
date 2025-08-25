defmodule Kalyna.HomePage do
  use Tableau.Page,
    layout: Kalyna.RootLayout,
    permalink: "/"

  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <div class="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 dark:from-slate-900 dark:to-slate-800">
      <!-- Dark Mode Toggle -->
      <div class="fixed top-6 right-6 z-50">
        <button 
          onclick="toggleTheme()" 
          class="bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-lg p-3 shadow-lg hover:shadow-xl transition-all duration-200 group"
          aria-label="Toggle dark mode"
        >
          <!-- Sun Icon (visible in dark mode) -->
          <svg class="w-5 h-5 text-yellow-500 hidden dark:block group-hover:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"></path>
          </svg>
          <!-- Moon Icon (visible in light mode) -->
          <svg class="w-5 h-5 text-slate-700 dark:hidden group-hover:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"></path>
          </svg>
        </button>
      </div>

      <!-- Hero Section -->
      <section class="px-6 py-20 max-w-4xl mx-auto text-center">
        <div class="flex items-center justify-center mb-8">
          <img 
            src="/images/kalyna-logo.svg" 
            alt="Kalyna Solutions AB logo" 
            class="h-16 mr-4"
          />
          <h1 class="text-5xl font-bold text-slate-900 dark:text-white">
            Kalyna Solutions AB
          </h1>
        </div>
        <p class="text-xl text-slate-600 dark:text-slate-300 mb-8 max-w-2xl mx-auto leading-relaxed">
          Expertis inom mjukvaruutveckling och teknisk ledning för moderna webbapplikationer. 
          Jag hjälper företag att bygga skalbara, underhållbara lösningar med spjutspetsteknologier.
        </p>
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
          <a href="#contact" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg transition-colors font-medium">
            Kontakta mig
          </a>
          <a href="#about" class="border border-slate-300 dark:border-slate-600 text-slate-700 dark:text-slate-300 px-8 py-3 rounded-lg hover:bg-slate-50 dark:hover:bg-slate-800 transition-colors font-medium">
            Läs mer
          </a>
        </div>
      </section>

      <!-- About Section -->
      <section id="about" class="px-6 py-16 bg-white dark:bg-slate-800">
        <div class="max-w-4xl mx-auto">
          <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-12 text-center">Om mig</h2>
          <div class="grid md:grid-cols-3 gap-12 items-center">
            <div class="md:col-span-1 text-center">
              <img 
                src="/images/profile.jpg" 
                alt="Profile picture" 
                class="w-48 h-48 rounded-full mx-auto object-cover shadow-lg"
              />
            </div>
            <div class="md:col-span-2">
              <div class="prose prose-lg text-slate-600">
                <p>
                  Jag är en erfaren mjukvaruingenjör och teknisk konsult med expertis inom fullstack-utveckling, 
                  systemarkitektur och teamledning. Jag specialiserar mig på att hjälpa organisationer att modernisera 
                  sin tekniska stack och bygga robusta, skalbara applikationer.
                </p>
                <p>
                  Min metod kombinerar djup teknisk kunskap med starka kommunikationsfärdigheter, vilket säkerställer 
                  att komplexa tekniska koncept blir tillgängliga för både tekniska och icke-tekniska intressenter.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Technologies Section -->
      <section class="px-6 py-16 bg-slate-50">
        <div class="max-w-4xl mx-auto">
          <h2 class="text-3xl font-bold text-slate-900 mb-8 text-center">Teknologier & Expertis</h2>
          <div class="grid md:grid-cols-3 gap-8">
            <div class="text-center">
              <h3 class="text-xl font-semibold text-slate-900 mb-4">Backend-utveckling</h3>
              <ul class="text-slate-600 space-y-2">
                <li>Elixir & Phoenix</li>
                <li>Node.js & TypeScript</li>
                <li>Python & Django</li>
                <li>PostgreSQL & Redis</li>
              </ul>
            </div>
            <div class="text-center">
              <h3 class="text-xl font-semibold text-slate-900 mb-4">Frontend-utveckling</h3>
              <ul class="text-slate-600 space-y-2">
                <li>React & Next.js</li>
                <li>Vue.js & Nuxt</li>
                <li>Phoenix LiveView</li>
                <li>TailwindCSS</li>
              </ul>
            </div>
            <div class="text-center">
              <h3 class="text-xl font-semibold text-slate-900 mb-4">DevOps & Moln</h3>
              <ul class="text-slate-600 space-y-2">
                <li>AWS & Docker</li>
                <li>CI/CD Pipelines</li>
                <li>Kubernetes</li>
                <li>Infrastructure as Code</li>
              </ul>
            </div>
          </div>
        </div>
      </section>

      <!-- Professional Experience Section -->
      <section class="px-6 py-16 bg-white">
        <div class="max-w-4xl mx-auto">
          <h2 class="text-3xl font-bold text-slate-900 mb-8 text-center">Professionell erfarenhet</h2>
          <p class="text-slate-600 text-center mb-12 max-w-2xl mx-auto">
            Ett urval av företag jag arbetat med och väsentliga projekt jag levererat
          </p>
          <div class="grid lg:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-6">
            <!-- Company 1 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-20 h-20 bg-blue-100 rounded-lg flex items-center justify-center">
                  <img src="/images/logos/techcorp.svg" alt="TechCorp Inc. logo" class="w-16 h-16 object-contain" />
                </div>
              </div>
              
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 mb-2">TechCorp Inc.</h3>
                <p class="text-slate-600">Senior Fullstack-utvecklare • 2022-2024</p>
              </div>
              
              <!-- Expand Button -->
              <button 
                onclick="toggleCompany('techcorp')" 
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>Visa mer</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg class="w-4 h-4 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                  </svg>
                </div>
              </button>
              
              <!-- Expandable Content -->
              <div id="content-techcorp" class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out">
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 mb-3">Nyckelprestation</h4>
                      <ul class="list-disc list-inside text-slate-600 space-y-2 text-sm">
                        <li>Ledde migrering från äldre monolit till mikrotjänster-arkitektur, minskade driftsättningstid med 75%</li>
                        <li>Byggde realtidsanalys dashboard som betjänar 10k+ samtidiga användare med React och WebSockets</li>
                        <li>Mentorade team på 4 junior-utvecklare och etablerade kodgranskningsprocesser</li>
                      </ul>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 mb-3">Använda teknologier</h4>
                      <div class="flex flex-wrap gap-2">
                        <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs">React</span>
                        <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs">Node.js</span>
                        <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs">PostgreSQL</span>
                        <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs">AWS</span>
                        <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs">Docker</span>
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
                <div class="w-20 h-20 bg-green-100 rounded-lg flex items-center justify-center">
                  <img src="/images/logos/startupxyz.svg" alt="StartupXYZ logo" class="w-16 h-16 object-contain" />
                </div>
              </div>
              
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 mb-2">StartupXYZ</h3>
                <p class="text-slate-600">Teknisk ledare • 2021-2022</p>
              </div>
              
              <!-- Expand Button -->
              <button 
                onclick="toggleCompany('startupxyz')" 
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>Visa mer</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg class="w-4 h-4 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                  </svg>
                </div>
              </button>
              
              <!-- Expandable Content -->
              <div id="content-startupxyz" class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out">
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 mb-3">Nyckelprestation</h4>
                      <ul class="list-disc list-inside text-slate-600 space-y-2 text-sm">
                        <li>Arkitekterade och byggde MVP från grunden, uppnådde produkt-marknads-anpassning inom 8 månader</li>
                        <li>Skalade plattform för att hantera 100x användartillväxt med 99,9% drifttid</li>
                        <li>Etablerade utvecklingskultur och rekryterade inledande utvecklingsteam</li>
                      </ul>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 mb-3">Använda teknologier</h4>
                      <div class="flex flex-wrap gap-2">
                        <span class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-xs">Vue.js</span>
                        <span class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-xs">Python</span>
                        <span class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-xs">Django</span>
                        <span class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-xs">Redis</span>
                        <span class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-xs">Kubernetes</span>
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
                <div class="w-20 h-20 bg-purple-100 rounded-lg flex items-center justify-center">
                  <img src="/images/logos/enterprise.svg" alt="Enterprise Solutions logo" class="w-16 h-16 object-contain" />
                </div>
              </div>
              
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 mb-2">Enterprise Solutions</h3>
                <p class="text-slate-600">Lösningsarkitekt • 2020-2021</p>
              </div>
              
              <!-- Expand Button -->
              <button 
                onclick="toggleCompany('enterprise')" 
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>Visa mer</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg class="w-4 h-4 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                  </svg>
                </div>
              </button>
              
              <!-- Expandable Content -->
              <div id="content-enterprise" class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out">
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 mb-3">Nyckelprestation</h4>
                      <ul class="list-disc list-inside text-slate-600 space-y-2 text-sm">
                        <li>Moderniserade äldre ERP-system som betjänar 50+ företagskunder</li>
                        <li>Minskade systemunderhållskostnader med 40% genom strategisk refaktorering</li>
                        <li>Ledde tvärfunktionellt team på 12 ingenjörer och designers</li>
                      </ul>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 mb-3">Använda teknologier</h4>
                      <div class="flex flex-wrap gap-2">
                        <span class="px-2 py-1 bg-purple-100 text-purple-800 rounded-full text-xs">Java</span>
                        <span class="px-2 py-1 bg-purple-100 text-purple-800 rounded-full text-xs">Spring Boot</span>
                        <span class="px-2 py-1 bg-purple-100 text-purple-800 rounded-full text-xs">Oracle</span>
                        <span class="px-2 py-1 bg-purple-100 text-purple-800 rounded-full text-xs">Angular</span>
                        <span class="px-2 py-1 bg-purple-100 text-purple-800 rounded-full text-xs">Jenkins</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Project 1 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-20 h-20 bg-orange-100 rounded-lg flex items-center justify-center">
                  <svg class="w-12 h-12 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4m0 0L7 13m0 0l-2.5-5M7 13l-2.5 5M17 21a2 2 0 100-4 2 2 0 000 4zM9 21a2 2 0 100-4 2 2 0 000 4z"></path>
                  </svg>
                </div>
              </div>
              
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 mb-2">E-handelsplattform Migration</h3>
                <p class="text-slate-600">Oberoende projekt • 2023</p>
                <p class="text-orange-600 text-sm font-medium mt-1">PROJEKT</p>
              </div>
              
              <!-- Expand Button -->
              <button 
                onclick="toggleCompany('ecommerce-platform')" 
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>Visa mer</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg class="w-4 h-4 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                  </svg>
                </div>
              </button>
              
              <!-- Expandable Content -->
              <div id="content-ecommerce-platform" class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out">
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 mb-3">Projektöversikt</h4>
                      <ul class="list-disc list-inside text-slate-600 space-y-2 text-sm">
                        <li>Migrerade äldre PHP e-handelsplattform till modern Elixir/Phoenix-arkitektur</li>
                        <li>Förbättrade sidladdningstider med 60% och minskade serverkostnader med 40%</li>
                        <li>Implementerade realtids lagerhantering och orderbearbetning</li>
                      </ul>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 mb-3">Använda teknologier</h4>
                      <div class="flex flex-wrap gap-2">
                        <span class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-xs">Elixir</span>
                        <span class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-xs">Phoenix</span>
                        <span class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-xs">LiveView</span>
                        <span class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-xs">PostgreSQL</span>
                        <span class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-xs">Redis</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Project 2 -->
            <div class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300">
              <!-- Logo Row -->
              <div class="flex justify-center mb-4">
                <div class="w-20 h-20 bg-teal-100 rounded-lg flex items-center justify-center">
                  <svg class="w-12 h-12 text-teal-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                  </svg>
                </div>
              </div>
              
              <!-- Content -->
              <div class="text-center mb-4">
                <h3 class="text-xl font-semibold text-slate-900 mb-2">AI-driven Analytics Dashboard</h3>
                <p class="text-slate-600">Konsultprojekt • 2022</p>
                <p class="text-teal-600 text-sm font-medium mt-1">PROJEKT</p>
              </div>
              
              <!-- Expand Button -->
              <button 
                onclick="toggleCompany('ai-analytics')" 
                class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-slate-200 py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
              >
                <span>Visa mer</span>
                <div class="expand-icon transition-transform duration-300">
                  <svg class="w-4 h-4 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                  </svg>
                </div>
              </button>
              
              <!-- Expandable Content -->
              <div id="content-ai-analytics" class="company-content max-h-0 overflow-hidden transition-all duration-500 ease-in-out">
                <div class="pt-4 border-t border-slate-200 mt-4">
                  <div class="space-y-6">
                    <div>
                      <h4 class="font-semibold text-slate-900 mb-3">Projektöversikt</h4>
                      <ul class="list-disc list-inside text-slate-600 space-y-2 text-sm">
                        <li>Byggde ML-driven business intelligence-plattform för detaljhandelskedja</li>
                        <li>Automatiserade rapportgenerering som minskade manuellt arbete med 80%</li>
                        <li>Implementerade prediktiv analys för lageroptimering</li>
                      </ul>
                    </div>
                    <div>
                      <h4 class="font-semibold text-slate-900 mb-3">Använda teknologier</h4>
                      <div class="flex flex-wrap gap-2">
                        <span class="px-2 py-1 bg-teal-100 text-teal-800 rounded-full text-xs">Python</span>
                        <span class="px-2 py-1 bg-teal-100 text-teal-800 rounded-full text-xs">FastAPI</span>
                        <span class="px-2 py-1 bg-teal-100 text-teal-800 rounded-full text-xs">Scikit-learn</span>
                        <span class="px-2 py-1 bg-teal-100 text-teal-800 rounded-full text-xs">React</span>
                        <span class="px-2 py-1 bg-teal-100 text-teal-800 rounded-full text-xs">D3.js</span>
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
                if (otherText) otherText.textContent = 'Visa mer';
              }
            });
            
            // Toggle current item
            if (isExpanded) {
              content.style.maxHeight = '0px';
              if (icon) icon.style.transform = 'rotate(0deg)';
              if (buttonText) buttonText.textContent = 'Visa mer';
            } else {
              content.style.maxHeight = content.scrollHeight + 'px';
              if (icon) icon.style.transform = 'rotate(180deg)';
              if (buttonText) buttonText.textContent = 'Visa mindre';
            }
          }
        </script>
      </section>

      <!-- Testimonial Section -->
      <section class="px-6 py-16 bg-slate-50 dark:bg-slate-900">
        <div class="max-w-4xl mx-auto">
          <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-12 text-center">Vad kollegor säger</h2>
          <div class="bg-white dark:bg-slate-800 rounded-xl shadow-lg p-8 md:p-12 relative">
            <!-- Quote Icon -->
            <div class="absolute top-6 left-6 text-blue-200 dark:text-blue-300">
              <svg class="w-12 h-12" fill="currentColor" viewBox="0 0 24 24">
                <path d="M14.017 21v-7.391c0-5.704 3.731-9.57 8.983-10.609l.995 2.151c-2.432.917-3.995 3.638-3.995 5.849h4v10h-10zm-14.017 0v-7.391c0-5.704 3.748-9.57 9-10.609l.996 2.151c-2.433.917-3.996 3.638-3.996 5.849h4v10h-10z"/>
              </svg>
            </div>
            
            <div class="pt-8">
              <blockquote class="text-xl md:text-2xl text-slate-700 dark:text-slate-300 leading-relaxed mb-8 italic">
                "Att arbeta med [Ditt namn] var en fantastisk upplevelse. Hans djupa tekniska kunskap kombinerat med 
                förmågan att kommunicera komplexa lösningar på ett tydligt sätt gjorde honom ovärderlig för vårt team. 
                Han levererade inte bara teknisk excellens utan hjälpte även till att höja hela teamets prestanda genom 
                mentorskap och ledarskap."
              </blockquote>
              
              <div class="flex items-center">
                <div class="w-16 h-16 bg-gradient-to-br from-blue-400 to-blue-600 rounded-full flex items-center justify-center mr-4">
                  <span class="text-white font-bold text-xl">SK</span>
                </div>
                <div>
                  <div class="font-semibold text-slate-900 dark:text-white text-lg">Sara Karlsson</div>
                  <div class="text-slate-600 dark:text-slate-300">Engineering Manager, TechCorp Inc.</div>
                  <div class="text-slate-500 dark:text-slate-400 text-sm">LinkedIn</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Personal Section -->
      <section class="px-6 py-16 bg-white dark:bg-slate-800">
        <div class="max-w-4xl mx-auto">
          <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-12 text-center">Bortom koden</h2>
          <div class="grid md:grid-cols-3 gap-12 items-center">
            <div class="md:col-span-1 text-center">
              <img 
                src="/images/personal.jpg" 
                alt="Personal photo" 
                class="w-48 h-48 rounded-full mx-auto object-cover shadow-lg mb-6"
              />
            </div>
            <div class="md:col-span-2">
              <div class="prose prose-lg text-slate-600 dark:text-slate-300">
                <p class="mb-6">
                  När jag inte kodar är jag en hängivna familjefar, gift med min underbara fru och 
                  stolt pappa till vår dotter. Familjen är grunden som håller mig jordad och motiverad 
                  i allt jag gör.
                </p>
                <p class="mb-6">
                  Varje år gör vi resan till Ukraina för att besöka familj och hålla kontakten med våra rötter. 
                  Dessa resor är mer än bara resor—de handlar om att bibehålla kulturella band och säkerställa 
                  att vår dotter växer upp med förståelse för sitt arv.
                </p>
                <div class="grid md:grid-cols-2 gap-6 mt-8">
                  <div>
                    <h4 class="font-semibold text-slate-900 dark:text-white mb-3">Personliga intressen</h4>
                    <ul class="space-y-2">
                      <li class="flex items-center text-slate-600 dark:text-slate-300">
                        <span class="w-2 h-2 bg-blue-600 rounded-full mr-3"></span>
                        Finanser & Investeringsstrategi
                      </li>
                      <li class="flex items-center text-slate-600 dark:text-slate-300">
                        <span class="w-2 h-2 bg-green-600 rounded-full mr-3"></span>
                        Kryptovaluta & DeFi
                      </li>
                      <li class="flex items-center text-slate-600 dark:text-slate-300">
                        <span class="w-2 h-2 bg-purple-600 rounded-full mr-3"></span>
                        Öppen källkod-programmering
                      </li>
                      <li class="flex items-center text-slate-600 dark:text-slate-300">
                        <span class="w-2 h-2 bg-orange-600 rounded-full mr-3"></span>
                        Självdrifting & Hemlab
                      </li>
                    </ul>
                  </div>
                  <div>
                    <h4 class="font-semibold text-slate-900 dark:text-white mb-3">Aktuella projekt</h4>
                    <ul class="space-y-2 text-slate-600 dark:text-slate-300">
                      <li>Bygger ett personligt hemlab med Kubernetes</li>
                      <li>Bidrar till öppen källkod Elixir-projekt</li>
                      <li>Utforskar DeFi-protokoll och smarta kontrakt</li>
                      <li>Lär min dotter att koda</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Content & Community Section -->
      <section class="px-6 py-16 bg-slate-50 dark:bg-slate-900">
        <div class="max-w-4xl mx-auto">
          <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-12 text-center">Innehåll & Community</h2>
          <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
              <div class="w-16 h-16 mx-auto mb-4 bg-blue-100 rounded-lg flex items-center justify-center">
                <svg class="w-8 h-8 text-blue-600" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-5 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z"/>
                </svg>
              </div>
              <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-3">Teknisk blogg</h3>
              <p class="text-slate-600 dark:text-slate-300 mb-4">
                Insikter om mjukvaruutveckling, arkitekturmönster och framväxande teknologier.
              </p>
              <a href="/blog" class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors font-medium inline-block">
                Läs artiklar
              </a>
            </div>
            
            <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
              <div class="w-16 h-16 mx-auto mb-4 bg-red-100 rounded-lg flex items-center justify-center">
                <svg class="w-8 h-8 text-red-600" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
                </svg>
              </div>
              <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-3">YouTube-kanal</h3>
              <p class="text-slate-600 dark:text-slate-300 mb-4">
                Videotutorials, kodgenomgångar och teknikdiskussioner för utvecklare.
              </p>
              <a href="https://youtube.com/@yourchannel" target="_blank" class="bg-red-600 text-white px-6 py-3 rounded-lg hover:bg-red-700 transition-colors font-medium inline-block">
                Titta på videos
              </a>
            </div>

            <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm lg:col-span-1 md:col-span-2 lg:col-span-1">
              <div class="w-full h-16 mx-auto mb-4 bg-purple-100 dark:bg-purple-900 rounded-lg flex items-center justify-center px-4">
                <img 
                  src="/images/logos/kvadrat-logo.svg" 
                  alt="Kvadrat logo" 
                  class="h-8 max-w-full object-contain"
                />
              </div>
              <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-3">Del av Kvadrat</h3>
              <p class="text-slate-600 dark:text-slate-300 mb-4">
                Medlem i ett kollektiv av erfarna konsulter inom mjukvaruutveckling och digital transformation.
              </p>
              <a href="https://kvadrat.io/cv" target="_blank" class="border border-slate-300 dark:border-slate-600 text-slate-700 dark:text-slate-300 px-6 py-3 rounded-lg hover:bg-slate-50 dark:hover:bg-slate-700 transition-colors font-medium inline-block">
                Se mitt CV
              </a>
            </div>
          </div>
        </div>
      </section>

      <!-- Contact Section -->
      <section id="contact" class="px-6 py-16 bg-white dark:bg-slate-800">
        <div class="max-w-4xl mx-auto text-center">
          <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8">Låt oss samarbeta</h2>
          <p class="text-xl text-slate-600 dark:text-slate-300 mb-8 max-w-2xl mx-auto">
            Redo att diskutera ditt nästa projekt? Jag skulle gärna höra om dina utmaningar 
            och utforska hur jag kan hjälpa ditt team att lyckas.
          </p>
          <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-6 max-w-4xl mx-auto">
            <!-- Email -->
            <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
              <div class="w-12 h-12 mx-auto mb-4 bg-blue-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                </svg>
              </div>
              <h3 class="font-semibold text-slate-900 dark:text-white mb-2">E-post</h3>
              <a href="mailto:hello@kalyna.se" class="text-blue-600 hover:text-blue-700 transition-colors break-all">
                hello@kalyna.se
              </a>
            </div>

            <!-- Phone -->
            <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
              <div class="w-12 h-12 mx-auto mb-4 bg-green-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                </svg>
              </div>
              <h3 class="font-semibold text-slate-900 dark:text-white mb-2">Telefon</h3>
              <a href="tel:+46701234567" class="text-green-600 hover:text-green-700 transition-colors">
                +46 70 123 45 67
              </a>
            </div>

            <!-- LinkedIn -->
            <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
              <div class="w-12 h-12 mx-auto mb-4 bg-blue-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-blue-600" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                </svg>
              </div>
              <h3 class="font-semibold text-slate-900 dark:text-white mb-2">LinkedIn</h3>
              <a href="https://linkedin.com/in/yourprofile" target="_blank" class="text-blue-600 hover:text-blue-700 transition-colors">
                Se profil
              </a>
            </div>

            <!-- X/Twitter -->
            <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
              <div class="w-12 h-12 mx-auto mb-4 bg-slate-100 rounded-full flex items-center justify-center">
                <svg class="w-6 h-6 text-slate-600" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                </svg>
              </div>
              <h3 class="font-semibold text-slate-900 dark:text-white mb-2">X (Twitter)</h3>
              <a href="https://x.com/yourusername" target="_blank" class="text-slate-600 hover:text-slate-700 transition-colors">
                Följ @yourusername
              </a>
            </div>
          </div>
        </div>
      </section>

      <!-- Company Information Section -->
      <section class="px-6 py-16 bg-slate-100 dark:bg-slate-900">
        <div class="max-w-4xl mx-auto">
          <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-12 text-center">Företagsinformation</h2>
          <div class="max-w-2xl mx-auto">
            <div class="bg-white dark:bg-slate-800 p-8 rounded-lg shadow-lg">
              <div class="space-y-4 text-slate-600 dark:text-slate-300 mb-8">
                <div class="flex justify-between">
                  <span class="font-medium">Företag:</span>
                  <span>Kalyna Solutions AB</span>
                </div>
                <div class="flex justify-between">
                  <span class="font-medium">Org. nummer:</span>
                  <span>559386-8457</span>
                </div>
                <div class="flex justify-between">
                  <span class="font-medium">Plats:</span>
                  <span>Stockholm, Sverige</span>
                </div>
                <div class="flex justify-between">
                  <span class="font-medium">Skattestatus:</span>
                  <span class="text-green-600 font-medium">Godkänd för F-skatt</span>
                </div>
              </div>
              
              <div class="pt-6 border-t border-slate-200 dark:border-slate-600">
                <h4 class="font-semibold text-slate-900 dark:text-white mb-4 text-center">Tillgänglighet</h4>
                <div class="space-y-3 text-slate-600 dark:text-slate-300">
                  <div class="flex items-center justify-center">
                    <svg class="w-5 h-5 text-blue-600 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                    <span>Projekt på plats i Stockholmsområdet</span>
                  </div>
                  <div class="flex items-center justify-center">
                    <svg class="w-5 h-5 text-green-600 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9v-9m0-9v9"></path>
                    </svg>
                    <span>Fjärrprojekt världen över</span>
                  </div>
                  <div class="flex items-center justify-center">
                    <svg class="w-5 h-5 text-purple-600 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <span>CET tidszon (UTC+1/+2)</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- About Kalyna Section -->
      <section class="px-6 py-16 bg-slate-900 dark:bg-slate-950 text-white">
        <div class="max-w-4xl mx-auto">
          <div class="grid md:grid-cols-3 gap-12 items-center">
            <div class="md:col-span-1 text-center">
              <img 
                src="/images/kalyna-flower.jpg" 
                alt="Kalyna (viburnum) flower" 
                class="w-48 h-48 rounded-full mx-auto object-cover shadow-lg border-4 border-white/20 dark:border-white/30"
              />
            </div>
            <div class="md:col-span-2 text-center md:text-left">
              <h2 class="text-3xl font-bold mb-6">Om Kalyna</h2>
              <p class="text-slate-300 dark:text-slate-200 leading-relaxed text-lg mb-4">
                Kalyna (калина) är det ukrainska ordet för olvon, en blomstrande växt känd för sin motståndskraft 
                och vackra klakar av bär. Precis som olvonen anpassar sig och blomstrar i olika 
                miljöer, anpassar sig Kalyna Solutions till dina unika tekniska utmaningar och hjälper dina 
                projekt att blomstra genom expertengineering och genomtänkt arkitektur.
              </p>
              <p class="text-slate-400 dark:text-slate-300 leading-relaxed">
                Namnet speglar vårt engagemang för att bygga robusta, anpassningsbara lösningar som står emot tidens tand, 
                samtidigt som vi hedrar det kulturella arv och de värderingar som driver vårt arbete.
              </p>
            </div>
          </div>
        </div>
      </section>
    </div>

    <script>
      // Dark mode functionality
      function initTheme() {
        const savedTheme = localStorage.getItem('theme');
        const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
        
        if (savedTheme === 'dark' || (!savedTheme && prefersDark)) {
          document.documentElement.classList.add('dark');
        }
      }

      function toggleTheme() {
        const isDark = document.documentElement.classList.toggle('dark');
        localStorage.setItem('theme', isDark ? 'dark' : 'light');
      }

      // Initialize theme on page load
      initTheme();
      
      // Listen for system theme changes
      window.matchMedia('(prefers-color-scheme: dark)').addListener((e) => {
        if (!localStorage.getItem('theme')) {
          if (e.matches) {
            document.documentElement.classList.add('dark');
          } else {
            document.documentElement.classList.remove('dark');
          }
        }
      });
    </script>
    """
  end
end