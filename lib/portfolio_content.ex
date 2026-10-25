defmodule Kalyna.PortfolioContent do
  @moduledoc "Portfolio copy and document structure shared by HTML components and Markdown output."

  @copy %{
    theme_label: "Tema",
    light_label: "Ljust",
    dark_label: "Mörkt",
    logo_alt: "Kalyna Solutions AB logga",
    tagline: "Expertis inom mjukvaruutveckling och teknisk ledning.",
    contact_heading: "Kontakta mig",
    learn_more_label: "Läs mer",
    portrait_alt: "Profilbild",
    about_heading: "Om Daniel Jonsson",
    about_background:
      "Jag är en systemutvecklare med 10+ års erfarenhet av mjukvaruutveckling professionellt inom flera programmeringsspråk. Framförallt har jag arbetat med C#/.NET, men har även gedigen erfarenhet av JavaScript, C++, Python, Swift, HTML och CSS. Jag började programmera som nioåring och har en civilingenjörsexamen i informationsteknik från Chalmers tekniska högskola. Plattformarna som jag har arbetat professionellt med är Windows, Linux, webben, iOS och inbyggda system.",
    about_approach:
      "Jag har ett analytiskt sinne, är duktig på att lösa komplexa uppgifter och är snabbt produktiv i nya system. Jag är en människokännare, en bra lagspelare och duktig på att lyssna på mina kunder och kollegor.",
    projects_heading: "Ett av mina projekt",
    daily_diff_tagline: "Din dagliga dos tekniknyheter. För dig som bygger.",
    daily_diff_description:
      "Hacker News, Lobsters och Programming.dev i en samlad nyhetsöversikt. Byggt för att göra det enkelt att hänga med i de mest uppröstade och diskuterade nyheterna.",
    daily_diff_read_label: "Läs senaste nyheterna",
    daily_diff_visit_label: "Besök Daily Diff",
    daily_diff_image_alt:
      "Daily Diff – en synthwave-solnedgång över ett lysande cyanblått rutnät.",
    expertise_heading: "Teknologier & expertis",
    roles_heading: "Roller",
    team_leader_role: "Teamledare",
    lead_developer_role: "Lead-utvecklare",
    developer_role: "Systemutvecklare",
    areas_heading: "Områden",
    platforms_heading: "Plattformar",
    web_platform: "Webb",
    testimonial_heading: "Vad en tidigare kollega säger",
    testimonial_quote:
      "”Daniel var utvecklare i många projekt (konsult), varav vissa med mig. Han tog stort eget ansvar för planering, ledning och utförande, samt direktkontakt med kund. Han var allmänt (även av ledningen) ansedd som en schweizisk armékniv som kunde skickas in i vilket mjukvaruprojekt som helst och glänsa.”",
    testimonial_attribution: "— Citat från tidigare kollega.",
    personal_heading: "Utanför jobbet",
    personal_background:
      "När jag inte kodar är jag en familjefar, gift med min underbara fru och stolt pappa till vår dotter. Varje år reser vi till Ukraina, även under kriget, för att besöka min frus familj.",
    interests_heading: "Personliga intressen",
    finance_interest: "Sparande och finans",
    self_hosting_interest: "Self-hosting, Linux och öppen källkod",
    elixir_interest: "Funktionell programmering (Elixir)",
    health_interest: "Träning och hälsa",
    kvadrat_logo_alt: "Kvadrat logga",
    network_heading: "Del av Kvadrat",
    network_description:
      "Medlem i Kvadrat – Sveriges största nätverk av egenföretagare som hjälper företag och organisationer till förändring, med spetskonsulter inom systemutveckling, digitalisering, informationshantering, ledning, organisations- och verksamhetsutveckling.",
    kvadrat_profile_label: "Se min profil",
    contact_description:
      "Har du några behov, tankar eller idéer? Du får gärna kontakta mig oavsett anledning.",
    email_heading: "E-post",
    phone_heading: "Telefon",
    mastodon_label: "Följ mig på Mastodon",
    linkedin_label: "Se profil",
    community_heading: "Innehåll & community",
    blog_heading: "Blogg",
    blog_description: "Personliga tankar om livet och teknik i textformat.",
    blog_label: "Läs artiklar",
    youtube_description: "Personliga tankar om livet och teknik i videoformat.",
    youtube_label: "Titta på videos",
    kalyna_heading: "Om Kalyna",
    kalyna_intro:
      "“Kalyna“ är det ukrainska ordet “Калина“ skrivet med latinska bokstäver. Калина är en växt som på svenska översätts till",
    plant_link_title: "Wikipedia-artikel om skogsolvon.",
    plant_link_label: "skogsolvon",
    kalyna_symbolism:
      ". Det är en anrik symbol för Ukraina med lång tradition, och dess bär symboliserar hemlandet. Skogsolvon dyker i Ukraina upp i sånger, konst, broderi och poesi. En numera välkänd sång är “",
    song_link_title: "Wikipedia-artikel om sången 'Ett rött olvon vid ängen'.",
    song_link_label: "Ett rött olvon vid ängen",
    song_history: "“ som skrevs 1914; “Ой у лузі червона калина“ är dess originaltitel och",
    song_video_title: "En grupp personer som sjunger sången 'Ой у лузі червона калина'.",
    song_video_label: "sjungs fortfarande",
    company_heading: "Bolagsinformation",
    legal_name_label: "Juridiskt namn:",
    registration_label: "Organisationsnummer:",
    vat_label: "VAT-nummer:",
    location_label: "Plats:",
    company_location: "Stockholm, Sverige",
    tax_label: "Skattestatus:",
    company_tax_status: "Godkänd för F-skatt",
    availability_heading: "Tillgänglighet",
    onsite_availability: "Projekt på plats i Stockholmsområdet",
    remote_availability: "Remote-projekt",
    logo_src: "/images/logo.webp",
    company_name: "Kalyna Solutions AB",
    contact_fragment: "#contact",
    about_fragment: "#about",
    portrait_one_src: "/images/profile1.webp",
    fullstack_area: "Fullstack",
    backend_area: "Backend",
    devops_area: "DevOps",
    linux_platform: "Linux",
    windows_platform: "Windows",
    daily_diff_name: "Daily Diff",
    daily_diff_url: "https://news.kalyna.se/",
    daily_diff_image_src: "/images/daily-diff.webp",
    portrait_two_src: "/images/profile2.webp",
    kvadrat_logo_src: "/images/kvadrat-logo.svg",
    kvadrat_profile_url: "https://www.kvadrat.se/anlita-kvadrat/hitta-konsult/daniel-jonsson/",
    email_url: "mailto:daniel@kalyna.se",
    email_address: "daniel@kalyna.se",
    phone_url: "tel:+46707329868",
    phone_number: "+46 70 732 98 68",
    mastodon_heading: "Mastodon",
    mastodon_url: "https://mastodon.social/@DanOpcode",
    linkedin_heading: "LinkedIn",
    linkedin_url: "https://linkedin.com/in/DanOpcode",
    blog_url: "https://www.danopcode.com/",
    youtube_heading: "YouTube",
    youtube_url: "https://www.youtube.com/@DanOpcode",
    kalyna_image_alt: "Kalyna (viburnum) flower",
    kalyna_image_src: "/images/kalyna.webp",
    plant_url: "https://sv.wikipedia.org/wiki/Skogsolvon",
    song_url: "https://sv.wikipedia.org/wiki/Ett_r%C3%B6tt_olvon_vid_%C3%A4ngen",
    song_video_url: "https://www.youtube.com/watch?v=EV_vT0Vud5Q",
    full_stop: ".",
    company_registration: "559386-8457",
    company_vat: "SE559386845701"
  }

  @sections [
    {:hero,
     [
       {:image, :logo_alt, :logo_src},
       {:heading, 1, [:company_name]},
       {:paragraph, [:tagline]},
       {:paragraph, [{:link, :contact_fragment, [:contact_heading]}]},
       {:paragraph, [{:link, :about_fragment, [:learn_more_label]}]}
     ]},
    {:about,
     [
       {:image, :portrait_alt, :portrait_one_src},
       {:heading, 2, [:about_heading]},
       {:paragraph, [:about_background]},
       {:paragraph, [:about_approach]}
     ]},
    {:expertise,
     [
       {:heading, 2, [:expertise_heading]},
       {:heading, 3, [:roles_heading]},
       {:list, [[:team_leader_role], [:lead_developer_role], [:developer_role]]},
       {:heading, 3, [:areas_heading]},
       {:list, [[:fullstack_area], [:backend_area], [:devops_area]]},
       {:heading, 3, [:platforms_heading]},
       {:list, [[:linux_platform], [:windows_platform], [:web_platform]]}
     ]},
    {:daily_diff,
     [
       {:heading, 2, [:projects_heading]},
       {:heading, 3, [:daily_diff_name]},
       {:paragraph, [:daily_diff_tagline]},
       {:paragraph, [:daily_diff_description]},
       {:paragraph, [{:link, :daily_diff_url, [:daily_diff_read_label]}]},
       {:paragraph,
        [{:link, :daily_diff_url, [{:image, :daily_diff_image_alt, :daily_diff_image_src}]}]}
     ]},
    {:experience, :experience},
    {:testimonial,
     [
       {:heading, 2, [:testimonial_heading]},
       {:quote, [:testimonial_quote]},
       {:paragraph, [:testimonial_attribution]}
     ]},
    {:personal,
     [
       {:image, :portrait_alt, :portrait_two_src},
       {:heading, 2, [:personal_heading]},
       {:paragraph, [:personal_background]},
       {:heading, 3, [:interests_heading]},
       {:list,
        [[:finance_interest], [:self_hosting_interest], [:elixir_interest], [:health_interest]]}
     ]},
    {:network,
     [
       {:image, :kvadrat_logo_alt, :kvadrat_logo_src},
       {:heading, 2, [:network_heading]},
       {:paragraph, [:network_description]},
       {:paragraph, [{:link, :kvadrat_profile_url, [:kvadrat_profile_label]}]}
     ]},
    {:contact,
     [
       {:heading, 2, [:contact_heading]},
       {:paragraph, [:contact_description]},
       {:heading, 3, [:email_heading]},
       {:paragraph, [{:link, :email_url, [:email_address]}]},
       {:heading, 3, [:phone_heading]},
       {:paragraph, [{:link, :phone_url, [:phone_number]}]},
       {:heading, 3, [:mastodon_heading]},
       {:paragraph, [{:link, :mastodon_url, [:mastodon_label]}]},
       {:heading, 3, [:linkedin_heading]},
       {:paragraph, [{:link, :linkedin_url, [:linkedin_label]}]}
     ]},
    {:community,
     [
       {:heading, 2, [:community_heading]},
       {:heading, 3, [:blog_heading]},
       {:paragraph, [:blog_description]},
       {:paragraph, [{:link, :blog_url, [:blog_label]}]},
       {:heading, 3, [:youtube_heading]},
       {:paragraph, [:youtube_description]},
       {:paragraph, [{:link, :youtube_url, [:youtube_label]}]}
     ]},
    {:about_kalyna,
     [
       {:image, :kalyna_image_alt, :kalyna_image_src},
       {:heading, 2, [:kalyna_heading]},
       {:paragraph,
        [
          :kalyna_intro,
          " ",
          {:link, :plant_url, [:plant_link_label]},
          :kalyna_symbolism,
          {:link, :song_url, [:song_link_label]},
          :song_history,
          " ",
          {:link, :song_video_url, [:song_video_label]},
          :full_stop
        ]}
     ]},
    {:company_information,
     [
       {:heading, 2, [:company_heading]},
       {:paragraph, [:legal_name_label, " ", :company_name]},
       {:paragraph, [:registration_label, " ", :company_registration]},
       {:paragraph, [:vat_label, " ", :company_vat]},
       {:paragraph, [:location_label, " ", :company_location]},
       {:paragraph, [:tax_label, " ", :company_tax_status]},
       {:heading, 3, [:availability_heading]},
       {:paragraph, [:onsite_availability]},
       {:paragraph, [:remote_availability]}
     ]}
  ]

  def sections, do: @sections

  def value(key), do: Map.fetch!(@copy, key)

  def copy(lang, key), do: Kalyna.Translations.t(lang, value(key))
end
