# Slovník pojmů

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 22. 10. 2026 | Dokumentarista (JanotkaSim), Analytik (alesmares) | První verze. Sloučeny dva nezávislé návrhy slovníku z issue #6. Zdroje sjednoceny s konvencí [katalogu požadavků](katalog-pozadavku.md), odkazy Q1–Q29 přečíslovány na O1–O29. Sloučení provedeno s pomocí AI, obsah pojmů pochází od autorů výše. |

## 1. Účel a pravidla

Slovník je závazný seznam pojmů pro všechny artefakty. Co je tady, se jinde nesmí nazývat jinak. Synonyma se nezavádějí — pokud se objeví nový pojem, patří nejdřív sem.

Sloupce mají stejný význam jako v [katalogu požadavků](katalog-pozadavku.md):

- **Zdroj** říká, odkud definice pochází:
  - *PZ* = [původní zadání](../02-zadani/zadani-puvodni.md),
  - *O1–O29* = odpověď zákazníka se stejným číslem v [otázkách a odpovědích](../02-zadani/otazky-a-odpovedi.md),
  - *F/N/L* = požadavek v [katalogu](katalog-pozadavku.md),
  - *kap.* = kapitola [zadání v1.0](../02-zadani/zadani-v1.0.md),
  - *Tým* = doplnil tým.
- **Stav** říká, nakolik je pojem ověřený:
  - **potvrzeno** – zákazník to řekl nebo napsal,
  - **částečně** – jádro potvrdil zákazník, detail doplnil tým,
  - **předpoklad** – odvodil tým, zákazník zatím nepotvrdil,
  - **otevřeno** – pojem je v rozporu s odpovědí zákazníka nebo chybí rozhodnutí; odkazuje na otevřenou otázku (OT) v katalogu.

