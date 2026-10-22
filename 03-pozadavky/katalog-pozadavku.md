# Katalog požadavků

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.2 | 22. 10. 2026 | Jan Svoboda | Doplněna kapitola 5 s akceptačními kritérii ke všem M požadavkům (#5). U šesti požadavků kritérium nejde napsat, dokud zákazník neodpoví — shrnuto v kap. 5.9. Připraveno s pomocí AI, odvozeno z požadavků a odpovědí zákazníka. Podle plánu úkol patří testerovi, který kritéria zkontroluje.
| 0.1 | 15. 10. 2026 | Jan Svoboda | První verze převzatá ze zadání v1.0. Doplněny zdroje a stav validace u každého požadavku. Připraveno s pomocí AI, zdroje ověřeny ručně proti [otázkám a odpovědím](../02-zadani/otazky-a-odpovedi.md). |

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

Akceptační kritéria k M požadavkům jsou v kapitole 5. Pojmy jsou ve [slovníku pojmů](slovnik-pojmu.md) (#6).

## 2. Funkční požadavky

### 2.1 Evidence vozidel

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F1 | Vozidlo se jednoznačně identifikuje VIN, eviduje se i SPZ (pokud ji má), výkupní cena a hrubý technický stav. | M | PZ, O3, O4 | potvrzeno | |
| F2 | Vozidlo lze založit ještě před fyzickým přivezením, včetně fotografií. | M | PZ | potvrzeno | „něco máme nafocené dřív, než to vůbec přivezeme“ |
| F3 | Ke každému vozidlu lze přiložit doklady a fotografie (technický průkaz, smlouvy, protokol STK). | M | PZ, O12, O28 | potvrzeno | |
| F4 | K vozidlu se evidují náklady (opravy, převoz, příprava) a systém počítá skutečnou pořizovací cenu a marži. | M | PZ, O2 | potvrzeno | Způsob výpočtu marže u komisního prodeje zatím nepopsán. |
| F5 | Vozidla lze vyhledávat a filtrovat podle stavu, typu prodeje, značky, ceny a doby na ploše. | M | PZ, Tým | předpoklad | Zákazník chce „mít všechna auta pohromadě“, konkrétní filtry navrhl tým. |

**Stavy vozidla** (Evidováno → V přípravě → Připraveno k prodeji → Rezervováno → Prodáno → Předáno, mimo to Staženo z prodeje) jsou podle kap. 4.1 zadání v1.0. Rozlišení „na ploše / nelze ukázat / lze ukázat“ vychází z PZ. Stav *Staženo z prodeje* a přesné přechody mezi stavy navrhl tým a jsou **předpoklad** (OT11). Upřesní je activity diagramy v týdnu 6.

### 2.2 Typy prodeje

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F6 | Systém rozlišuje vlastní vozidlo, komisní prodej a vozidlo na protiúčet. | M | PZ, O5 | potvrzeno | |
| F7 | Výkupní cenu sjednává obchodník nebo majitel, schvaluje ji majitel nebo seniorní obchodník. Dokud není schválena, nelze vozidlo nabídnout. | M | O3 | částečně | Pravidlo „bez schválení nelze nabídnout“ odvodil tým. |
| F8 | U komisního prodeje se eviduje komitent, minimální prodejní cena a marže a plná moc. Systém nedovolí prodej pod minimální cenou. | M | O3, O5, O12 | částečně | Blokaci prodeje pod minimální cenou odvodil tým. |
| F9 | Cenu protiúčtu schvaluje majitel nebo seniorní obchodník. Vozidlo z protiúčtu se zakládá jako nové vozidlo napojené na původní prodej. | M | PZ, O5 | částečně | Napojení na původní prodej navrhl tým. |

### 2.3 Zájemci, rezervace a zkušební jízdy

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F10 | U vozidla se evidují zájemci a domluvy: prohlídka, zkušební jízda, podržení, záloha, podpis dokumentu. U každé domluvy je vidět, kdo ji sjednal a kdy. | M | PZ, O6 | potvrzeno | |
| F11 | Podržení má individuálně sjednanou dobu platnosti. | M | O6 | potvrzeno | |
| F12 | Vozidlo může mít více zájemců v pořadí. Platnou rezervaci má vždy jen jeden, takže dva obchodníci nemohou slíbit stejné auto. | M | PZ, O7 | potvrzeno | Vztah mezi podržením, zálohou a rezervací zatím není vyjasněný (OT12). |
| F13 | Po vypršení podržení systém upozorní obchodníka a nabídne vozidlo dalšímu zájemci v pořadí. | M | O7 | částečně | Upozornění obchodníka doplnil tým. Kdo dalšího zájemce kontaktuje, je otevřené (OT12). |
| F14 | Zkušební jízda eviduje datum, čas, vozidlo a údaje z osobního dokladu zákazníka. Jízdy jsou vidět v kalendáři. | M | O8, O14 | částečně | Kalendář navrhl tým. Rozsah údajů z dokladu viz OT7. |

### 2.4 Inzerce a veřejná nabídka

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F15 | Systém obsahuje veřejnou webovou nabídku s cenou, popisem, technickým stavem a fotografiemi. | M | O10 | potvrzeno | |
| F16 | Ve veřejné nabídce jsou jen vozidla připravená k prodeji. Rezervovaná vozidla jsou označena a prodaná se automaticky skryjí. | M | PZ, O10 | částečně | Skrytí prodaných vychází z PZ. Označení rezervovaných navrhl tým. |
| F17 | Zákazník může přes web poslat dotaz nebo si domluvit prohlídku. Obchodník termín potvrzuje. | M | O10 | částečně | Potvrzování termínu obchodníkem navrhl tým. |
| F18 | U komisních vozidel nabídka uvádí, že jde o komisní prodej. | M | Tým (L4) | otevřeno | Zákazník informuje až při prohlídce (O27). Viz L4 a OT4. |
| F19 | U vozidla je přehled, kde všude je inzerováno (web, noviny, plakáty) a od kdy, včetně připomínky ke stažení inzerátu po prodeji. | S | PZ, O9 | potvrzeno | |

### 2.5 Komunikace se zákazníky

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F20 | Systém zobrazuje e-maily z firemní schránky a umožňuje je přiřadit k zákazníkovi a vozidlu. | S | O11 | částečně | Přiřazení k zákazníkovi a vozidlu navrhl tým. |
| F21 | U zákazníka je vidět celá historie: zájem, domluvy, nákup, doklady a poprodejní kontakty. | M | PZ, O14 | částečně | S čím se zákazníci po koupi ozývají, zůstalo nezodpovězeno (O14). |

### 2.6 Prodej, doklady a platby

| ID | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- |
| F22 | Systém generuje kupní smlouvu a předávací protokol z údajů o vozidle a zákazníkovi. | M | PZ, O12 | částečně | Kupní smlouvu zákazník zmínil, předávací protokol doplnil tým (L6). |
| F23 | Před předáním systém zkontroluje kontrolní seznam: podepsaná smlouva, technický průkaz, plná moc u komise, zaplaceno, identifikace zákazníka. Bez splnění nelze vozidlo označit jako předané. | M | PZ, O12 | částečně | Položky „zaplaceno“ a „identifikace zákazníka“ doplnil tým. |
| F24 | Eviduje se platba převodem, kartou, hotovostí a úvěrem včetně zálohy. | M | O6, O13, O26 | otevřeno | Rozpor O13 (převod, karta) a O26 (hotovost, úvěr). Viz OT3. |
| F25 | Slevu může zadat jen seniorní obchodník nebo majitel. Každá sleva se zaznamená. | M | PZ, O2, O16 | potvrzeno | Limit výše slevy zákazník neuvedl. |
| F26 | Systém je napojen na účetní systém klienta. | M | O13 | částečně | Neznámý účetní systém a rozsah předávaných údajů (OT6). |

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
| N1 | Platforma | Webová aplikace dostupná odkudkoli přes prohlížeč, použitelná na počítači, tabletu i telefonu. | M | O17 | částečně | Tablet a telefon doplnil tým. |
| N2 | Dostupnost | Výpadek v pracovní době nejvýše 1 pracovní den. | M | O18 | potvrzeno | |
| N3 | Zálohování | Denní záloha dat, ztráta dat nejvýše za 1 den. | M | O18, Tým | předpoklad | Zákazník mluvil jen o výpadku, přijatelnou ztrátu dat neurčil. |
| N4 | Objem dat | Systém zvládne alespoň 300 vozidel v nabídce, 30 prodejů měsíčně a růst bez nutnosti přestavby. | M | O19 | potvrzeno | |
| N5 | Rychlost | Zjištění, zda je vozidlo volné, a založení rezervace zvládne obchodník během několika vteřin a na pár kliknutí. | M | PZ | částečně | Potřebu potvrdil zákazník, měřitelnou hranici zatím ne (OT9). |
| N6 | Přihlášení | Každý zaměstnanec má vlastní účet (e-mail a heslo). Po odchodu zaměstnance lze účet okamžitě zablokovat. | M | O20 | částečně | Blokaci účtu doplnil tým. |
| N7 | Oprávnění | Nákupní ceny, náklady a marže nejsou dostupné rolím ani veřejné nabídce, které je vidět nemají. | M | PZ, O2 | potvrzeno | |
| N8 | Uživatelé | Současný provoz 10 zaměstnanců, s rezervou pro růst. | M | O1, O19 | potvrzeno | |
| N9 | Přechod | Data ze současné tabulky přepíší zaměstnanci ručně, systém k tomu musí nabízet rychlé zakládání vozidel. | M | O25 | částečně | Rychlé zakládání doplnil tým. |

## 4. Legislativní požadavky

Legislativní požadavky doplnil tým z veřejných zdrojů uvedených v kap. 6 zadání v1.0. Zákazník je zatím nepotvrdil a nejde o právní posouzení.

| ID | Oblast | Požadavek | Pri. | Zdroj | Stav | Poznámka |
| --- | --- | --- | --- | --- | --- | --- |
| L1 | Platby v hotovosti | Klient přijímá hotovost do 100 000 Kč. Systém nedovolí zaevidovat hotovostní platbu nad tento interní limit (zákonný limit je 270 000 Kč za den). | M | O26, Tým | otevřeno | Limit potvrdil zákazník, ale je v rozporu s O13 (OT3). |
| L2 | AML – identifikace | Klient zprostředkovává úvěry, je tedy povinnou osobou podle AML zákona. U prodeje na úvěr a u podezřelých obchodů systém vyžaduje identifikaci zákazníka z dokladu totožnosti, jinak prodej nelze dokončit. | M | O26, Tým | předpoklad | Kdo posuzuje „podezřelý obchod“, není určeno. |
| L3 | AML – archivace | Údaje a doklady o identifikovaných zákaznících a obchodech se uchovávají 10 let a nelze je předčasně smazat. | M | Tým | předpoklad | |
| L4 | Komisní prodej | Informace o komisním prodeji a vlastníkovi vozidla musí být uvedena v nabídce a na vozidle, ne až při prohlídce. Systém ji zobrazí ve veřejné nabídce i na tisknutelném štítku za sklo. | M | O27, Tým | otevřeno | V rozporu s O27 (OT4). |
| L5 | Záruka | Klient uvedl záruku 2 měsíce na ojetá vozidla. Spotřebitel má ze zákona právo z vad 24 měsíců, u použitého zboží lze smluvně zkrátit nejvýše na 12 měsíců. Systém eviduje záruční lhůtu u každého prodeje a hlídá její konec. | M | O28, Tým | otevřeno | V rozporu s O28 (OT5). Lhůtu 12 měsíců ověřit v občanském zákoníku. |
| L6 | Stav vozidla | Předávací protokol obsahuje technický stav, stav tachometru a odkaz na doklad z STK. | M | O28, Tým | částečně | Doklad z STK potvrdil zákazník, stav tachometru doplnil tým. |
| L7 | Přepis | Přepis v registru vozidel musí proběhnout do 10 pracovních dnů. Přepis vyřizují zaměstnanci klienta, systém hlídá termín a upozorní na neprovedený přepis. | M | O15, O29, Tým | částečně | Kdo přepis vyřizuje, potvrdil zákazník. Lhůtu doplnil tým. |
| L8 | Ochrana osobních údajů | Ukládají se jen nezbytné údaje (jméno, adresa, údaje z dokladu). Po uplynutí doby uchování systém umožní údaje anonymizovat, s výjimkou údajů podle L3. Zodpovědnou osobou za GDPR je pověřený zaměstnanec klienta. | M | O14, O20, Tým | předpoklad | Dobu uchování zákazník neuvedl (O14). |

## 5. Akceptační kritéria

Kritéria jsou ke všem požadavkům s prioritou **M**. Požadavky s prioritou S (F19, F20, F28) je dostanou, až se rozhodne, které z nich se budou dělat.

Pravidla:

- Kritérium je napsané tak, aby podle něj šlo rozhodnout **ano, nebo ne**. Formulace jako „rychle“ nebo „přehledně“ se nepoužívají.
- Kritérium nedomýšlí, co zákazník neřekl. Tam, kde by muselo, je místo něj otevřená otázka — viz kapitola 5.9.
- Odkazuje se na ně ve tvaru `F1/2`, tedy druhé kritérium požadavku F1.
- Po sepsání scénářů případů užití se kritéria doplní podle toho, co ze scénářů vyplyne (#14).

### 5.1 Evidence vozidel

| ID | # | Akceptační kritérium |
| --- | --- | --- |
| F1 | 1 | Vozidlo nelze uložit bez vyplněného VIN. |
| F1 | 2 | Vozidlo s VIN, které už v evidenci existuje, systém odmítne uložit. |
| F1 | 3 | Vozidlo lze uložit i bez SPZ. |
| F1 | 4 | U vozidla lze zaznamenat výkupní cenu a hrubý technický stav. |
| F2 | 1 | Vozidlo lze uložit ve stavu Evidováno, aniž by bylo na ploše. |
| F2 | 2 | K vozidlu ve stavu Evidováno lze nahrát fotografie. |
| F3 | 1 | K vozidlu lze přiložit soubor a určit jeho typ: technický průkaz, smlouva, protokol STK. |
| F3 | 2 | Přiložený soubor lze otevřít a stáhnout. |
| F4 | 1 | K vozidlu lze přidat náklad s částkou, datem a druhem (oprava, převoz, příprava). |
| F4 | 2 | Po přidání nákladu se pořizovací cena přepočítá na součet výkupní ceny a všech nákladů. |
| F4 | 3 | U vozidla s prodejní cenou systém zobrazí marži. |
| F5 | 1 | Seznam vozidel lze filtrovat podle stavu, typu prodeje, značky, ceny a doby na ploše. |
| F5 | 2 | Filtry lze kombinovat a výsledek odpovídá všem zvoleným podmínkám zároveň. |

Způsob výpočtu marže u komisního prodeje není popsán (viz poznámka u F4), proto k F4 zatím není kritérium pro komisní vozidla. Filtry u F5 navrhl tým, zákazník je nepotvrdil.

### 5.2 Typy prodeje

| ID | # | Akceptační kritérium |
| --- | --- | --- |
| F6 | 1 | U vozidla je povinný typ prodeje: vlastní, komisní, nebo protiúčet. |
| F6 | 2 | Typ prodeje je vidět v seznamu vozidel bez nutnosti otevřít detail. |
| F7 | 1 | Výkupní cenu může zadat obchodník nebo majitel. |
| F7 | 2 | Vozidlo s neschválenou výkupní cenou nelze zveřejnit ve veřejné nabídce. |
| F7 | 3 | U schválení výkupní ceny je vidět, kdo ji schválil a kdy. |
| F8 | 1 | U komisního vozidla jsou povinné komitent a minimální prodejní cena. |
| F8 | 2 | Prodej komisního vozidla za cenu nižší než minimální prodejní cena systém odmítne. |
| F8 | 3 | Ke komisnímu vozidlu lze přiložit plnou moc. |
| F9 | 1 | Cenu vozidla přijatého na protiúčet lze uložit až po schválení majitelem nebo seniorním obchodníkem. |
| F9 | 2 | Vozidlo přijaté na protiúčet vznikne jako nové vozidlo s odkazem na prodej, při kterém bylo přijato. |

Pravidlo u F7/2 a blokaci u F8/2 odvodil tým, zákazník je nepotvrdil. Napojení podle F9/2 je rovněž návrh týmu.

### 5.3 Zájemci, rezervace a zkušební jízdy

| ID | # | Akceptační kritérium |
| --- | --- | --- |
| F10 | 1 | K vozidlu lze přidat zájemce. |
| F10 | 2 | K zájemci lze zapsat domluvu typu prohlídka, zkušební jízda, podržení, záloha nebo podpis dokumentu. |
| F10 | 3 | U každé domluvy je vidět, kdo ji sjednal a kdy. |
| F11 | 1 | Při vytvoření podržení se zadává doba jeho platnosti. |
| F11 | 2 | Doba platnosti se nastavuje pro každé podržení zvlášť, není pevně daná. |
| F12 | 1 | Vytvoření druhé platné rezervace téhož vozidla systém odmítne. |
| F12 | 2 | K rezervovanému vozidlu lze přidat dalšího zájemce do pořadí. |
| F12 | 3 | Pořadí zájemců je vidět u vozidla včetně toho, kdo je na řadě. |
| F13 | 1 | Po uplynutí doby podržení systém upozorní obchodníka, který ho sjednal. |
| F13 | 2 | Po uplynutí doby podržení přestane být vozidlo rezervované a je nabídnuto dalšímu zájemci v pořadí. |
| F14 | 1 | U zkušební jízdy jsou povinné datum, čas a vozidlo. |
| F14 | 2 | U zkušební jízdy se evidují údaje z osobního dokladu zákazníka. |
| F14 | 3 | Naplánované zkušební jízdy jsou vidět v kalendáři. |

Vztah podržení, zálohy a rezervace zatím není vyjasněný (OT12), proto kritéria F12 a F13 popisují jen to, co zákazník potvrdil. Rozsah údajů podle F14/2 upřesní OT7. Kalendář podle F14/3 navrhl tým.

### 5.4 Inzerce a veřejná nabídka

| ID | # | Akceptační kritérium |
| --- | --- | --- |
| F15 | 1 | Vozidlo ve veřejné nabídce zobrazuje cenu, popis, technický stav a alespoň jednu fotografii. |
| F15 | 2 | Veřejná nabídka je dostupná bez přihlášení. |
| F16 | 1 | Ve veřejné nabídce jsou jen vozidla ve stavu Připraveno k prodeji a Rezervováno. |
| F16 | 2 | Rezervované vozidlo je ve veřejné nabídce označené jako rezervované. |
| F16 | 3 | Vozidlo ve stavu Prodáno se ve veřejné nabídce nezobrazí. |
| F17 | 1 | Zákazník může z veřejné nabídky odeslat dotaz ke konkrétnímu vozidlu bez přihlášení. |
| F17 | 2 | Zákazník může požádat o termín prohlídky. |
| F17 | 3 | Žádost o prohlídku se zobrazí obchodníkovi, který ji potvrdí nebo odmítne. |

Označení rezervovaných vozidel podle F16/2 a potvrzování termínu podle F17/3 navrhl tým. Ke **F18** kritérium zatím není, viz kapitola 5.9.

### 5.5 Komunikace a historie zákazníka

| ID | # | Akceptační kritérium |
| --- | --- | --- |
| F21 | 1 | U zákazníka je vidět seznam vozidel, o která projevil zájem, a všech jeho domluv. |
| F21 | 2 | U zákazníka je vidět seznam jeho nákupů a dokladů k nim. |
| F21 | 3 | Záznamy v historii jsou seřazené podle data. |

Co přesně patří mezi poprodejní kontakty, zákazník nezodpověděl (O14), proto k nim kritérium zatím není.

### 5.6 Prodej, doklady a platby

| ID | # | Akceptační kritérium |
| --- | --- | --- |
| F22 | 1 | Systém vygeneruje kupní smlouvu předvyplněnou údaji o vozidle a zákazníkovi. |
| F22 | 2 | Systém vygeneruje předávací protokol obsahující technický stav, stav tachometru a odkaz na doklad z STK. |
| F23 | 1 | Vozidlo nelze označit jako Předáno, dokud nejsou splněné všechny položky kontrolního seznamu. |
| F23 | 2 | U komisního vozidla obsahuje kontrolní seznam i plnou moc. |
| F23 | 3 | U každé splněné položky je vidět, kdo ji potvrdil a kdy. |
| F25 | 1 | Pole pro zadání slevy je přístupné jen seniornímu obchodníkovi a majiteli. |
| F25 | 2 | U každé slevy je vidět, kdo ji zadal, kdy a v jaké výši. |
| F26 | 1 | Systém umožní předat údaje o uzavřeném prodeji do účetního systému klienta. |

Výši slevy zákazník neomezil, proto k F25 není kritérium na limit. Rozsah a formát údajů u F26/1 závisí na OT6. Ke **F24** kritérium zatím není, viz kapitola 5.9.

### 5.7 Upozornění, přehledy a historie

| ID | # | Akceptační kritérium |
| --- | --- | --- |
| F27 | 1 | Systém upozorní na rezervaci, jejíž platnost končí. |
| F27 | 2 | Systém upozorní na vozidlo ve stavu Prodáno s nesplněnými položkami kontrolního seznamu. |
| F27 | 3 | Systém upozorní na prodej, u kterého neproběhl přepis ve lhůtě podle L7. |
| F29 | 1 | U vozidla je historie změn ceny, stavu a slevy. |
| F29 | 2 | U každé změny je vidět, kdo ji provedl, kdy, a jaká byla původní a nová hodnota. |
| F29 | 3 | Záznam v historii změn nelze smazat ani upravit. |

Kdy je vozidlo „dlouho neprodané“, zákazník neurčil, proto k této části F27 kritérium zatím není.

### 5.8 Nefunkční a legislativní požadavky

| ID | # | Akceptační kritérium |
| --- | --- | --- |
| N1 | 1 | Aplikace je použitelná v běžném prohlížeči bez instalace dalšího softwaru. |
| N1 | 2 | Všechny ovládací prvky jsou použitelné na šířce obrazovky telefonu. |
| N2 | 1 | Výpadek v pracovní době netrvá déle než 1 pracovní den. |
| N3 | 1 | Záloha dat probíhá alespoň jednou denně. |
| N3 | 2 | Ze zálohy lze obnovit stav, který není starší než 1 den. |
| N4 | 1 | Systém funguje při 300 vozidlech v nabídce. |
| N4 | 2 | Systém zvládne 30 prodejů měsíčně bez zásahu do nastavení. |
| N6 | 1 | Každý zaměstnanec se přihlašuje vlastním účtem s e-mailem a heslem. |
| N6 | 2 | Zablokovaný účet se nepřihlásí. |
| N7 | 1 | Role, která nemá vidět nákupní ceny, náklady a marži, je nevidí v detailu, v seznamu ani v exportu. |
| N7 | 2 | Veřejná nabídka neobsahuje nákupní cenu, náklady ani marži. |
| N8 | 1 | Systém umožní současnou práci 10 zaměstnanců. |
| N9 | 1 | Vozidlo lze založit vyplněním VIN, výkupní ceny a stavu, ostatní údaje lze doplnit později. |
| L2 | 1 | Prodej na úvěr nelze dokončit bez vyplněné identifikace zákazníka z dokladu totožnosti. |
| L3 | 1 | Údaje a doklady o identifikovaném zákazníkovi nelze smazat dříve než 10 let od obchodu. |
| L6 | 1 | Předávací protokol nelze vygenerovat bez technického stavu, stavu tachometru a odkazu na doklad z STK. |
| L7 | 1 | U prodeje se eviduje datum provedení přepisu. |
| L7 | 2 | Systém upozorní, pokud přepis neproběhl do 10 pracovních dnů od předání. |
| L8 | 1 | Po uplynutí doby uchování lze údaje zákazníka anonymizovat. |
| L8 | 2 | Anonymizace se nevztahuje na údaje, které je nutné uchovat podle L3. |

Mobilní použitelnost podle N1/2, zálohování podle N3 a rychlé zakládání podle N9/1 doplnil tým. Doba uchování u L8/1 není určena (OT8). Kdo posuzuje podezřelý obchod podle L2, není určeno. Požadavky **N5, L1, L4 a L5** kritérium zatím nemají, viz kapitola 5.9.

### 5.9 Požadavky, ke kterým kritérium zatím nejde napsat

U šesti požadavků by kritérium muselo rozhodnout něco, co zákazník nepotvrdil, nebo co si odporuje. Definice „hotovo“ v takovém případě vyžaduje otevřenou otázku, ne domyšlený detail.

| ID | Co chybí | Otevřená otázka |
| --- | --- | --- |
| F18 | Uvádí se informace o komisním prodeji už v nabídce, nebo až při prohlídce? Kritérium by muselo jedno z toho vyloučit. | OT4 |
| F24 | Které způsoby platby systém přijímá. Odpověď 13 uvádí převod a kartu, odpověď 26 hotovost a úvěr. | OT3 |
| N5 | Měřitelná hranice. Bez ní by kritérium znělo „zvládne to během několika vteřin“, což není ověřitelné. | OT9 |
| L1 | Zda platí interní limit 100 000 Kč na hotovost, když si odpovědi 13 a 26 odporují. | OT3 |
| L4 | Totéž co F18 z druhé strany — zákonný požadavek proti tomu, co řekl zákazník. | OT4 |
| L5 | Délka záruční lhůty. Zákazník uvádí 2 měsíce, zákon dává 24, u použitého zboží lze zkrátit nejvýše na 12. | OT5 |

Jakmile zákazník odpoví, kritéria se doplní a verze katalogu se zvýší.

## 6. Otevřené otázky

Navazují na kap. 9 zadání v1.0. Po odpovědi zákazníka se přepíše stav dotčených požadavků a zvýší se verze katalogu.

| ID | Otázka | Dotčené požadavky |
| --- | --- | --- |
| OT1 | Jaká oprávnění má pracovník přípravy a účetní a kdo spravuje uživatele? | kap. 2.8, N6, N7 |
| OT2 | Kdo může být seniorní obchodník a jak se do této role zaměstnanec dostane? | F7, F9, F25 |
| OT3 | Jakými způsoby zákazníci platí? Odpověď 13 uvádí převod a kartu, odpověď 26 hotovost do 100 000 Kč a úvěr. | F24, L1, L2 |
| OT4 | Souhlasí klient s uváděním informace o komisním prodeji v nabídce a na vozidle? | F18, L4 |
| OT5 | Jakou záruku klient poskytuje? Prodává i nová vozidla (odpověď 28)? | L5 |
| OT6 | Jaký účetní systém klient používá a jaké údaje se do něj mají předávat? | F26 |
| OT7 | Eviduje se číslo řidičského průkazu u všech zákazníků, nebo jen u zkušebních jízd? | F14, L8 |
| OT8 | Jak dlouho se mají uchovávat údaje o zákaznících, kteří nekoupili? | L8 |
| OT9 | Jaká hranice je pro N5 přijatelná, např. kolik vteřin nebo kliknutí? | N5 |
| OT10 | Platí pro všechny nefunkční a legislativní požadavky priorita M? | N1–N9, L1–L8 |
| OT11 | Odpovídají stavy vozidla a přechody mezi nimi praxi autobazaru? Kdy se vozidlo stahuje z prodeje? | kap. 2.1, F16 |
| OT12 | Jak spolu souvisí podržení, záloha a rezervace? Kdo po vypršení podržení kontaktuje dalšího zájemce? | F11, F12, F13 |

## 7. Souhrn

| Typ | Počet | M | S | potvrzeno | částečně | předpoklad | otevřeno |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Funkční | 29 | 26 | 3 | 14 | 12 | 1 | 2 |
| Nefunkční | 9 | 9 | 0 | 4 | 4 | 1 | 0 |
| Legislativní | 8 | 8 | 0 | 0 | 2 | 3 | 3 |
| **Celkem** | **46** | **43** | **3** | **18** | **18** | **5** | **5** |
