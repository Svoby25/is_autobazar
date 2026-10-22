# Zadání: Informační systém pro autobazar

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 1.0 | 8. 10. 2026 | tým | První verze sestavená z původního zadání a odpovědí zákazníka. Připraveno s pomocí AI, ověřeno rozhovorem se zákazníkem; body v kapitole 9 a legislativní požadavky L1–L8 zatím zákazník nepotvrdil. |

## 1. Úvod

Společnost XY dodá webový informační systém, který autobazaru umožní mít všechna vozidla, zájemce, rezervace, doklady a náklady na jednom místě. Cílem je, aby každý zaměstnanec v kterémkoli okamžiku věděl, které auto lze prodat a co bylo komu slíbeno, i když kolega chybí.

Dokument shrnuje původní požadavek majitele a odpovědi z úvodního rozhovoru. Slouží jako podklad ke schválení rozsahu před zahájením vývoje.

## 2. Současný stav a cíle

Autobazar má jednu pobočku, 10 zaměstnanců a průměrně 300 vozidel v nabídce, měsíčně prodá zhruba 30 vozidel a počítá s růstem. Evidence je dnes rozdělená mezi tabulku, papírové složky a paměť obchodníků.

Hlavní problémy, které má systém vyřešit:

- Když obchodník chybí, ostatní nevědí, co se kterým zákazníkem domluvil.
- Zákazník přijede kvůli inzerátu a teprve na místě se zjišťuje, zda auto lze ukázat.
- Hrozí, že dva obchodníci slíbí stejné auto dvěma zájemcům.
- Nejsou vidět skutečné náklady na vozidlo, jen nákupní cena.
- Slevy nejsou pod kontrolou a ceny vidí i ti, kdo nemají.
- Inzeráty se přepisují ručně a po prodeji se zapomínají stáhnout.
- Při poprodejním kontaktu se historie dohledává znovu.

Systém má obchodníkům práci zrychlit, ne přidat. Zákazník nesmí čekat, než se obchodník „proklikne“ k informaci.

## 3. Uživatelé a role

Systém rozlišuje pět rolí a jeden uživatel může mít více rolí současně. Oprávnění se řídí sjednocením jeho rolí.

| Oprávnění | Majitel | Seniorní obchodník | Obchodník | Účetní | Pracovník přípravy |
|----------------|------|---------|---------|------|---------|
| Vidí nákupní ceny, náklady a marži | ano | ano | ano | ano | ne |
| Sjednává výkupní cenu | ano | ano | ano | ne | ne |
| Schvaluje výkupní cenu a cenu protiúčtu | ano | ano | ne | ne | ne |
| Poskytuje slevy | ano | ano | ne | ne | ne |
| Spravuje zájemce, rezervace a zkušební jízdy | ano | ano | ano | ne | ne |
| Zapisuje práce a náklady na přípravu vozidla | ano | ano | ano | ne | ano |
| Připravuje prodejní doklady | ano | ano | ano | ne | ne |
| Pracuje s platbami a účetními údaji | ano | ne | ne | ano | ne |
| Spravuje uživatele a role | ano | ne | ne | ne | ne |

Údaje u pracovníka přípravy, účetní a správy uživatelů jsou odvozené z popisu rolí a je potřeba je s majitelem potvrdit (viz kapitola 9).

## 4. Funkční požadavky

Požadavky mají prioritu **M** (nutné pro první verzi) nebo **S** (žádoucí, do kompletní verze). Protože je pro klienta nejdůležitější rozpočet, lze S požadavky po dohodě přesunout nebo vypustit.

### 4.1 Evidence vozidel

| ID | Požadavek | Priorita |
|---|---------------------------|------|
| F1 | Vozidlo se jednoznačně identifikuje VIN, eviduje se i SPZ (pokud ji má), výkupní cena a hrubý technický stav. | M |
| F2 | Vozidlo lze založit ještě před fyzickým přivezením, včetně fotografií. | M |
| F3 | Ke každému vozidlu lze přiložit doklady a fotografie (technický průkaz, smlouvy, protokol STK). | M |
| F4 | K vozidlu se evidují náklady (opravy, převoz, příprava) a systém počítá skutečnou pořizovací cenu a marži. | M |
| F5 | Vozidla lze vyhledávat a filtrovat podle stavu, typu prodeje, značky, ceny a doby na ploše. | M |