V týdnu 7 se slovník sjednotí s modelem tříd (#17).

## 2. Vozidlo a jeho identifikace

| Pojem | Definice | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- |
| Vozidlo | Automobil evidovaný v systému. Záznam lze založit ještě před fyzickým přivezením. | PZ, F1–F3, O3, O4 | potvrzeno | |
| VIN | Jedinečné sedmnáctimístné identifikační číslo vozidla. Hlavní identifikátor vozidla v systému. | F1 | potvrzeno | |
| SPZ | Státní poznávací (registrační) značka. Vozidlo ji nemusí mít, například při dovozu ze zahraničí. | F1 | potvrzeno | |
| Hrubý technický stav | Stručné orientační zhodnocení stavu vozidla při jeho založení. | PZ, F1 | potvrzeno | Liší se od podrobného technického stavu v nabídce a předávacím protokolu. |
| Technický stav | Popis stavu vozidla ve veřejné nabídce. Při předání se dokládá předávacím protokolem a odkazem na doklad STK. | F1, F15, L6, O3, O4, O28 | částečně | Požadovaná podrobnost evidence není potvrzená. |
| Tachometr | Stav najetých kilometrů. Zapisuje se do předávacího protokolu. | L6 | potvrzeno | |
| Náklady | Výdaje evidované u vozidla: oprava, převoz, příprava. | F4, O2 | potvrzeno | |

## 3. Typy prodeje a ceny

| Pojem | Definice | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- |
| Vlastní vozidlo | Vozidlo, které autobazar koupil a je jeho majitelem. | PZ, F6, O5 | potvrzeno | |
| Komisní prodej | Prodej vozidla cizího majitele, za který autobazar dostane marži. Vozidlo mu nepatří. Sjednává se minimální prodejní cena. | PZ, F6, F8, O5 | otevřeno | Zákazník chce informaci o komisi sdělit až při prohlídce (O27), zadání ji požaduje už v nabídce. Viz OT4 a L4. |
| Komitent | Majitel vozidla v komisním prodeji, který ho autobazaru svěřil k prodeji. | F8, L4 | částečně | Pojem pochází ze zadání, zákazník ho v odpovědích nedefinuje. |
| Protiúčet | Vozidlo zákazníka přijaté jako část platby za jiné vozidlo. Zakládá se jako nové vozidlo napojené na původní prodej. | PZ, F6, F9, O5 | částečně | Napojení na původní prodej navrhl tým. Není potvrzeno, kdy se vozidlo stává majetkem autobazaru. |
| Výkupní cena | Cena, za kterou autobazar vozidlo vykoupil. Sjednává ji obchodník nebo majitel, schvaluje majitel nebo seniorní obchodník. | F1, F7, O3 | částečně | Vztah k pojmu „nákupní cena“ není vyjasněn. |
| Nákupní cena | Označení používané v kapitole 3 a v N7 vedle výkupní ceny. | kap. 3, N7 | otevřeno | Je to totéž co výkupní cena, nebo se liší u komise a protiúčtu? Nutno potvrdit a jeden z pojmů zrušit. |
| Cena protiúčtu | Hodnota, za kterou autobazar přijímá staré vozidlo zákazníka. Schvaluje ji majitel nebo seniorní obchodník. | F9 | potvrzeno | |
| Minimální prodejní cena | Spodní hranice stanovená komitentem u komisního prodeje. Systém nedovolí prodej pod ní. | F8, O3, O5 | částečně | Blokaci prodeje pod minimální cenou odvodil tým. |
| Pořizovací cena | Skutečná cena vozidla: výkupní cena plus všechny evidované náklady. | F4 | potvrzeno | |
| Marže | Rozdíl mezi prodejní a pořizovací cenou. U komisního prodeje jde o provizi autobazaru. | F4, F8, O2, O5 | částečně | Způsob výpočtu marže u komisního prodeje není popsán. |
| Sleva | Snížení prodejní ceny. Smí ji poskytnout jen seniorní obchodník nebo majitel, každá se zaznamená. | F25 | potvrzeno | |
| Úvěr | Splátkový prodej, který autobazar zprostředkovává. Spouští přísnější povinnosti podle AML. | F24, L2, O26 | potvrzeno | |

## 4. Zájemci, rezervace a domluvy

| Pojem | Definice | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- |
| Zájemce | Osoba, která projevila zájem o konkrétní vozidlo, ale zatím nekoupila. | PZ, F10, F12, O6, O7 | potvrzeno | Není určeno, kdy se zájemce stává zákazníkem. |
| Zákazník | Osoba, se kterou autobazar jedná o prohlídce, zkušební jízdě nebo prodeji. | kap. 2, F17, F21, O8, O14 | otevřeno | Není určeno, zda pojem zahrnuje každého zájemce. Nutno používat jednotně a odlišit od zájemce. |
| Domluva | Jakákoli dohoda se zájemcem: prohlídka, zkušební jízda, podržení, záloha, podpis. Eviduje se, kdo ji sjednal a kdy. | PZ, F10, O6 | potvrzeno | |
| Podržení | Slib, že vozidlo je drženo pro konkrétního zájemce po individuálně sjednanou dobu. Po jejím uplynutí systém upozorní a nabídne vozidlo dalšímu v pořadí. | PZ, F10, F11, F13, O6 | otevřeno | Vztah k rezervaci a záloze není vyjasněn. Viz OT12. |
| Rezervace | Stav, kdy je vozidlo rezervováno pro jednoho zájemce. Platnou rezervaci má vždy nejvýše jeden zájemce, ostatní čekají v pořadí. | PZ, F12, F16, O7 | otevřeno | Pravděpodobně jde o stav odpovídající podržení (akce vs. stav). Viz OT12. |
| Pořadí zájemců | Fronta dalších zájemců o vozidlo, které je už rezervované. | PZ, F12, F13, O7 | potvrzeno | |
| Záloha | Platba přijatá předem v souvislosti s prodejem vozidla. | F10, F24, O6, O13 | otevřeno | Není určeno, zda její přijetí automaticky zakládá rezervaci. Viz OT12. |
| Zkušební jízda | Jízda zájemce s vozidlem. Eviduje se datum, čas, vozidlo a údaje z osobního dokladu. Jízdy jsou vidět v kalendáři. | F14, O8, O14 | částečně | Kalendář navrhl tým. Rozsah údajů z dokladu viz OT7. |

## 5. Provoz autobazaru

| Pojem | Definice | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- |
| Plocha | Fyzické prodejní místo, kde stojí vozidla k vidění. „Na ploše“ znamená fyzicky v autobazaru. | PZ, F5 | potvrzeno | |
| Doba na ploše | Počet dnů, po které je vozidlo v prodeji. Podle ní se hledají dlouho neprodaná vozidla. | F5, F27 | potvrzeno | |
| Příprava vozidla | Úklid, opravy, servis a další práce, než se vozidlo může ukázat zákazníkovi. Provádí ji pracovník přípravy. | kap. 3, F4 | potvrzeno | |
| Lze ukázat | Vozidlo je fyzicky na ploše, připravené, lze ho předvést i vyzkoušet. Systém tuto informaci u každého vozidla viditelně uvádí. | PZ, kap. 2, kap. 4.1 | potvrzeno | |
| Veřejná nabídka | Webová nabídka vozidel připravených k prodeji. Obsahuje cenu, popis, technický stav a fotografie. | F15, F16, O10 | potvrzeno | |
| Inzerát | Záznam o inzerci vozidla na konkrétním místě: web, noviny, plakát. Systém eviduje, kde inzerce běží, a po prodeji připomíná její stažení. | F19, O9 | potvrzeno | |
| Štítek za sklo | Tisknutelný štítek ve vozidle s informací o komisním prodeji a vlastníkovi. | L4 | otevřeno | Souvisí s OT4 — zákazník informuje o komisi až při prohlídce. |

## 6. Doklady a dokumenty

| Pojem | Definice | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- |
| Kupní smlouva | Dokument generovaný systémem z údajů o vozidle a zákazníkovi. | F22, O12 | částečně | Zákazník mluví o „nákupní smlouvě“. Potvrdit, zda jde o kupní smlouvu k prodeji vozidla. |
| Předávací protokol | Dokument vznikající při předání vozidla. Obsahuje stav tachometru, technický stav a odkaz na doklad STK. | F22, L6 | potvrzeno | |
| Technický průkaz | Hovorový název dokladu o vozidle, formálně osvědčení o registraci vozidla. Je nutný k prodeji a předání. | F3, F23 | otevřeno | Zákazník může myslet „malý“, nebo „velký“ technický průkaz. Zjistit, který. |
| Plná moc | Písemné zmocnění, kterým komitent opravňuje autobazar prodat jeho vozidlo. Součást kontrolního seznamu před předáním. | F8, F23 | potvrzeno | |
| Kontrolní seznam před předáním | Podepsaná smlouva, technický průkaz, u komise plná moc, zaplaceno, identifikace zákazníka. Bez splnění nelze vozidlo označit jako předané. | F23 | potvrzeno | |
| Údaje z osobního dokladu | Údaje evidované u zákazníka pro jeho identifikaci: jméno, příjmení, adresa a číslo řidičského průkazu. | F14, L2, L8, O14, O26 | otevřeno | Není určeno, zda se číslo řidičského průkazu eviduje u všech zákazníků, nebo jen u zkušebních jízd. Viz OT7. |

## 7. Role

| Pojem | Definice | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- |
| Majitel | Nejvyšší role. Rozhoduje o požadavcích, schvaluje ceny a slevy, spravuje uživatele a vidí přehledy. | kap. 3, kap. 8, kap. 9, O2, O23 | potvrzeno | |
| Seniorní obchodník | Obchodník s rozšířenými pravomocemi: schvaluje výkupní cenu a cenu protiúčtu, poskytuje slevy. | kap. 3, F7, F9, F25, O2 | otevřeno | Není určeno, kdo může tuto roli získat a kdo o jejím přidělení rozhoduje. Viz OT2. |
| Obchodník | Sjednává výkupní cenu, spravuje zájemce, rezervace a zkušební jízdy. Neposkytuje slevy ani neschvaluje ceny. | kap. 3, O1, O2 | potvrzeno | |
| Pracovník přípravy | Připravuje vozidla a zapisuje práce a náklady. Nevidí nákupní ceny ani marži. | kap. 3, F4 | předpoklad | Zákazník mluví o „pracovníkovi skladu a přípravy vozidel“. Potvrdit, zda jde o jednu roli, a sjednotit název. Oprávnění odvodil tým, viz OT1. |
| Účetní | Pracuje s platbami a účetními údaji. | kap. 3, O1, O2 | předpoklad | Oprávnění odvodil tým, viz OT1. |

Jeden zaměstnanec může mít více rolí.

## 8. Legislativní pojmy a zkratky

| Pojem | Definice | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- |
| STK | Stanice technické kontroly. Protokol z STK dokládá technický stav vozidla, odkazuje se na něj předávací protokol. | F3, L6 | potvrzeno | |
| Přepis | Změna majitele (provozovatele) vozidla v registru vozidel, podle zadání do 10 pracovních dnů. Vyřizují zaměstnanci autobazaru, systém pouze hlídá termín. | F27, L7, O29 | potvrzeno | |
| Záruka | Lhůta evidovaná u prodeje vozidla, jejíž konec systém hlídá. | L5, O28 | otevřeno | Zákazník uvádí 2 měsíce u ojetých a 2 roky u nových vozidel. Zákon dává spotřebiteli právo z vad 24 měsíců, u použitého zboží lze smluvně zkrátit nejvýše na 12 měsíců. Viz OT5. |
| AML | Zákon proti praní špinavých peněz. Autobazar zprostředkovávající úvěry je povinnou osobou a musí identifikovat zákazníky. | L2, L3 | potvrzeno | |
| Povinná osoba | Subjekt, kterému zákon AML ukládá povinnosti, mimo jiné identifikaci klienta a archivaci dokladů po dobu 10 let. | L2 | potvrzeno | |
| GDPR | Nařízení o ochraně osobních údajů. Určuje, co se smí o zákaznících ukládat a jak dlouho. | L8 | částečně | Doba uchování údajů o zákaznících, kteří nekoupili, není určena. Viz OT8. |

## 9. Stavy vozidla

Podle kapitoly 4.1 zadání v1.0. Stav *Staženo z prodeje* a přesné přechody navrhl tým, jsou **předpoklad** (OT11). Upřesní je activity diagramy v týdnu 6.

| Pořadí | Stav | Význam |
| --- | --- | --- |
| 1 | Evidováno | Údaje jsou v systému, vozidlo ještě není na ploše. |
| 2 | V přípravě | Vozidlo je na ploše, ale nelze ho ještě ukázat. |
| 3 | Připraveno k prodeji | Vozidlo lze ukázat a vyzkoušet. Je ve veřejné nabídce. |
| 4 | Rezervováno | Vozidlo drží konkrétní zájemce. |
| 5 | Prodáno | Smlouva je podepsána, čeká se na předání a vyřízení dokladů. |
| 6 | Předáno | Vozidlo je u zákazníka, běží záruka a hlídá se přepis. |
| — | Staženo z prodeje | Vozidlo vypadlo z nabídky, například ho komitent stáhl. |

## 10. Značení v dokumentech

| Označení | Význam |
| --- | --- |
| F / N / L | Předpona ID požadavku: funkční, nefunkční, legislativní. |
| M / S | Priorita: M = nutné pro první verzi, S = žádoucí do kompletní verze. |
| OT | Otevřená otázka v [katalogu požadavků](katalog-pozadavku.md), kapitola 5. |
| PZ | [Původní zadání](../02-zadani/zadani-puvodni.md). |
| O1–O29 | Odpověď zákazníka v [otázkách a odpovědích](../02-zadani/otazky-a-odpovedi.md). |

## 11. Pojmy k ověření se zákazníkem

Deset pojmů má stav **otevřeno**. Dokud se nevyjasní, nesmí se podle nich navrhovat.

| Pojem | Co je potřeba rozhodnout | Otevřená otázka |
| --- | --- | --- |
| Komisní prodej, Štítek za sklo | Uvádí se informace o komisi v nabídce a na vozidle, nebo až při prohlídce? | OT4 |
| Nákupní cena vs. Výkupní cena | Je to jeden pojem? Pokud ano, jeden z nich zrušit. | — |
| Zákazník vs. Zájemce | Zahrnuje pojem zákazník každého zájemce? | — |
| Podržení, Rezervace, Záloha | Jak spolu tyto tři pojmy souvisejí? Zakládá záloha rezervaci? | OT12 |
| Technický průkaz | Malý, nebo velký technický průkaz? | — |
| Údaje z osobního dokladu | Eviduje se číslo řidičského průkazu u všech zákazníků? | OT7 |
| Záruka | Jakou záruku zákazník poskytuje a jak ji sladit se zákonem? | OT5 |
| Seniorní obchodník | Kdo roli přiděluje a komu? | OT2 |

Tři z nich (Nákupní cena, Zákazník, Technický průkaz) nemají v katalogu vlastní otevřenou otázku. Patří tam doplnit.
