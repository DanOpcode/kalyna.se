defmodule Kalyna.Experience do
  @moduledoc "Portfolio experience content. Strings are Swedish translation keys."

  def companies do
    [
      %{
        id: "company-1",
        name: "Carmenta",
        url: "https://carmenta.com/",
        summary: "DevOps • 2026–pågående",
        logo: %{
          src: "/images/company_logo_carmenta.svg",
          width: 512,
          height: 94,
          alt: "Carmenta logga",
          fill: false,
          monochrome: false
        },
        description: nil,
        projects: [
          %{
            title: nil,
            assignment: "Jag arbetar med DevOps hos Carmenta.",
            benefit: "Jag bidrar med erfarenhet inom mjukvaruutveckling och DevOps.",
            technologies: [
              ".NET",
              "C#",
              "Docker",
              "Linux",
              "Windows"
            ]
          }
        ]
      },
      %{
        id: "company-2",
        name: "Integritetsskyddsmyndigheten",
        url: nil,
        summary: "DevOps • Konsultuppdrag • 2024–2026",
        logo: %{
          src: "/images/company_logo_imy.svg",
          width: 1567,
          height: 284,
          alt: "IMY logga",
          fill: false,
          monochrome: false
        },
        description: nil,
        projects: [
          %{
            title: nil,
            assignment:
              "Utvecklare hos Integritetsskyddsmyndigheten (IMY), där jag arbetade med DevOps-pipelines, applikationsinfrastruktur och releasehantering. I ett tvärfunktionellt team byggde vi diverse applikationer tillsammans.",
            benefit:
              "Jag driver förbättringar i våra utvecklingsprocesser genom att optimera Azure DevOps-arbetsflöden och bidra med viktiga tekniska beslut. Min roll innefattar även programmering i C# och .NET, deltagande i kodgranskningar och dialog med folk ur verksamheten.",
            technologies: [
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
        ]
      },
      %{
        id: "company-3",
        name: "Re:it",
        url: nil,
        summary: "Lead-utvecklare • Konsultuppdrag • 2023–pågående",
        logo: %{
          src: "/images/company_logo_reit.svg",
          width: 161,
          height: 59,
          alt: "Re:it logga",
          fill: false,
          monochrome: true
        },
        description: nil,
        projects: [
          %{
            title: nil,
            assignment:
              "Senior utvecklare i ett tvärfunktionellt team med 6 st kollegor, varav 2 st är programmerare. Tillsammans utvecklar vi ett webbaserat ärendehanteringssystem där både externa användare och handläggare kan logga in.",
            benefit:
              "Jag bidrar till projektet genom att arbeta nära koden, vara med i de beslut som tas gällande implementationen, och stötta mina programmerarkollegor. Jag deltar även tillsammans med teamets arkitekt i möten med andra parter gällande integration med de andra parternas system.",
            technologies: [
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
        ]
      },
      %{
        id: "company-4",
        name: "Altero Consulting",
        url: nil,
        summary: "Systemutvecklare • Konsultuppdrag • 2022–2025",
        logo: %{
          src: "/images/company_logo_altero.webp",
          width: 429,
          height: 223,
          alt: "Altero Consulting logga",
          fill: false,
          monochrome: false
        },
        description: nil,
        projects: [
          %{
            title: nil,
            assignment: "Utveckla en lösning som sammanställer data till ett datalager.",
            benefit:
              "Jag arbetade tillsammans med en projektledare i ett projekt där vi tog fram en lösning som automatiskt sammanställer data från databastabeller och Excel-filer till ett datalager. Detta resulterade i att kunden bland annat kan dra större affärsnytta från sin data. Jag jobbade självständigt med mycket kontakt med slutanvändarna för att ta emot feedback och iterativt implementera förbättringar.",
            technologies: [
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
        ]
      },
      %{
        id: "company-5",
        name: "IdAgree",
        url: nil,
        summary: "Systemutvecklare • Medgrundare • 2024–2024",
        logo: %{
          src: "/images/company_logo_idagree.webp",
          width: 200,
          height: 200,
          alt: "IdAgree logga",
          fill: false,
          monochrome: false
        },
        description: nil,
        projects: [
          %{
            title: nil,
            assignment:
              "Som medgrundare i ett startup-företag, utvecklade jag en prototyp av en tjänst för att skapa kvitton för secondhand-köp.",
            benefit:
              "Jag byggde en webbtjänst från grunden och satte upp både produktionsmiljön och kontinuerlig driftsättning dit. Jag arbetade tillsammans med företagets andra grundare, implementerade funktioner enligt deras önskemål och feedback, samt utvecklade en integration med en tredjepartstjänst för att signera PDF-filer.",
            technologies: [
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
        ]
      },
      %{
        id: "company-6",
        name: "Carnegie Investment Bank",
        url: nil,
        summary: "Systemutvecklare, scrum-master • Anställd • 2021–2022",
        logo: %{
          src: "/images/company_logo_carnegie.svg",
          width: 320,
          height: 112,
          alt: "Carnegie Investment Bank logga",
          fill: false,
          monochrome: false
        },
        description: nil,
        projects: [
          %{
            title: nil,
            assignment:
              "Vidareutveckling av integration mellan back office- och börshandelssystem, samt av system som används internt av mäklare för hantering av kunders värdepappersportföljer, i ett team med totalt 4-5 st utvecklare.",
            benefit:
              "Daniel var både systemutvecklare och scrum master, och representerade teamet i Scrum of Scrums- och arkitekturmöten. Han hjälpte till med att leverera teamets system under ett back office-systembyte på ett lyckat sätt. Daniel vidareutvecklade därefter teamets applikationer och mikrotjänster. Förutom nya funktioner, migrerade han teamets kodbaser från .NET Core 3.1 till .NET 6, och införde körning av enhetstester och automatisk uppdatering av databaserna i CI/CD-pipeline:n. Han hjälpte ofta till med kodgranskning, skriva release notes och deploya nya versioner av mikrotjänsterna. Han löste också ofta akuta problem som användarna stötte på. Både Daniels teamledare och chef uppskattade hur han alltid tog för sig bland arbetsuppgifterna och gärna var inne i alla delar.",
            technologies: [
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
        ]
      },
      %{
        id: "company-7",
        name: "Cellink",
        url: nil,
        summary: "Teamledare, systemutvecklare • Konsultuppdrag • 2019–2021",
        logo: %{
          src: "/images/company_logo_cellink.svg",
          width: 1512,
          height: 319,
          alt: "Cellink logga",
          fill: false,
          monochrome: false
        },
        description: nil,
        projects: [
          %{
            title: "Teamledare",
            assignment:
              "Teamledare för 6 st kollegor som arbetade med utveckling i WPF, AWS och Flutter. Daniels team utvecklade det grafiska gränssnittet till deras då kommande produkt CELLCYTE X, som är ett mikroskop som forskare kan schemalägga till att ta foton av cellprover.",
            benefit:
              "I rollen arbetade Daniel tillsammans med produktägaren med att bryta ner förfrågningar på nya funktioner till tekniska krav. Han gjorde grövre tidsestimat, förberedde arbete genom att designa grafiska gränssnitt och undanröjde hinder för teamet. Han stöttade sina kollegor, planerade och delade ut arbetsuppgifter, samt testade och kodgranskade vad de gjort. Daniel ansvarade för nya releaser av mjukvaran. Han samarbetade med teamledaren för embedded-systemet och de designade tillsammans API:er för systemen. Daniel reproducerade och lokaliserade även buggar från testarna. Han gjorde också viss utveckling själv. Vidare så hade han kontakt med säljare och installatörer för att ge teknisk support och ta emot feedback.",
            technologies: [
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
          },
          %{
            title: "Systemutvecklare .NET",
            assignment:
              "Från grunden bygga en Windows-applikation, i ett team med 2-7 st utvecklare, för deras då kommande produkt CELLCYTE X, som är ett mikroskop som forskare kan schemalägga till att ta foton av cellprover.",
            benefit:
              "Daniel byggde tillsammans med sina kollegor från grunden en Windows-baserad WPF-applikation. Som insatt i hur mikroskopets inbyggda system fungerade, så kunde han onboarda kollegor in i teamet och bidra till integrationen. I.o.m. att teamet varierade mycket i storlek så var Daniel en viktig person för projektet. Daniel tog även mycket ansvar för releaser av mjukvaran. Han arbetade också med att implementera automatiska tester i form av enhets- och GUI-tester.",
            technologies: [
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
          },
          %{
            title: "Systemutvecklare C++",
            assignment:
              "Vidareutveckla tillsammans med 2 st kollegor ett inbyggt (embedded) system i deras då kommande produkt CELLCYTE X, som är ett mikroskop som forskare kan schemalägga till att ta foton av cellprover.",
            benefit:
              "Daniel arbetade med det inbyggda systemet som körde Linux (ARM) och var byggt med Yocto. Han vidareutvecklade en C++17-applikation där den mesta av logiken fanns. Bland annat implementerade han persistering av experimentdata i en SQLite-databas med stöd för automatiska uppdateringar av databasschemat. Daniel arbetade även med funktionalitet som var implementerad i Python-skript. Samt arbetade han med kalibrering av hårdvaran och gjorde ändringar i dess 3D-skrivarmjukvara som var skriven i C och baserad på Marlin Firmware. I teamet arbetade de testdrivet med krav på hög nivå av kodtäckning av enhetstester.",
            technologies: [
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
        ]
      },
      %{
        id: "company-8",
        name: "Avarn Security",
        url: nil,
        summary: "Väktare • Behovsanställd • 2020–2021",
        logo: %{
          src: "/images/company_logo_avarn.webp",
          width: 264,
          height: 72,
          alt: "AVARN Security logga",
          fill: false,
          monochrome: false
        },
        description:
          "Behovsanställd som väktare. Planerarna på Avarn kunde ringa och erbjuda mig pass när de var i behov av personal, vilket innebar att mina uppgifter kunde skilja sig från ett pass till ett annat. Som exempel så har jag jobbat natt utanför ambulansinfarten till akuten på ett sjukhus, jobbat natt på ett utomhusbad och på en byggarbetsplats, jobbat kvällspass i shoppingcentrum, och vaktat utanför ett förvar under dagtid.",
        projects: []
      },
      %{
        id: "company-9",
        name: "Lab Gruppen",
        url: nil,
        summary: "Systemutvecklare • Konsultuppdrag • 2020–2020",
        logo: %{
          src: "/images/company_logo_labgruppen.webp",
          width: 1809,
          height: 155,
          alt: "Lab Gruppen logga",
          fill: false,
          monochrome: false
        },
        description: nil,
        projects: [
          %{
            title: nil,
            assignment:
              "Daniel och 2 st kollegor hjälpte kunden med att porta en mjukvarulösning för ett inbyggt system utvecklad i C och assembler till att fungera på en annan hårdvaruplattform med en annan DSP (signalprocessor).",
            benefit:
              "Daniel utvecklade möjligheten att kunna föra över konfigurationsdata från Linux (ARM-processorkärna) till DSP:ns processorkärna, vilket gjorde det möjligt att styra saker som ljudvolym och equalizer-inställningar.",
            technologies: [
              "C",
              "Linux",
              "realtidsoperativsystem",
              "Jira",
              "Eclipse",
              "agila metoder (Kanban)"
            ]
          }
        ]
      },
      %{
        id: "company-10",
        name: "Mentice",
        url: nil,
        summary: "Lead-utvecklare • Konsultuppdrag • 2017–2019",
        logo: %{
          src: "/images/company_logo_mentice.svg",
          width: 1529,
          height: 253,
          alt: "Mentice logga",
          fill: true,
          monochrome: false
        },
        description: nil,
        projects: [
          %{
            title: "iOS-app",
            assignment:
              "Utveckla en iPad-app för demonstration av kliniska instrument för endovaskulär kirurgi. Till en början var Daniel ensam iOS-utvecklare i projektet, och i 2 st uppföljningsprojekt var han lead-utvecklare för 2 st kollegor.",
            benefit:
              "Daniel implementerade en simulering av en operation med 3D-modeller av kirurgiska instrument. Han integrerade även stöd för att använda ett fysiskt instrument till att genomföra utvalda moment under operationen, där instrumentet kommunicerade med iPaden via Bluetooth (BLE). Projektet mottogs väl av kunden och ledde till 2 st uppföljningsprojekt, i vilka Daniel var lead-utvecklare tillsammans med 2 st kollegor.",
            technologies: [
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
          },
          %{
            title: "Webb-app",
            assignment:
              "Daniel var lead-utvecklare i ett team tillsammans med 2 st utvecklare, där han planerade och tillsammans med dem implementerade en ny version av en webbapplikation där läkare kunde starta övningar i en kirurgisimulator och se resultat från tidigare övningstillfällen. I den nya versionen implementerade de stöd för mer avancerad metrikinsamling, jämförelse av resultaten mot benchmarks, flerspråksstöd, samt möjligheten att kunna konfigurera simulatorövningarna.",
            benefit:
              "Daniel deltog i hela kedjan, från krav till implementation. I början av projektet formulerade Daniel arbetspaket och tidsestimat, ritade GUI-mockups och gjorde ER-diagram över den nya databasmodellen. Kunden var nöjd med planen, och därefter utförde Daniel också en stor del av implementationen tillsammans med sina 2 st kollegor. Han jobbade med både backend och frontend, och hade regelbundet möten med kunden för att ta emot feedback. Kunden var i slutet av projektet väldigt nöjd med resultatet.",
            technologies: [
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
        ]
      },
      %{
        id: "company-11",
        name: "Consilium Marine & Safety",
        url: nil,
        summary: "Teamledare, lead-utvecklare, systemutvecklare • Konsultuppdrag • 2016–2020",
        logo: %{
          src: "/images/company_logo_consilium.svg",
          width: 187,
          height: 32,
          alt: "Consilium Marine & Safety logga",
          fill: true,
          monochrome: false
        },
        description: nil,
        projects: [
          %{
            title: "Windows-baserat konfigurationsprogram",
            assignment:
              "Teamledare för 2 st kollegor i ett projekt där Daniel planerade och utförde en omskrivning av ett konfigurationsprogram som användes till att konfigurera övervakningssystem som upptäcker gasläckage ombord på fraktfartyg.",
            benefit:
              "Daniel deltog i hela kedjan, från krav till implementation. Daniel utförde en förstudie innefattande formuleringar av arbetspaket, tidsestimat och GUI-mockups. Daniel var därefter ansvarig för arkitekturen av mjukvaran, kommunikation med kunden och mycket av implementationen. Daniel fördelade ut arbetsuppgifter till sina kollegor, och testade och kodgranskade vad de utvecklat. Övervakningssystemet hade sin egen parser i C++ för att packa och läsa konfigurationsdata, som Daniel integrerade i C#/WPF-applikationen. Vidare så arbetade Daniel testdrivet med hjälp av automatiska tester i form av enhets- och GUI-tester. Slutligen stod Daniel även för överlämningen när Consilium tog över underhållet av applikationen.",
            technologies: [
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
          },
          %{
            title: "Windows-baserat brandlarmshanteringssystem",
            assignment:
              "Ensamt ansvarig för underhåll och vidareutveckling av en stor Windows-applikation hos Consilium som kördes på bryggan på fartyg. Applikationen visualiserade alla branddetektorer ombord på fartygets däck och deras statusar.",
            benefit:
              "Daniel implementerade ny funktionalitet, förbättrade användargränssnittet och prestandan, löste buggar och bidrog med teknisk support. Applikationens gränssnitt var byggd med C# och WPF, medan lagret som kommunicerade med brandsystemen var byggd med C++. Daniel vidareutvecklade också en simulator som användes till att spela upp och simulera trafik från ett brandsystem, vilket var användbart vid testning och demonstration av applikationen. Kunden uppskattade stort Daniels hjälp vid behov även på kvällar och helger. Applikationen hade en gammal föregångare (byggd i C++ med MFC och Visual C++ 6) som fortfarande användes på en del fartyg som Daniel också hjälpte till att buggfixa vid behov.",
            technologies: [
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
          },
          %{
            title: "Webbaserat produktlivscykelsystem",
            assignment:
              "Ensamt ansvarig för underhåll och vidareutveckling av Consiliums instans av Aras Innovator, som är ett PLM-system som används till deras produkter inom brand- och gassäkerhet. I PLM-systemet fanns produkternas komponenter, dokument, ändringshistorik och mjukvara dokumenterat.",
            benefit:
              "Arbetet var på både frontend- och backend-nivå, och Daniel utvecklade nya funktioner relaterade till presentation av data, export av data och behörighetsnivåer. Daniel utförde också uppdateringar av Aras Innovator till nya versioner.",
            technologies: [
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
        ]
      },
      %{
        id: "company-12",
        name: "Ericsson",
        url: nil,
        summary: "Systemutvecklare • Anställd • 2015–2016",
        logo: %{
          src: "/images/company_logo_ericsson.svg",
          width: 214,
          height: 45,
          alt: "Ericsson logga",
          fill: false,
          monochrome: false
        },
        description: nil,
        projects: [
          %{
            title: nil,
            assignment:
              "Ensamt ansvarig för att porta en avancerad Excel-arbetsbok med cirka 30 länkade arbetsblad till Python. Arbetsboken uppskattade belastningen på företagets servrar givet en mobiloperatörs trafiklast, vilket användes för att skapa underlag till offerter till dem.",
            benefit:
              "Daniel jobbade självständigt med portningsarbetet. Samtidigt implementerade han mer avancerad modellering som inte var möjlig att implementera i Excel. Han byggde även ett grafiskt webbaserat gränssnitt.",
            technologies: [
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
        ]
      }
    ]
  end
end
