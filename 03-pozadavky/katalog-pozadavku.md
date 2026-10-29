# Katalog požadavků

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 15. 10. 2026 | Jan Svoboda | První verze převzatá ze zadání v1.0. Doplněny zdroje a stav validace u každého požadavku. Připraveno s pomocí AI, zdroje ověřeny ručně proti [otázkám a odpovědím](../02-zadani/otazky-a-odpovedi.md). |
| 0.2 | 22. 10. 2026 | Martin Špaňúr | Vyřešeny nezodpovězené otázky díky komunikaci se zákazníkem. Požadavky podle toho upraveny. |
| 0.3 | 29. 10. 2026 | Martin Špaňúr | Dodáno navíc odpovědi na otázky přímo do souboru. |

## 1. Účel a pravidla

Katalog je jediné místo, kde jsou všechny požadavky na informační systém autobazaru pohromadě. Navazují na něj případy užití, scénáře, sekvenční diagramy a model tříd, proto se z něj trasuje dál.

- **ID** jsou převzatá ze [zadání v1.0](../02-zadani/zadani-v1.0.md): F (funkční), N (nefunkční), L (legislativní). ID se nemění ani po přečíslování dokumentu. Zrušený požadavek zůstane v katalogu se stavem *zrušeno*, jeho ID se znovu nepoužije.
- **Priorita:** M = nutné pro první verzi, S = žádoucí, do kompletní verze. Nefunkční a legislativní požadavky nemají v zadání prioritu uvedenou. V katalogu jsou vedeny jako M, protože bez nich nelze první verzi provozovat (předpoklad týmu, viz OT10).
- **Zdroj** odkazuje na místo, odkud požadavek pochází:
  - *PZ* = [původní zadání](../02-zadani/zadani-puvodni.md),
  - *O1–O29* = odpověď zákazníka se stejným číslem v [otázkách a odpovědích](../02-zadani/otazky-a-odpovedi.md),
  - *Tým* = doplnil tým (legislativa, odvození).
- **Stav** říká, nakolik je požadavek ověřený:
  - **potvrzeno** – zákazník to řekl nebo napsal,
  - **částečně** – jádro potvrdil zákazník, některé detaily doplnil tým (v poznámce je napsáno které),
  - **předpoklad** – odvodil tým, zákazník to zatím nepotvrdil,
  - **otevřeno** – je v rozporu s odpovědí zákazníka nebo chybí rozhodnutí. Do vyřešení otevřené otázky (OT) se podle něj nenavrhuje.