Vozidlo prochází těmito stavy:

1. **Evidováno** – známe údaje, auto ještě není na ploše.
2. **V přípravě** – auto je na ploše, ale nelze ho ukázat zákazníkovi.
3. **Připraveno k prodeji** – lze ho ukázat a zkušebně jet.
4. **Rezervováno** – auto drží konkrétní zájemce.
5. **Prodáno** – smlouva podepsána, čeká se na předání a vyřízení dokladů.
6. **Předáno** – auto je u zákazníka, běží záruka a hlídá se přepis.
7. **Staženo z prodeje** – např. komitent auto stáhl.

Systém u každého vozidla viditelně ukazuje, zda ho lze zákazníkovi ukázat.

### 4.2 Typy prodeje

| ID | Požadavek | Priorita |
|---|---------------------------|------|
| F6 | Systém rozlišuje vlastní vozidlo, komisní prodej a vozidlo na protiúčet. | M |
| F7 | Výkupní cenu sjednává obchodník nebo majitel, schvaluje ji majitel nebo seniorní obchodník. Dokud není schválena, nelze vozidlo nabídnout. | M |
| F8 | U komisního prodeje se eviduje komitent, minimální prodejní cena a marže a plná moc. Systém nedovolí prodej pod minimální cenou. | M |
| F9 | Cenu protiúčtu schvaluje majitel nebo seniorní obchodník. Vozidlo z protiúčtu se zakládá jako nové vozidlo napojené na původní prodej. | M |

### 4.3 Zájemci, rezervace a zkušební jízdy

| ID | Požadavek | Priorita |
|---|---------------------------|------|
| F10 | U vozidla se evidují zájemci a domluvy: prohlídka, zkušební jízda, podržení, záloha, podpis dokumentu. U každé domluvy je vidět, kdo ji sjednal a kdy. | M |
| F11 | Podržení má individuálně sjednanou dobu platnosti. | M |
| F12 | Vozidlo může mít více zájemců v pořadí. Platnou rezervaci má vždy jen jeden, takže dva obchodníci nemohou slíbit stejné auto. | M |
| F13 | Po vypršení podržení systém upozorní obchodníka a nabídne vozidlo dalšímu zájemci v pořadí. | M |
| F14 | Zkušební jízda eviduje datum, čas, vozidlo a údaje z osobního dokladu zákazníka. Jízdy jsou vidět v kalendáři. | M |

### 4.4 Inzerce a veřejná nabídka

| ID | Požadavek | Priorita |
|---|---------------------------|------|
| F15 | Systém obsahuje veřejnou webovou nabídku s cenou, popisem, technickým stavem a fotografiemi. | M |
| F16 | Ve veřejné nabídce jsou jen vozidla připravená k prodeji. Rezervovaná vozidla jsou označena a prodaná se automaticky skryjí. | M |
| F17 | Zákazník může přes web poslat dotaz nebo si domluvit prohlídku. Obchodník termín potvrzuje. | M |
| F18 | U komisních vozidel nabídka uvádí, že jde o komisní prodej. | M |
| F19 | U vozidla je přehled, kde všude je inzerováno (web, noviny, plakáty) a od kdy, včetně připomínky ke stažení inzerátu po prodeji. | S |

### 4.5 Komunikace se zákazníky

| ID | Požadavek | Priorita |
|---|---------------------------|------|
| F20 | Systém zobrazuje e-maily z firemní schránky a umožňuje je přiřadit k zákazníkovi a vozidlu. | S |
| F21 | U zákazníka je vidět celá historie: zájem, domluvy, nákup, doklady a poprodejní kontakty. | M |

### 4.6 Prodej, doklady a platby

