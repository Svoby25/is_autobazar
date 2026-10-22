# Registr rizik

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 22. 10. 2026 | Jan Svoboda | První verze. Rizika odvozena ze stavu projektu k 22. 10. a z otevřených bodů zadání. Připraveno s pomocí AI. Podle plánu registr vlastní vedoucí týmu, která ho zkontroluje a doplní. |

## 1. K čemu registr slouží

Registr drží pohromadě to, co může projekt ohrozit, a kdo s tím co udělá. Podle plánu semestru se **reviduje jednou týdně** na schůzce nad kanbanem, vlastníkem je vedoucí týmu.

Riziko se do registru zapisuje, jakmile ho někdo vidí — ne až když nastane. Riziko, které se naplní, se nemaže: přesune se do kapitoly 4 a doplní se, co se s ním skutečně udělalo. Z toho se dá učit a je to i podklad pro obhajobu.

## 2. Stupnice

**Dopad** — co se stane, když riziko nastane:

| Stupeň | Význam |
| --- | --- |
| vysoký | Ohrozí odevzdání milníku nebo znehodnotí hotové artefakty. |
| střední | Vyžádá si přepracování části práce nebo posun termínu. |
| nízký | Zdrží jednotlivce, tým to dožene. |

**Pravděpodobnost** — jak je riziko blízko:

| Stupeň | Význam |
| --- | --- |
| vysoká | Už se to jednou stalo, nebo se to děje právě teď. |
| střední | Stalo by se to, kdyby se nic nezměnilo. |
| nízká | Zatím nic nenasvědčuje, ale je to možné. |

## 3. Rizika

