defmodule Kalyna.PortfolioContent do
  @moduledoc "Portfolio copy and document structure shared by HTML components and Markdown output."

  @copy %{
    theme_label: "Tema",
    light_label: "Ljust",
    dark_label: "Mörkt",
    logo_alt: "Kalyna Solutions AB logga",
    tagline:
      "Jag är Daniel Jonsson, systemutvecklare och konsult genom Kalyna Solutions AB i Stockholm. Jag hjälper företag med fullstack-utveckling, DevOps och teknisk teamledning, på plats i Stockholmsområdet eller på distans.",
    contact_heading: "Kontakta mig",
    portrait_alt: "Daniel Jonsson",
    leadership_heading: "Vem håller ihop det tekniska?",
    leadership_problem:
      "I ett litet produktteam är det ofta samma personer som ska bygga nästa version, stötta kollegorna och fatta beslut om hur systemet ska utvecklas. När nästa leverans tar all tid blir de större teknikfrågorna lätt liggande. Under tiden behöver teamet bygga vidare på beslut som ännu inte är fattade.",
    leadership_offer:
      "Jag går in i teamet och tar ansvar för att reda ut de frågorna och få besluten på plats. Tillsammans med er avgör jag vad som behöver lösas nu, vad som kan vänta och hur vi delar upp arbetet. Sedan är jag med och bygger. Beroende på var teamet behöver mig kan jag jobba med allt från arkitektur och utveckling till tester och driftsättning.",
    leadership_contact: "Prata med mig om ert team",
    leadership_example_heading: "Exempel från Consilium",
    leadership_example:
      "Jag tog fram arkitekturen för ett konfigurationsverktyg, höll i kunddialogen och byggde stora delar av verktyget tillsammans med teamet. Jag var med från förstudien till överlämningen.",
    leadership_example_link: "Läs om uppdraget hos Consilium",
    leadership_example_fragment: "#company-11",
    about_heading: "Om Daniel Jonsson",
    about_background:
      "Jag är en systemutvecklare med 11+ års erfarenhet av mjukvaruutveckling professionellt inom flera programmeringsspråk. Framförallt har jag arbetat med C#/.NET, men har även gedigen erfarenhet av JavaScript, C++, Python, Swift, HTML och CSS. Jag började programmera som nioåring och har en civilingenjörsexamen i informationsteknik från Chalmers tekniska högskola. Plattformarna som jag har arbetat professionellt med är Windows, Linux, webben, iOS och inbyggda system.",
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
      "Jag är gift och pappa till två döttrar. Varje år reser vi till Ukraina för att besöka min frus familj. Som DanOpcode skriver jag och gör videor om mjukvaruutveckling, Linux, öppen källkod och hur man driver egna tjänster.",
    interests_heading: "Personliga intressen",
    finance_interest: "Sparande och finans",
    self_hosting_interest: "Self-hosting, Linux och öppen källkod",
    elixir_interest: "Funktionell programmering (Elixir) och AI-driven utveckling",
    health_interest: "Löpning, träning och hälsa",
    kvadrat_logo_alt: "Kvadrat logga",
    network_heading: "Del av Kvadrat",
    network_description:
      "Medlem i Kvadrat – Sveriges största nätverk av egenföretagare som hjälper företag och organisationer till förändring, med spetskonsulter inom systemutveckling, digitalisering, informationshantering, ledning, organisations- och verksamhetsutveckling.",
    kvadrat_profile_label: "Se min profil hos Kvadrat",
    contact_description:
      "Har du några behov, tankar eller idéer? Du får gärna kontakta mig oavsett anledning.",
    email_heading: "E-post",
    phone_heading: "Telefon",
    gpg_heading: "Publik GPG-nyckel",
    gpg_fingerprint_label: "Fingeravtryck",
    mastodon_label: "Följ mig på Mastodon",
    linkedin_label: "Se min LinkedIn-profil",
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
    kvadrat_profile_url: "https://anlita.kvadrat.se/daniel-jonsson",
    email_url: "mailto:daniel@kalyna.se",
    email_address: "daniel@kalyna.se",
    phone_url: "tel:+46707329868",
    phone_number: "+46 70 732 98 68",
    signal_heading: "Signal",
    signal_username: "DanOpcode.01",
    telegram_heading: "Telegram",
    telegram_username: "@DanOpcode",
    telegram_url: "https://t.me/DanOpcode",
    gpg_fingerprint: "B94F 1E82 15E4 0860 4E02 B35E D724 EEFE D54E 4E35",
    gpg_openpgp_label: "keys.openpgp.org",
    gpg_openpgp_url:
      "https://keys.openpgp.org/vks/v1/by-fingerprint/B94F1E8215E408604E02B35ED724EEFED54E4E35",
    gpg_ubuntu_label: "Ubuntu",
    gpg_ubuntu_url:
      "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xB94F1E8215E408604E02B35ED724EEFED54E4E35",
    gpg_mailvelope_label: "Mailvelope",
    gpg_mailvelope_url:
      "https://keys.mailvelope.com/pks/lookup?op=get&search=0xB94F1E8215E408604E02B35ED724EEFED54E4E35",
    mastodon_heading: "Mastodon",
    mastodon_url: "https://mastodon.social/@DanOpcode",
    linkedin_heading: "LinkedIn",
    linkedin_url: "https://linkedin.com/in/DanOpcode",
    github_url: "https://github.com/DanOpcode",
    x_url: "https://x.com/DanOpcode",
    blog_url: "https://www.danopcode.com/",
    youtube_heading: "YouTube",
    youtube_url: "https://www.youtube.com/@DanOpcode",
    kalyna_image_alt: "Skogsolvon i blom",
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
       {:paragraph, [{:link, :contact_fragment, [:contact_heading]}]}
     ]},
    {:leadership,
     [
       {:heading, 2, [:leadership_heading]},
       {:paragraph, [:leadership_problem]},
       {:paragraph, [:leadership_offer]},
       {:paragraph, [{:link, :contact_fragment, [:leadership_contact]}]},
       {:heading, 3, [:leadership_example_heading]},
       {:paragraph, [:leadership_example]},
       {:paragraph, [{:link, :leadership_example_fragment, [:leadership_example_link]}]}
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
       {:heading, 4, [:gpg_heading]},
       {:paragraph, [:gpg_fingerprint_label, ": ", :gpg_fingerprint]},
       {:list,
        [
          [{:link, :gpg_openpgp_url, [:gpg_openpgp_label]}],
          [{:link, :gpg_ubuntu_url, [:gpg_ubuntu_label]}],
          [{:link, :gpg_mailvelope_url, [:gpg_mailvelope_label]}]
        ]},
       {:heading, 3, [:phone_heading]},
       {:paragraph, [{:link, :phone_url, [:phone_number]}]},
       {:heading, 3, [:linkedin_heading]},
       {:paragraph, [{:link, :linkedin_url, [:linkedin_label]}]},
       {:heading, 3, [:signal_heading]},
       {:paragraph, [:signal_username]},
       {:heading, 3, [:telegram_heading]},
       {:paragraph, [{:link, :telegram_url, [:telegram_username]}]},
       {:heading, 3, [:mastodon_heading]},
       {:paragraph, [{:link, :mastodon_url, [:mastodon_label]}]}
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