| ID | Požadavek | Priorita |
|---|---------------------------|------|
| F22 | Systém generuje kupní smlouvu a předávací protokol z údajů o vozidle a zákazníkovi. | M |
| F23 | Před předáním systém zkontroluje kontrolní seznam: podepsaná smlouva, technický průkaz, plná moc u komise, zaplaceno, identifikace zákazníka. Bez splnění nelze vozidlo označit jako předané. | M |
| F24 | Eviduje se platba převodem, kartou, hotovostí a úvěrem včetně zálohy. | M |
| F25 | Slevu může zadat jen seniorní obchodník nebo majitel. Každá sleva se zaznamená. | M |
| F26 | Systém je napojen na účetní systém klienta. | M |

### 4.7 Upozornění, přehledy a historie

| ID | Požadavek | Priorita |
|---|---------------------------|------|
| F27 | Upozornění na končící rezervace, nevyřízené doklady před předáním, neprovedený přepis a dlouho neprodaná vozidla. | M |
| F28 | Přehledy prodejů, marží a výkonu obchodníků. | S |
| F29 | Systém zaznamenává, kdo a kdy změnil údaje u vozidla (zejména cenu, stav a slevu). | M |

## 5. Nefunkční požadavky

| ID | Oblast | Požadavek |
|---|-------|-------------------------|
| N1 | Platforma | Webová aplikace dostupná odkudkoli přes prohlížeč, použitelná na počítači, tabletu i telefonu. |
| N2 | Dostupnost | Výpadek v pracovní době nejvýše 1 pracovní den. |
| N3 | Zálohování | Denní záloha dat, ztráta dat nejvýše za 1 den. |
| N4 | Objem dat | Systém zvládne alespoň 300 vozidel v nabídce, 30 prodejů měsíčně a růst bez nutnosti přestavby. |
| N5 | Rychlost | Zjištění, zda je vozidlo volné, a založení rezervace zvládne obchodník během několika vteřin a na pár kliknutí. |
| N6 | Přihlášení | Každý zaměstnanec má vlastní účet (e-mail a heslo). Po odchodu zaměstnance lze účet okamžitě zablokovat. |
| N7 | Oprávnění | Nákupní ceny, náklady a marže nejsou dostupné rolím ani veřejné nabídce, které je vidět nemají. |
| N8 | Uživatelé | Současný provoz 10 zaměstnanců, s rezervou pro růst. |
| N9 | Přechod | Data ze současné tabulky přepíší zaměstnanci ručně, systém k tomu musí nabízet rychlé zakládání vozidel. |

## 6. Legislativní požadavky

Systém má klientovi pomáhat plnit zákonné povinnosti, nenahrazuje však právní poradenství ani odpovědnou osobu klienta. Dva body z rozhovoru se zákonem pravděpodobně nesouhlasí a je potřeba je s klientem vyjasnit (L4 a L5).

| ID | Oblast | Požadavek na systém |
|---|-------|-------------------------|
| L1 | Platby v hotovosti | Klient přijímá hotovost do 100 000 Kč. Systém nedovolí zaevidovat hotovostní platbu nad tento interní limit (zákonný limit je 270 000 Kč za den). |
| L2 | AML – identifikace | Klient zprostředkovává úvěry, je tedy povinnou osobou podle AML zákona. U prodeje na úvěr a u podezřelých obchodů systém vyžaduje identifikaci zákazníka z dokladu totožnosti, jinak prodej nelze dokončit. |
| L3 | AML – archivace | Údaje a doklady o identifikovaných zákaznících a obchodech se uchovávají 10 let a nelze je předčasně smazat. |
| L4 | Komisní prodej | Informace o komisním prodeji a vlastníkovi vozidla musí být uvedena v nabídce a na vozidle, ne až při prohlídce. Systém ji zobrazí ve veřejné nabídce i na tisknutelném štítku za sklo. |
| L5 | Záruka | Klient uvedl záruku 2 měsíce na ojetá vozidla. Spotřebitel má ze zákona právo z vad 24 měsíců, u použitého zboží lze smluvně zkrátit nejvýše na 12 měsíců. Systém eviduje záruční lhůtu u každého prodeje a hlídá její konec. |
| L6 | Stav vozidla | Předávací protokol obsahuje technický stav, stav tachometru a odkaz na doklad z STK. |
| L7 | Přepis | Přepis v registru vozidel musí proběhnout do 10 pracovních dnů. Přepis vyřizují zaměstnanci klienta, systém hlídá termín a upozorní na neprovedený přepis. |
| L8 | Ochrana osobních údajů | Ukládají se jen nezbytné údaje (jméno, adresa, údaje z dokladu). Po uplynutí doby uchování systém umožní údaje anonymizovat, s výjimkou údajů podle L3. Zodpovědnou osobou za GDPR je pověřený zaměstnanec klienta. |