| ID | Riziko | Dopad | Pravd. | Opatření | Vlastník |
| --- | --- | --- | --- | --- | --- |
| R1 | Zákazník nepotvrdí otevřené otázky včas. V katalogu jich je dvanáct, z toho čtyři blokují akceptační kritéria. | vysoký | vysoká | Otázky poslat zákazníkovi v jedné dávce s termínem odpovědi. Do té doby se podle dotčených požadavků nenavrhuje, pracuje se na částech, které na odpovědi nevisí. | Vedoucí |
| R2 | Rozpory v odpovědích zákazníka se vyřeší domyšlením místo doptáním. Platby (OT3), komisní prodej (OT4) a záruka (OT5) si navzájem odporují. | vysoký | střední | Rozporné požadavky mají v katalogu stav *otevřeno* a nesmí z nich vycházet scénář ani model. Kontroluje se při review pull requestu. | Analytik |
| R3 | Práce skončí mimo repozitář — v komentáři, v Teams nebo na disku jednotlivce. Pak chybí v odevzdání a nikdo ji nezkontroloval. | vysoký | vysoká | Návod na odevzdání přes web GitHubu je v README. Na týdenní schůzce se prochází kanban proti otevřeným pull requestům. | Koordinátor |
| R4 | Hotové pull requesty se nesloučí a práce se vrší na nesloučené větve. Čím déle to trvá, tím hůř se to slučuje a tým nevidí v repozitáři aktuální stav. | vysoký | vysoká | Každý pull request má do dvou dnů recenzenta. Nic se nestaví na větev, která čeká na sloučení déle než týden. | Koordinátor |
| R5 | Artefakty se rozejdou — jiný pojem ve slovníku a v modelu, jiné ID požadavku v katalogu a v případu užití. Nekonzistence je nejčastější výtka u milníku. | vysoký | střední | Slovník je závazný, nové pojmy jdou nejdřív do něj. Před každým milníkem proběhne kontrola podle definice „hotovo“ (#19) a matice trasovatelnosti (#28). | Dokumentarista |
| R6 | Skluz před milníkem. Práce se nahromadí na poslední týden a kvalita jde dolů. | vysoký | vysoká | Termíny jsou v issues a milnících na GitHubu. Kdo nestíhá, hlásí to nejpozději 2 dny předem. Na schůzce se přerozdělí. | Koordinátor |
| R7 | Legislativní požadavky L1–L8 doplnil tým z veřejných zdrojů bez právního posouzení. Dva z nich (L4, L5) odporují tomu, co zákazník řekl. | střední | střední | U legislativních požadavků je v katalogu uvedeno, že nejde o právní posouzení. Před M1 je zákazník potvrdí, nebo zůstanou jako otevřené. | Analytik |
| R8 | Práci na artefaktu zná jen jeden člověk. Když vypadne, nikdo neví, proč to je, jak to je, a u obhajoby to neobhájí. | střední | střední | Každý pull request kontroluje druhý člen. Rozhodnutí se zapisují do dokumentu, ne jen do hlavy. U M3 obhajuje každý svou část. | Vedoucí |
| R9 | Výstup AI se dostane do dokumentace jako potvrzený fakt. Pravidla předmětu to zakazují. | střední | střední | U artefaktu připraveného s pomocí AI je to uvedeno v tabulce verzí včetně toho, jak byl ověřen. Co zákazník neřekl, je otevřená otázka, ne tvrzení. | Dokumentarista |
| R10 | Rozsah se rozroste. Zadání má 46 požadavků, z toho 43 v prioritě M. Pokud přibydou další, nestihne se analýza do hloubky. | střední | nízká | Vymezení rozsahu je sepsané a schvaluje ho vedoucí. Změna zadání jde přes change request a analýzu dopadu (#25, #26). | Vedoucí |
| R11 | Obrázek diagramu se rozejde se zdrojem. V odevzdané dokumentaci je pak jiný diagram, než co je v `.puml`. | nízký | střední | Kontrola v CI porovnává každé SVG s jeho zdrojem při každém pull requestu (#38). | Návrhář |
| R12 | Do veřejného repozitáře se dostanou osobní nebo citlivé údaje. | nízký | nízká | Kontrola před milníkem je součástí #19. Jména členů jsou v README vědomě, nic dalšího tam nepatří. | Dokumentarista |

## 4. Rizika, která se už naplnila

| ID | Co se stalo | Co s tím bylo | Poučení |
| --- | --- | --- | --- |
| R3 | Slovník pojmů (#6) a vymezení rozsahu (#7) skončily jako přílohy v komentářích u issues. Tři lidé, tři soubory, z toho dva v `.xlsx`. | Soubory byly převzaty do repozitáře v #44 a #45, autoři uvedeni jako spoluautoři. Do README přibyl návod, jak odevzdat práci přes web bez gitu (#47). | Postup musí být popsaný pro toho, kdo git nezná. Samotné pravidlo „pracujeme přes pull requesty“ nestačí. |
| R4 | Pull request #3 se strukturou repozitáře a zadáním čekal na sloučení od 8. do 22. října. Mezitím na jeho větev navázalo pět dalších. Kdo si repozitář naklonoval, viděl jediný soubor. | Navazující pull requesty byly sloučeny do větve #3 ve správném pořadí, aby je nezavřelo smazání větve. | Prázdný `main` je nejspíš důvod, proč lidé posílali práci do komentářů — neměli ji kam dát. |
| R6 | Akceptační kritéria (#5) a registr rizik (#33) nebyly hotové v termínu, úkoly z týdnů 3 a 4. | Doplněny 22. 10. v #48 a v tomto dokumentu. | Úkol bez řešitele se neudělá. Rozdělení rolí (#34) bylo hotové až po termínu obou úkolů. |
| R11 | SVG u Use Case diagramu neodpovídalo svému `.puml` — rozměry 1320×2705 proti 1437×2661. | Obrázek přegenerován před sloučením #43. | Kontrola v CI (#38) tohle chytí sama, jen v té chvíli ještě nebyla ve větvi. |

## 5. Jak se registr reviduje

Jednou týdně na schůzce, jako součást týdenního statusu:

1. Projít rizika a u každého rozhodnout, jestli pravděpodobnost nebo dopad stoupl, nebo klesl.
2. Zkontrolovat, že opatření někdo skutečně dělá. Opatření, které nikdo nedělá, je potřeba změnit, ne nechat napsané.
3. Doplnit nová rizika, která se za týden ukázala.
4. Riziko, které se naplnilo, přesunout do kapitoly 4 a dopsat, co s tím bylo.
5. Zvýšit verzi dokumentu.
