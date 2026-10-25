defmodule Kalyna.ExperienceComponents do
  @moduledoc "Experience cards and assignment details shared by both portfolio languages."
  use Phoenix.Component
  import Kalyna.Translations, only: [t: 2]

  attr(:lang, :string, required: true)

  def experience(assigns) do
    assigns = assign(assigns, :companies, Kalyna.Experience.companies())

    ~H"""
    <section id="experience" class="px-6 py-16">
      <div class="max-w-7xl mx-auto">
        <h2 class="text-4xl font-bold text-slate-900 dark:text-white mb-8 text-center">
          {t(@lang, "Professionell erfarenhet")}
        </h2>
        <p class="text-slate-600 dark:text-slate-200 text-center mb-12 max-w-2xl mx-auto">
          {t(@lang, "Företag jag arbetat med.")}
        </p>
        <div class="grid lg:grid-cols-2 xl:grid-cols-3 gap-6">
          <.experience_card
            :for={company <- @companies}
            lang={@lang}
            id={company.id}
            name={company.name}
            url={company.url}
            summary={company.summary}
            logo={company.logo}
            description={company.description}
            projects={company.projects}
          />
        </div>
      </div>
    </section>
    """
  end

  attr(:id, :string, required: true)
  attr(:lang, :string, required: true)
  attr(:name, :string, required: true)
  attr(:url, :string, default: nil)
  attr(:summary, :string, required: true)
  attr(:logo, :map, required: true)
  attr(:description, :string, default: nil)
  attr(:projects, :list, default: [])

  def experience_card(assigns) do
    ~H"""
    <div
      id={@id}
      class="company-item bg-white dark:bg-slate-700 rounded-lg shadow-sm p-6 transition-all duration-300"
    >
      <div class="flex justify-center mb-4">
        <div class="w-70 h-24 p-2 rounded-lg bg-white flex items-center justify-center">
          <img
            src={@logo.src}
            width={@logo.width}
            height={@logo.height}
            loading="lazy"
            alt=""
            class={[
              "object-contain",
              if(@logo.fill, do: "w-full h-full", else: "max-w-full max-h-full"),
              @logo.monochrome && "brightness-0"
            ]}
          />
        </div>
      </div>
      <div class="text-center mb-4">
        <h3 class="text-xl font-semibold text-slate-900 dark:text-white mb-2">
          <%= if @url do %>
            <a href={@url} class="underline">{t(@lang, @name)}</a>
          <% else %>
            {t(@lang, @name)}
          <% end %>
        </h3>
        <p class="text-slate-600 dark:text-slate-200">{t(@lang, @summary)}</p>
      </div>
      <details class="experience-details" name="experience">
        <summary class="w-full bg-slate-50 dark:bg-slate-600 hover:bg-slate-100 dark:hover:bg-slate-500 text-slate-700 dark:text-white py-3 px-4 rounded-lg flex items-center justify-center gap-2 cursor-pointer">
          <span>{t(@lang, "Visa mer")}<span class="sr-only">{" "}{t(@lang, "om")} {t(@lang, @name)}</span></span>
          <span class="expand-icon" aria-hidden="true">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M19 9l-7 7-7-7"
              />
            </svg>
          </span>
        </summary>
        <div id={"content-#{@id}"} class="company-content">
          <div class="pt-4 border-t border-slate-200 mt-4">
            <p :if={@description} class="text-slate-600 dark:text-slate-200 text-sm">
              {t(@lang, @description)}
            </p>
            <div :if={@projects != []} class="space-y-6">
              <.experience_project :for={project <- @projects} lang={@lang} project={project} />
            </div>
          </div>
        </div>
      </details>
    </div>
    """
  end

  attr(:lang, :string, required: true)
  attr(:project, :map, required: true)

  def experience_project(assigns) do
    assigns = assign(assigns, :heading_tag, if(assigns.project.title, do: "h5", else: "h4"))

    ~H"""
    <h4 :if={@project.title} class="font-semibold text-slate-900 dark:text-white mb-3">
      {t(@lang, @project.title)}
    </h4>
    <div :if={@project.assignment}>
      <.experience_heading tag={@heading_tag} lang={@lang} title="Uppdrag" />
      <p class="text-slate-600 dark:text-slate-200 text-sm">{t(@lang, @project.assignment)}</p>
    </div>
    <div :if={@project.benefit}>
      <.experience_heading tag={@heading_tag} lang={@lang} title="Nytta" />
      <p class="text-slate-600 dark:text-slate-200 text-sm">{t(@lang, @project.benefit)}</p>
    </div>
    <div :if={@project.technologies != []}>
      <.experience_heading tag={@heading_tag} lang={@lang} title="Tekniker" />
      <div class="flex flex-wrap gap-2">
        <span
          :for={technology <- @project.technologies}
          class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-xs"
        >
          {t(@lang, technology)}
        </span>
      </div>
    </div>
    """
  end

  attr(:tag, :string, required: true)
  attr(:lang, :string, required: true)
  attr(:title, :string, required: true)

  defp experience_heading(assigns) do
    ~H"""
    <.dynamic_tag tag_name={@tag} class="font-semibold text-slate-900 dark:text-white mb-3">
      {t(@lang, @title)}
    </.dynamic_tag>
    """
  end
end