Zdroje: [AML povinnosti autobazarů](https://www.arws.cz/novinky-v-arrows/autobazary-a-aml), [Kupní smlouva na auto a přepis](https://www.autohled.cz/magazin/kupni-smlouva-na-auto-2026-vzor-co-musi-obsahovat/12399), [Práva kupujících ojetých aut](https://www.novinky.cz/clanek/finance-prehledne-na-co-si-dat-pozor-pri-nakupu-ojeteho-auta-40384519), [ČOI k informování o komisním prodeji](https://www.coi.cz/wp-content/uploads/2023/08/23-08-07-ui-coi-z-106.pdf). Lhůtu 12 měsíců u použitého zboží je vhodné ověřit v občanském zákoníku.

## 7. Mimo rozsah projektu

- Automatické publikování inzerátů na externí portály, do novin a na plakáty. Systém eviduje jen, kde inzerát běží (F19).
- Online platba nebo záloha přes veřejný web.
- Automatický převod dat ze současné tabulky. Data přepíší zaměstnanci klienta.
- Vyřízení přepisu v registru vozidel. Systém jen hlídá termín.
- Vlastní účetnictví. Systém předává údaje do stávajícího účetního systému klienta.

## 8. Harmonogram a spolupráce

Systém bude dodán postupně: náhledová verze do 6 měsíců od schválení zadání, kompletní systém nejpozději do 12 měsíců. Termín není pevný, prioritou klienta je dodržení rozpočtu.

1. **Měsíc 1 – upřesnění zadání.** Schválení tohoto dokumentu, návrh obrazovek a jejich odsouhlasení majitelem.
2. **Měsíce 2–6 – první verze.** Všechny požadavky s prioritou M. Na konci předvedení a zkušební provoz s několika vozidly.
3. **Měsíce 7–11 – kompletní verze.** Požadavky s prioritou S podle zbývajícího rozpočtu, opravy z provozu první verze.
4. **Měsíc 12 – předání.** Zaškolení zaměstnanců, ruční převod dat, ostrý provoz.

O požadavcích rozhoduje a hotové části schvaluje majitel. Na začátku projektu budou schůzky podle potřeby. Po dodání první verze navrhujeme kontrolní schůzku alespoň na konci každé fáze, protože jedna schůzka ročně nestačí na včasné zachycení odchylek.

Pokud by hrozilo překročení rozpočtu, sníží se rozsah požadavků s prioritou S, nikoli rozpočet nebo kvalita požadavků M.

## 9. Otevřené body k potvrzení

- ☐ Potvrdit oprávnění pracovníka přípravy, účetní a správu uživatelů (kapitola 3).
- ☐ Které role mohou být seniorní obchodník a jak se do této role zaměstnanec dostane?
- ☐ Záruka 2 měsíce u ojetých vozidel: upravit podmínky v souladu se zákonem (L5).
- ☐ Komisní prodej: souhlas s uváděním informace v nabídce a na vozidle (L4).
- ☐ Prodáváte i nová vozidla? V rozhovoru zazněla záruka 2 roky „u nových“.
- ☐ Název a verze účetního systému, na který se má systém napojit.
- ☐ Je potřeba evidovat číslo řidičského průkazu u všech zákazníků, nebo jen u zkušebních jízd?
- ☐ Kdo bude systém spravovat po dodání a jakou podporu od dodavatele klient požaduje?
- ☐ Výše rozpočtu.
- ☐ Četnost schůzek během vývoje (kapitola 8).
