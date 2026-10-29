# Výběr klíčových případů užití

## 1. Účel a podklady

Pro podrobnou analýzu k M1 vybírám pět případů užití. Vycházím z úkolu týdne 5 v [plánu semestru](../01-rizeni/plan-semestru.md). Potřebujeme se soustředit na scénáře, na kterých ověříme hlavní problém zákazníka a které následně využijeme v modelech. Ostatní UC ponecháváme v seznamu a diagramu; jejich funkce tím z rozsahu systému nevyřazujeme.

Výběr navazuje na [seznam případů užití](pripady-uziti.md), [katalog požadavků](../03-pozadavky/katalog-pozadavku.md), [vymezení rozsahu](../03-pozadavky/vymezeni-rozsahu.md) a [odpovědi zákazníka](../02-zadani/otazky-a-odpovedi.md). Používá jejich existující ID a názvy.

Zákazník potřebuje především vědět, **které vozidlo lze prodat a co bylo komu slíbeno**. Proto dávám přednost evidenci domluv, podržení vozidla, vyřízení jeho vypršení a návaznému prodeji a předání. U těchto činností hrozí, že obchodníci slíbí stejné vozidlo více lidem nebo budou pracovat s neúplnými podklady. Na jejich rozpracování se zaměříme dříve než na běžnou evidenci a přehledy.

## 2. Rozhodnutí VUC-01 pro M1

**K podrobnému zpracování vybírám UC09, UC10, UC12, UC19 a UC23.** U každého zpracujeme cíl, aktéry, předpoklady, spouštěč, hlavní scénář, alternativní a chybové scénáře, výsledný stav a vazby na požadavky. Nejasnosti zapíšeme jako otevřené otázky a projednáme je se zákazníkem před dokončením dotčených scénářů.

| UC | Název a hlavní aktér | Vazba na požadavky | Proč je vybraný | Na co se zaměří podrobná analýza |
| --- | --- | --- | --- | --- |
| UC09 | Zaevidovat zájemce a domluvu — obchodník | F10 | Přímo odpovídá na otázku, co bylo komu slíbeno. Zákazník rozlišuje více druhů domluv (odpověď 6); bez společného záznamu by informace dál zůstávaly u jednotlivých obchodníků. | Vazba domluvy na vozidlo a zájemce, druh a obsah domluvy, kdo ji sjednal a kdy; chybějící údaje a odlišení evidence příslibu od vytvoření rezervace v UC10. |
| UC10 | Podržet vozidlo pro zájemce — obchodník | F11, F12, N5 | Chrání před tím, aby dva obchodníci slíbili stejné vozidlo různým lidem. Kombinuje individuální platnost podržení a pořadí zájemců, tedy nejrizikovější část koordinace prodeje (odpovědi 6 a 7). | Ověření dostupnosti, platnost a pořadí, pokus o souběžné podržení a dopad na dostupnost. Vztah podržení, rezervace a zálohy je otevřený v OT12. |
| UC12 | Vyřídit vypršelé podržení — obchodník | F13 | Nestačí závazek vytvořit; musí být jasné, co platí po jeho skončení. Zákazník požaduje nabídnutí dalšímu zájemci v pořadí (odpověď 7). Chyba může způsobit ztrátu zájemce nebo nesprávné uvolnění vozidla. | Zjištění vypršení, další zájemce v pořadí, situace bez dalšího zájemce a návaznost na dostupnost. Způsob kontaktování a míra automatizace čekají na OT12. |
| UC19 | Prodat vozidlo — obchodník | F8, F22; souvisejí F25 a F29 přes UC21, F9 přes UC22 | Převádí domluvu do prodeje a přípravy smlouvy. Je nosný pro vlastní i komisní prodej a spojuje údaje o vozidle a zákazníkovi s doklady (odpovědi 5 a 12). | Návaznost na existující domluvu a dostupnost, podklady pro kupní smlouvu, komisní varianta a chybějící údaje. Odkazy na identifikaci, slevu a protiúčet zachovají existující vztahy UC. |
| UC23 | Předat vozidlo — obchodník | F23, L5, L6 | Odděluje prodej od skutečného předání a kontroly dokladů. Zákazník výslovně vyžaduje technický průkaz a u komise plnou moc (odpověď 12). Předčasné označení za předané by zakrylo nevyřízené povinnosti. | Evidence kontroly podkladů, chybějící doklady a zaznamenání předání. Přesný kontrolní seznam a blokace předání jsou částečně odvozené týmem; nebudou vydávány za potvrzená pravidla. |

UC09 zachycuje obsah slibu, UC10 jeho dopad na dostupnost, UC12 konec platnosti a pořadí dalších zájemců. UC19 a UC23 ověřují návaznost až do prodeje a předání. Výběr tak pokrývá obě části hlavního problému a umožňuje sledovat jeden obchodní případ napříč analýzou.

## 3. Co se vědomě podrobně nespecifikuje

Následující UC zůstávají v seznamu a diagramu. Pro M1 nedostanou samostatné úplné scénáře ani vlastní podrobné modely. Jejich vstupy nebo výsledky lze použít jako předpoklad vybraného scénáře, ale bez domýšlení nepotvrzených pravidel.

