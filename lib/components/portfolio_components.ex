defmodule Kalyna.PortfolioComponents do
  @moduledoc "Shared, language-aware components for the Swedish and English portfolio."
  use Phoenix.Component
  import Kalyna.PortfolioContent, only: [copy: 2, value: 1]
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
          <span>{copy(@lang, :theme_label)}</span>
          <select
            id="theme-preference"
            aria-label={copy(@lang, :theme_label)}
            onchange="setTheme(this.value)"
            class="bg-white dark:bg-slate-800 rounded"
          >
            <option value="system">System</option>
            <option value="light">{copy(@lang, :light_label)}</option>
            <option value="dark">{copy(@lang, :dark_label)}</option>
          </select>
        </label>
      </div>

      <!-- Hero Section -->
      <.hero lang={@lang} />

      <!-- About Section -->
      <.about lang={@lang} />

      <!-- Technologies Section -->
      <.expertise lang={@lang} />

      <.daily_diff lang={@lang} />

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
          src={value(:logo_src)}
          srcset="/images/logo.webp 64w, /images/logo-128.webp 128w, /images/logo-192.webp 192w"
          sizes="64px"
          width="64"
          height="58"
          alt={copy(@lang, :logo_alt)}
          class="w-16 mr-4"
        />
        <h1 class="text-5xl font-bold text-slate-900 dark:text-white">
          {copy(@lang, :company_name)}
        </h1>
      </div>
      <p class="text-xl text-slate-600 dark:text-slate-200 mb-8 max-w-2xl mx-auto leading-relaxed">
        {copy(@lang, :tagline)}
      </p>
      <div class="flex flex-col sm:flex-row gap-4 justify-center">
        <a
          href={value(:contact_fragment)}
          class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-lg transition-colors font-medium"
        >
          {copy(@lang, :contact_heading)}
        </a>
        <a
          href={value(:about_fragment)}
          class="border border-slate-300 dark:border-slate-600 text-slate-700 dark:text-slate-200 px-8 py-3 rounded-lg hover:bg-slate-50 dark:hover:bg-slate-800 transition-colors font-medium"
        >
          {copy(@lang, :learn_more_label)}
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
              src={value(:portrait_one_src)}
              fetchpriority="high"
              srcset="/images/profile1.webp 192w, /images/profile1-384.webp 384w, /images/profile1-576.webp 576w"
              sizes="192px"
              width="192"
              height="192"
              alt={copy(@lang, :portrait_alt)}
              class="w-48 h-48 rounded-full mx-auto object-cover shadow-lg"
            />
          </div>
          <div class="md:col-span-2">
            <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8 text-center md:text-left">
              {copy(@lang, :about_heading)}
            </h2>
            <div class="text-slate-600 dark:text-slate-200 space-y-6">
              <p>
                {copy(@lang, :about_background)}
              </p>
              <p>
                {copy(@lang, :about_approach)}
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  attr(:lang, :string, required: true)

  def daily_diff(assigns) do
    ~H"""
    <section
      id="daily-diff"
      aria-labelledby="daily-diff-heading"
      class="px-6 py-16 sm:py-20 bg-[#160e26] text-white relative overflow-hidden"
    >
      <div
        aria-hidden="true"
        class="absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-cyan-300 to-transparent"
      >
      </div>
      <div class="max-w-5xl mx-auto grid md:grid-cols-2 gap-10 lg:gap-14 items-center relative">
        <div>
          <h2 id="daily-diff-heading" class="text-3xl font-bold text-cyan-300 mb-5">
            {copy(@lang, :projects_heading)}
          </h2>
          <h3 id="daily-diff-title" class="text-2xl sm:text-3xl font-bold tracking-tight mb-5">
            {copy(@lang, :daily_diff_name)}
          </h3>
          <p class="text-2xl sm:text-3xl font-semibold leading-tight text-white mb-5">
            {copy(@lang, :daily_diff_tagline)}
          </p>
          <p class="text-slate-300 leading-relaxed mb-8">
            {copy(@lang, :daily_diff_description)}
          </p>
          <a
            href={value(:daily_diff_url)}
            class="inline-flex items-center justify-center gap-3 rounded-lg bg-cyan-300 text-slate-950 px-6 py-3 font-bold hover:bg-cyan-200 transition-colors focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-cyan-300"
          >
            {copy(@lang, :daily_diff_read_label)}
            <svg
              aria-hidden="true"
              class="w-5 h-5"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
            >
              <path d="M7 17 17 7M7 7h10v10" stroke-linecap="round" stroke-linejoin="round" />
            </svg>
          </a>
        </div>
        <a
          href={value(:daily_diff_url)}
          aria-label={copy(@lang, :daily_diff_visit_label)}
          class="block rounded-xl border border-fuchsia-400/30 overflow-hidden shadow-2xl shadow-fuchsia-500/15 md:-rotate-2 hover:rotate-0 transition-transform motion-reduce:transform-none motion-reduce:transition-none focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-cyan-300"
        >
          <img
            src={value(:daily_diff_image_src)}
            srcset="/images/daily-diff.webp 480w, /images/daily-diff-768.webp 768w, /images/daily-diff-1200.webp 1200w"
            sizes="(min-width: 1024px) 484px, (min-width: 768px) calc((100vw - 88px) / 2), calc(100vw - 48px)"
            width="1200"
            height="630"
            loading="lazy"
            alt={copy(@lang, :daily_diff_image_alt)}
            class="w-full h-auto"
          />
        </a>
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
          {copy(@lang, :expertise_heading)}
        </h2>
        <div class="grid md:grid-cols-3 gap-8">
          <div class="text-center">
            <h3 class="text-xl font-semibold text-slate-900 dark:text-slate-100 mb-4">
              {copy(@lang, :roles_heading)}
            </h3>
            <ul class="text-slate-600 dark:text-slate-200 space-y-2">
              <li>{copy(@lang, :team_leader_role)}</li>
              <li>{copy(@lang, :lead_developer_role)}</li>
              <li>{copy(@lang, :developer_role)}</li>
            </ul>
          </div>
          <div class="text-center">
            <h3 class="text-xl font-semibold text-slate-900 dark:text-slate-100 mb-4">
              {copy(@lang, :areas_heading)}
            </h3>
            <ul class="text-slate-600 dark:text-slate-200 space-y-2">
              <li>{copy(@lang, :fullstack_area)}</li>
              <li>{copy(@lang, :backend_area)}</li>
              <li>{copy(@lang, :devops_area)}</li>
            </ul>
          </div>
          <div class="text-center">
            <h3 class="text-xl font-semibold text-slate-900 dark:text-slate-100 mb-4">
              {copy(@lang, :platforms_heading)}
            </h3>
            <ul class="text-slate-600 dark:text-slate-200 space-y-2">
              <li>{copy(@lang, :linux_platform)}</li>
              <li>{copy(@lang, :windows_platform)}</li>
              <li>{copy(@lang, :web_platform)}</li>
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
          {copy(@lang, :testimonial_heading)}
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
              {copy(@lang, :testimonial_quote)}
            </blockquote>
            <div class="font-semibold text-slate-900 dark:text-white text-lg">
              {copy(@lang, :testimonial_attribution)}
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
              src={value(:portrait_two_src)}
              srcset="/images/profile2.webp 192w, /images/profile2-384.webp 384w, /images/profile2-576.webp 576w"
              sizes="192px"
              width="192"
              height="192"
              loading="lazy"
              alt={copy(@lang, :portrait_alt)}
              class="w-48 h-48 rounded-full mx-auto object-cover shadow-lg mb-6"
            />
          </div>
          <div class="md:col-span-2">
            <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8 text-center md:text-left">
              {copy(@lang, :personal_heading)}
            </h2>
            <p class="mb-6 text-slate-600 dark:text-slate-200">
              {copy(@lang, :personal_background)}
            </p>
            <div class="grid md:grid-cols-2 gap-6 mt-8">
              <div>
                <h3 class="font-semibold text-slate-900 dark:text-white mb-3">
                  {copy(@lang, :interests_heading)}
                </h3>
                <ul class="space-y-2">
                  <li class="flex items-center text-slate-600 dark:text-slate-200">
                    <span class="w-2 h-2 bg-blue-600 rounded-full mr-3"></span>{copy(
                      @lang,
                      :finance_interest
                    )}
                  </li>
                  <li class="flex items-center text-slate-600 dark:text-slate-200">
                    <span class="w-2 h-2 bg-green-600 rounded-full mr-3"></span>{copy(
                      @lang,
                      :self_hosting_interest
                    )}
                  </li>
                  <li class="flex items-center text-slate-600 dark:text-slate-200">
                    <span class="w-2 h-2 bg-purple-600 rounded-full mr-3"></span>{copy(
                      @lang,
                      :elixir_interest
                    )}
                  </li>
                  <li class="flex items-center text-slate-600 dark:text-slate-200">
                    <span class="w-2 h-2 bg-orange-600 rounded-full mr-3"></span>{copy(
                      @lang,
                      :health_interest
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
              src={value(:kvadrat_logo_src)}
              width="838"
              height="158"
              loading="lazy"
              alt={copy(@lang, :kvadrat_logo_alt)}
              class="max-w-full max-h-full object-contain dark:brightness-0 dark:invert"
            />
          </div>
          <div class="md:col-span-2">
            <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8 text-center md:text-left">
              {copy(@lang, :network_heading)}
            </h2>
            <p class="text-slate-600 dark:text-slate-200 mb-4">
              {copy(@lang, :network_description)}
            </p>
            <a
              href={value(:kvadrat_profile_url)}
              target="_blank"
              class="bg-white dark:bg-slate-700 border border-slate-300 dark:border-slate-600 text-slate-700 dark:text-slate-200 px-6 py-3 rounded-lg hover:bg-slate-50 dark:hover:bg-slate-800 transition-colors font-medium inline-block"
            >
              {copy(@lang, :kvadrat_profile_label)}
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
          {copy(@lang, :contact_heading)}
        </h2>
        <p class="text-xl text-slate-600 dark:text-slate-200 mb-8 max-w-2xl mx-auto">
          {copy(@lang, :contact_description)}
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
            <h3 class="font-semibold text-slate-900 dark:text-white mb-2">
              {copy(@lang, :email_heading)}
            </h3>
            <a
              href={value(:email_url)}
              class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors break-all"
            >
              {copy(@lang, :email_address)}
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
            <h3 class="font-semibold text-slate-900 dark:text-white mb-2">
              {copy(@lang, :phone_heading)}
            </h3>
            <a
              href={value(:phone_url)}
              class="text-green-700 dark:text-green-300 hover:text-green-800 dark:hover:text-blue-400 transition-colors"
            >
              {copy(@lang, :phone_number)}
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
            <h3 class="font-semibold text-slate-900 dark:text-white mb-2">
              {copy(@lang, :mastodon_heading)}
            </h3>
            <a
              href={value(:mastodon_url)}
              rel="me"
              class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors"
            >
              {copy(@lang, :mastodon_label)}
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
            <h3 class="font-semibold text-slate-900 dark:text-white mb-2">
              {copy(@lang, :linkedin_heading)}
            </h3>
            <a
              href={value(:linkedin_url)}
              target="_blank"
              class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors"
            >
              {copy(@lang, :linkedin_label)}
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
          {copy(@lang, :community_heading)}
        </h2>
        <div class="grid md:grid-cols-2 gap-8">
          <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
            <div class="w-16 h-16 mx-auto mb-4 bg-blue-100 rounded-lg flex items-center justify-center">
              <svg class="w-8 h-8 text-blue-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-5 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-3">
              {copy(@lang, :blog_heading)}
            </h3>
            <p class="text-slate-600 dark:text-slate-200 mb-4">
              {copy(@lang, :blog_description)}
            </p>
            <a
              href={value(:blog_url)}
              class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors font-medium inline-block"
            >
              {copy(@lang, :blog_label)}
            </a>
          </div>

          <div class="text-center bg-white dark:bg-slate-800 p-6 rounded-lg shadow-sm">
            <div class="w-16 h-16 mx-auto mb-4 bg-red-100 rounded-lg flex items-center justify-center">
              <svg class="w-8 h-8 text-red-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-3">
              {copy(@lang, :youtube_heading)}
            </h3>
            <p class="text-slate-600 dark:text-slate-200 mb-4">
              {copy(@lang, :youtube_description)}
            </p>
            <a
              href={value(:youtube_url)}
              target="_blank"
              class="bg-red-600 text-white px-6 py-3 rounded-lg hover:bg-red-700 transition-colors font-medium inline-block"
            >
              {copy(@lang, :youtube_label)}
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
              src={value(:kalyna_image_src)}
              width="248"
              height="248"
              loading="lazy"
              alt={copy(@lang, :kalyna_image_alt)}
              class="w-48 h-48 lg:w-62 lg:h-62 rounded-full mx-auto object-cover shadow-lg border-4 border-white/20 dark:border-white/30"
            />
          </div>
          <div class="md:col-span-2">
            <h2 class="text-3xl font-bold text-slate-900 dark:text-white mb-8 text-center md:text-left">
              {copy(@lang, :kalyna_heading)}
            </h2>
            <p class="text-slate-600 dark:text-slate-200 leading-relaxed text-lg mb-4">
              {copy(@lang, :kalyna_intro)}{" "}<a
                href={value(:plant_url)}
                title={copy(@lang, :plant_link_title)}
                class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors underline underline-offset-2"
              >{copy(@lang, :plant_link_label)}</a>{copy(@lang, :kalyna_symbolism)}<a
                href={value(:song_url)}
                title={copy(@lang, :song_link_title)}
                class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors underline underline-offset-2"
              >{copy(@lang, :song_link_label)}</a>{copy(@lang, :song_history)}{" "}<a
                href={value(:song_video_url)}
                title={copy(@lang, :song_video_title)}
                class="text-blue-600 dark:text-blue-300 hover:text-blue-700 dark:hover:text-blue-400 transition-colors underline underline-offset-2"
              >{copy(@lang, :song_video_label)}</a>{copy(@lang, :full_stop)}
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
          {copy(@lang, :company_heading)}
        </h2>
        <div class="max-w-2xl mx-auto">
          <div class="bg-white dark:bg-slate-800 p-8 rounded-lg shadow-lg">
            <div class="space-y-4 text-slate-600 dark:text-slate-200 mb-8">
              <div class="flex justify-between">
                <span class="font-medium">{copy(@lang, :legal_name_label)}</span>
                <span>{copy(@lang, :company_name)}</span>
              </div>
              <div class="flex justify-between">
                <span class="font-medium">{copy(@lang, :registration_label)}</span>
                <span>{copy(@lang, :company_registration)}</span>
              </div>
              <div class="flex justify-between">
                <span class="font-medium">{copy(@lang, :vat_label)}</span>
                <span>{copy(@lang, :company_vat)}</span>
              </div>
              <div class="flex justify-between">
                <span class="font-medium">{copy(@lang, :location_label)}</span>
                <span>{copy(@lang, :company_location)}</span>
              </div>
              <div class="flex justify-between">
                <span class="font-medium">{copy(@lang, :tax_label)}</span>
                <span class="text-green-700 dark:text-green-400 font-medium">
                  {copy(@lang, :company_tax_status)}
                </span>
              </div>
            </div>

            <div class="pt-6 border-t border-slate-200 dark:border-slate-600">
              <h3 class="font-semibold text-slate-900 dark:text-white mb-4 text-center">
                {copy(@lang, :availability_heading)}
              </h3>
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
                  <span>{copy(@lang, :onsite_availability)}</span>
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
                  <span>{copy(@lang, :remote_availability)}</span>
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