Akceptační kritéria k M požadavkům doplní samostatný úkol (#5). Pojmy jsou ve [slovníku pojmů](slovnik-pojmu.md) (#6).

## 2. Funkční požadavky

### 2.1 Evidence vozidel

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F1 | Vozidlo se jednoznačně identifikuje VIN, eviduje se i SPZ (pokud ji má), výkupní cena a hrubý technický stav. | M | PZ, O3, O4 | potvrzeno | |
| F2 | Vozidlo lze založit ještě před fyzickým přivezením, včetně fotografií. | M | PZ | potvrzeno | „něco máme nafocené dřív, než to vůbec přivezeme“ |
| F3 | Ke každému vozidlu lze přiložit doklady a fotografie (technický průkaz, smlouvy, protokol STK). | M | PZ, O12, O28 | potvrzeno | |
| F4 | K vozidlu se evidují náklady (opravy, převoz, příprava) a systém počítá skutečnou pořizovací cenu a marži. | M | PZ, O2 | potvrzeno | Způsob výpočtu marže u komisního prodeje zatím nepopsán. |
| F5 | Vozidla lze vyhledávat a filtrovat podle stavu, typu prodeje, značky, ceny a doby na ploše. | M | PZ, Tým | potvrzeno | |

**Stavy vozidla** (Evidováno → V přípravě → Připraveno k prodeji → Rezervováno → Prodáno → Předáno, mimo to Staženo z prodeje) jsou podle kap. 4.1 zadání v1.0. Rozlišení „na ploše / nelze ukázat / lze ukázat“ vychází z PZ. Stav *Staženo z prodeje* a přesné přechody mezi stavy navrhl tým a jsou **předpoklad** (OT11). Upřesní je activity diagramy v týdnu 6.

### 2.2 Typy prodeje

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F6 | Systém rozlišuje vlastní vozidlo, komisní prodej a vozidlo na protiúčet. | M | PZ, O5 | potvrzeno | |
| F7 | Výkupní cenu sjednává obchodník nebo majitel, schvaluje ji majitel nebo seniorní obchodník. Dokud není schválena, nelze vozidlo nabídnout. | M | O3 | potvrzeno | Platí jak řečeno, kromě majitele který může vše - tedy i nabídnout vozidlo s neschválenou cenou. |
| F8 | U komisního prodeje se eviduje komitent, minimální prodejní cena a marže a plná moc. Systém nedovolí prodej pod minimální cenou. | M | O3, O5, O12 | potvrzeno | |
| F9 | Cenu protiúčtu schvaluje majitel nebo seniorní obchodník. Vozidlo z protiúčtu se zakládá jako nové vozidlo napojené na původní prodej. | M | PZ, O5 | potvrzeno | |

### 2.3 Zájemci, rezervace a zkušební jízdy

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F10 | U vozidla se evidují zájemci a domluvy: prohlídka, zkušební jízda, podržení, záloha, podpis dokumentu. U každé domluvy je vidět, kdo ji sjednal a kdy. | M | PZ, O6 | potvrzeno | |
| F11 | Podržení má individuálně sjednanou dobu platnosti. | M | O6 | potvrzeno | |
| F12 | Vozidlo může mít více zájemců v pořadí. Platnou rezervaci má vždy jen jeden, takže dva obchodníci nemohou slíbit stejné auto. | M | PZ, O7 | potvrzeno | Vztah mezi podržením, zálohou a rezervací řeší přiřazený obchodní zástupce. |
| F13 | Po vypršení podržení systém upozorní obchodníka a nabídne vozidlo dalšímu zájemci v pořadí. | M | O7 | potvrzeno | Přiřazený obchodník další upozornění řeší. |
| F14 | Zkušební jízda eviduje datum, čas, vozidlo a údaje z osobního dokladu zákazníka: jméno, příjmení, číslo dokladu. Také nutno evidovat kontakt na zákazníka. Jízdy jsou vidět v kalendáři. | M | O8, O14 | potvrzeno | |

### 2.4 Inzerce a veřejná nabídka

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F15 | Systém obsahuje veřejnou webovou nabídku s cenou, popisem, technickým stavem a fotografiemi. | M | O10 | potvrzeno | |
| F16 | Ve veřejné nabídce jsou jen vozidla připravená k prodeji. Rezervovaná vozidla jsou označena a prodaná se automaticky skryjí. | M | PZ, O10 | částečně | Skrytí prodaných vychází z PZ. Označení rezervovaných navrhl tým. |
| F17 | Zákazník může přes web poslat dotaz nebo si domluvit prohlídku. Obchodník termín potvrzuje. | M | O10 | potvrzeno | |
| F18 | U komisních vozidel nabídka uvádí, že jde o komisní prodej. | M | Tým (L4) | potvrzeno | Zákazník je informován už při nabídce na webu. |
| F19 | U vozidla je přehled, kde všude je inzerováno (web, noviny, plakáty) a od kdy, včetně připomínky ke stažení inzerátu po prodeji. | S | PZ, O9 | potvrzeno | |

### 2.5 Komunikace se zákazníky

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F20 | Systém zobrazuje e-maily z firemní schránky a umožňuje je přiřadit k zákazníkovi a vozidlu. | S | O11 | potvrzeno | |
| F21 | U zákazníka je vidět celá historie: zájem, domluvy, nákup, doklady a poprodejní kontakty. | M | PZ, O14 | potvrzeno | Zákazníci mají kontakty co jim předá jejich konkrétní obchodník a také mají přístup ke kontaktům na firmu ze stránek. |

### 2.6 Prodej, doklady a platby

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F22 | Systém generuje kupní smlouvu a předávací protokol z údajů o vozidle a zákazníkovi. | M | PZ, O12 | potvrzeno | |
| F23 | Před předáním systém zkontroluje kontrolní seznam: podepsaná smlouva, technický průkaz, plná moc u komise, zaplaceno, identifikace zákazníka. Bez splnění nelze vozidlo označit jako předané. | M | PZ, O12 | potvrzeno | |
| F24 | Eviduje se platba převodem, kartou, hotovostí a úvěrem včetně zálohy. | M | O6, O13, O26 | částečně | Možná je platba vším zmíněným. Toto je vždy pravda nad jiné rozporné informace. (asi třeba ještě vyčistit požadavky od sporných informací) |
| F25 | Slevu může zadat jen seniorní obchodník nebo majitel. Každá sleva se zaznamená. | M | PZ, O2, O16 | potvrzeno | Limit výše slevy zákazník neuvedl. |
| F26 | Systém je napojen na účetní systém klienta. | M | O13 | potvrzeno | Ano. Systém Pohoda. |

### 2.7 Upozornění, přehledy a historie

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F27 | Upozornění na končící rezervace, nevyřízené doklady před předáním, neprovedený přepis a dlouho neprodaná vozidla. | M | O15 | potvrzeno | Kdy je vozidlo „dlouho neprodané“, zákazník neurčil. |
| F28 | Přehledy prodejů, marží a výkonu obchodníků. | S | O15 | potvrzeno | |
| F29 | Systém zaznamenává, kdo a kdy změnil údaje u vozidla (zejména cenu, stav a slevu). | M | O16 | potvrzeno | |

### 2.8 Oprávnění rolí

Oprávnění jednotlivých rolí jsou v tabulce v kap. 3 zadání v1.0 a v katalogu nemají vlastní ID. Promítají se do F7, F8, F9, F25, N6 a N7.

- Majitel, seniorní obchodník a obchodník: **potvrzeno** (O1, O2, O3, O5).
- Účetní, pracovník přípravy a správa uživatelů: **předpoklad** (OT1).
- Jak se zaměstnanec stane seniorním obchodníkem: **otevřeno** (OT2).

## 3. Nefunkční požadavky

| ID | Oblast | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- | --- |
| N1 | Platforma | Webová aplikace dostupná odkudkoli přes prohlížeč, použitelná na počítači, tabletu i telefonu. | M | O17 | potvrzeno | Tablet může být hotov později. Optimalizace vzhledu mohou být později. |
| N2 | Dostupnost | Výpadek v pracovní době nejvýše 1 pracovní den. | M | O18 | potvrzeno | |
| N3 | Zálohování | Denní záloha dat, ztráta dat nejvýše za 1 den. | M | O18, Tým | potvrzeno | |
| N4 | Objem dat | Systém zvládne alespoň 300 vozidel v nabídce, 30 prodejů měsíčně a růst bez nutnosti přestavby. | M | O19 | potvrzeno | |
| N5 | Rychlost | Zjištění, zda je vozidlo volné, a založení rezervace zvládne obchodník během 5 minut i s potvrzením pro zákazníka. | M | PZ | potvrzeno | Potvrzení rezervace pro zákazníka do 5 minut. Není ovšem třeba specifikovat počet kliknutí. |
| N6 | Přihlášení | Každý zaměstnanec má vlastní účet (e-mail a heslo). Po odchodu zaměstnance lze účet okamžitě zablokovat. | M | O20 | potvrzeno | |
| N7 | Oprávnění | Nákupní ceny, náklady a marže nejsou dostupné rolím ani veřejné nabídce, které je vidět nemají. | M | PZ, O2 | potvrzeno | |
| N8 | Uživatelé | Současný provoz 10 zaměstnanců, s rezervou pro růst. | M | O1, O19 | potvrzeno | |
| N9 | Přechod | Data ze současné tabulky přepíší zaměstnanci ručně, systém k tomu musí nabízet rychlé zakládání vozidel. | M | O25 | částečně | Rychlé zakládání doplnil tým. |

## 4. Legislativní požadavky

Legislativní požadavky doplnil tým z veřejných zdrojů uvedených v kap. 6 zadání v1.0. Zákazník je zatím nepotvrdil a nejde o právní posouzení.

| ID | Oblast | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- | --- |
| L1 | Platby v hotovosti | Klient přijímá hotovost do 100 000 Kč. Systém nedovolí zaevidovat hotovostní platbu nad tento interní limit (zákonný limit je 270 000 Kč za den). | M | O26, Tým | potvrzeno | Limit potvrdil zákazník. Rozpor není. Druhy plateb podle F24. |
| L2 | AML – identifikace | Klient zprostředkovává úvěry, je tedy povinnou osobou podle AML zákona. U prodeje na úvěr a u podezřelých obchodů systém vyžaduje identifikaci zákazníka z dokladu totožnosti, jinak prodej nelze dokončit. Jako podezřelý obchod se bere jakýkoli prvotní obchod, který není prověřen obchodníkem nebo majitelem. | M | O26, Tým | potvrzeno | |
| L3 | AML – archivace | Údaje a doklady o identifikovaných zákaznících a obchodech se uchovávají 2 let a nelze je předčasně smazat. | M | Tým | potvrzeno | Původně předpoklad na 10 let. |
| L4 | Komisní prodej | Informace o komisním prodeji a vlastníkovi vozidla musí být uvedena v nabídce a na vozidle, ne až při prohlídce. Systém ji zobrazí ve veřejné nabídce i na tisknutelném štítku za sklo. | M | O27, Tým | potvrzeno | V rozporu s O27 (OT4) již není. |
| L5 | Záruka | Klient uvedl záruku 2 měsíce na ojetá vozidla. Spotřebitel má ze zákona právo z vad 24 měsíců, u použitého zboží lze smluvně zkrátit nejvýše na 12 měsíců. Systém eviduje záruční lhůtu u každého prodeje a hlídá její konec. Navíc 1 měsíc na motor a karoserii a půl roku na skryté vady. | M | O28, Tým | částečně | V rozporu s O28 (OT5). Lhůtu 12 měsíců ověřit v občanském zákoníku. |
| L6 | Stav vozidla | Předávací protokol obsahuje technický stav, stav tachometru a odkaz na doklad z STK. | M | O28, Tým | potvrzeno | |
| L7 | Přepis | Přepis v registru vozidel musí proběhnout do 10 pracovních dnů. Přepis vyřizují zaměstnanci klienta, systém hlídá termín a upozorní na neprovedený přepis. | M | O15, O29, Tým | potvrzeno | |
| L8 | Ochrana osobních údajů | Ukládají se jen nezbytné údaje (jméno, adresa, údaje z dokladu). Po uplynutí doby uchování systém umožní údaje anonymizovat, s výjimkou údajů podle L3. Zodpovědnou osobou za GDPR je pověřený zaměstnanec klienta. Doby uchování se řídí zákonými dobami legitimate use a GDPR. | M | O14, O20, Tým | potvrzeno | |

## 5. Otevřené otázky

Navazují na kap. 9 zadání v1.0. Po odpovědi zákazníka se přepíše stav dotčených požadavků a zvýší se verze katalogu.

| ID | Otázka | Dotčené požadavky | Odpověď |
| --- | --- | --- | --- |
| OT1 | Jaká oprávnění má pracovník přípravy a účetní a kdo spravuje uživatele? | kap. 2.8, N6, N7 | Majitel spravuje uživatele. Účetní ani pracovník přípravy toto nedělá.
| OT2 | Kdo může být seniorní obchodník a jak se do této role zaměstnanec dostane? | F7, F9, F25 | O seniorním obchodníkovi rozhoduje majitel. |
| OT3 | Jakými způsoby zákazníci platí? Odpověď 13 uvádí převod a kartu, odpověď 26 hotovost do 100 000 Kč a úvěr. | F24, L1, L2 | Platba všude kartou i hotovost i úvěr. Podezření na bázi historie zákazníka (prvotní zákazník). |
| OT4 | Souhlasí klient s uváděním informace o komisním prodeji v nabídce a na vozidle? | F18, L4 | Zákazník musí vědět dopředu. |
| OT5 | Jakou záruku klient poskytuje? Prodává i nová vozidla (odpověď 28)? | L5 | Záruka 1 měsíc na motor a karoserii, elektro. 0.5 roku na skryté vady. |
| OT6 | Jaký účetní systém klient používá a jaké údaje se do něj mají předávat? | F26 | Systém: Pohoda. Na všechny faktury. | 
| OT7 | Eviduje se číslo řidičského průkazu u všech zákazníků, nebo jen u zkušebních jízd? | F14, L8 | Pouze u zkušebních jízd (majitelem může být i člověk bez řidičáku), eviduje se jméno + číslo průkazu a kontakt. |
| OT8 | Jak dlouho se mají uchovávat údaje o zákaznících, kteří nekoupili? | L8 | Po dobu oprávněného zájmu nebo žádosti o smazání údajů, nebo podle GDPR pokud data nesvěřil podle oprávněného zájmu. |
| OT9 | Jaká hranice je pro N5 přijatelná, např. kolik vteřin nebo kliknutí? | N5 | Netřeba počet kliknutí specifikovat - doba do 5 minut odepsání přijetí/reakce je ale nutná. |
| OT10 | Platí pro všechny nefunkční a legislativní požadavky priorita M? | N1–N9, L1–L8 | Nemusí být okamžitě podpora na tablet. |
| OT11 | Odpovídají stavy vozidla a přechody mezi nimi praxi autobazaru? Kdy se vozidlo stahuje z prodeje? | kap. 2.1, F16 | Stačí jak to je viz. F16.
| OT12 | Jak spolu souvisí podržení, záloha a rezervace? Kdo po vypršení podržení kontaktuje dalšího zájemce? | F11, F12, F13 | Auta mají přiřazeného obchodního zástupce, ten to vše řeší. Obchodní zástupci spolu komunikují přes systém, v minimální verzi komunikace může probíhat mimo systém. |

## 6. ~~Souhrn~~ dávno outdated, není třeba?

| Typ | Počet | M | S | potvrzeno | částečně | předpoklad | otevřeno |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Funkční | 29 | 26 | 3 | 14 | 12 | 1 | 2 |
| Nefunkční | 9 | 9 | 0 | 4 | 4 | 1 | 0 |
| Legislativní | 8 | 8 | 0 | 0 | 2 | 3 | 3 |
| **Celkem** | **46** | **43** | **3** | **18** | **18** | **5** | **5** |