| Nevybrané UC | Důvod omezení podrobnosti |
| --- | --- |
| UC01–UC04 — založení a úprava vozidla, komisní údaje, náklady | Důležitá vstupní evidence, ale sama neřeší konflikt závazků mezi zájemci. Vybrané scénáře předpokládají existující vozidlo a potřebné údaje. |
| UC05–UC08 — stav, vyhledávání a výkupní ceny | Dostupnost a stav se promítnou do předpokladů a výsledků vybraných scénářů. Samostatná specifikace by rozšířila výběr nad pět UC; přesné stavy a přechody navíc čekají na OT11. Schválení výkupní ceny zůstává samostatnou odpovědností těchto UC. |
| UC11 — naplánování zkušební jízdy | Jde o další druh domluvy, pro detailní rozbor závazků má přednost podržení a pořadí zájemců. Rozsah údajů z dokladu čeká na OT7. |
| UC13–UC15 — potvrzení prohlídky, veřejná nabídka a dotaz | Podporují získání zájemce. Detailní analýza se soustředí na interní koordinaci závazku a prodeje; zobrazení dostupnosti zůstává požadavkem F16. |
| UC16, UC17, UC26 — inzerce, e-mail a přehledy | Funkce priority S. Nejsou nutné pro podrobnou demonstraci jádra problému na M1. |
| UC18 — historie zákazníka | Souhrnný pohled na údaje vznikající v jiných UC. Přednost mají scénáře, v nichž domluva nebo prodej vznikají. |
| UC20–UC22 — identifikace, sleva a protiúčet | Zůstanou jako odkazované části UC19: UC20 přes `include`, UC21 a UC22 přes `extend`. Samostatné úplné specifikace se nepřipravují; v UC19 se popíše místo návaznosti, potřebný výsledek a nevyřešené podmínky. |
| UC24 — evidence platby | Platba je důležitá závislost předání, ale pravidla a oprávnění jsou otevřená (OT1, OT3, OT6). UC23 uvede potřebný vstup a nejasnosti; nenahradí tím specifikaci evidence platby ani účetní integrace. |
| UC25 — upozornění | Pro vypršení podržení se popíše relevantní návaznost v UC12. Ostatní upozornění nejsou jádrem vybraného průchodu. |
| UC27, UC28 — historie změn a správa uživatelů | Podpůrné funkce. Audit a oprávnění zůstávají podmínkami vybraných scénářů; správa rolí navíc čeká na validaci OT1 a OT2. |

Omezení podrobnosti neodstraňuje povinnost splnit požadavky priority M. Zejména schvalování cen, změny stavů, evidence plateb a účetní integrace zůstávají v rozsahu systému, přestože nejsou samostatně vybrané pro podrobnou analýzu.

## 4. Otevřené otázky a podmínky validace

Označení OT odkazují na [katalog požadavků](../03-pozadavky/katalog-pozadavku.md). Tento výběr je rozhodnutím o rozsahu analýzy; sám neuzavírá žádnou zákaznickou otázku.

| Otázka | Dopad na výběr | Další krok a odpovědnost |
| --- | --- | --- |
| OT12: Jaký je vztah podržení, rezervace a zálohy a kdo kontaktuje dalšího zájemce? | Blokuje konečná pravidla UC10 a UC12. | Martin Špaňúr připraví varianty a otázky; Jitka Rentková zajistí odpověď zákazníka a její zápis. |
| OT11: Jaké stavy a přechody vozidla platí a kdy je vozidlo dostupné k prodeji? | Ovlivňuje předpoklady a výsledky UC10, UC12, UC19 a UC23. | Martin Špaňúr porovná návrh stavů se scénáři; Jitka Rentková vyžádá potvrzení zákazníka. |
| OT3 a OT6: Jak se eviduje a potvrzuje platba a co předává účetní systém? | Ovlivňuje závislosti UC19 a UC23 na UC24. | Jitka Rentková vyžádá sjednocení odpovědí o platbách a informace o účetnictví. Do té doby se nenavrhuje konkrétní integrační postup. |
| OT1, OT2 a OT7: Kdo smí provádět související úkony a jaké identifikační údaje jsou potřeba? | Ovlivňuje oprávnění a vazbu UC19 na UC20. | Martin Špaňúr sepíše chybějící pravidla; Jitka Rentková je projedná se zákazníkem. |
| OT4 a OT5: Jak se vyřeší rozpory o komisním prodeji a záruce? | Ovlivňuje komisní variantu a podklady k prodeji a předání. | Jitka Rentková zajistí vyjasnění rozporů. Dokument nestanovuje právní výklad ani nepotvrzuje týmové legislativní požadavky. |
| Odvozené části F7, F8 a F23: Platí blokace nabídky bez schválení ceny, prodeje pod minimem a předání při neúplném seznamu? | Ovlivňuje dostupnost, komisní prodej a chybové scénáře předání. | Martin Špaňúr oddělí potvrzené podklady od návrhů blokací; Jitka Rentková zajistí jejich validaci zákazníkem. |

