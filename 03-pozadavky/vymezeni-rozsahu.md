# Vymezení rozsahu a hranic systému

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 22. 10. 2026 | Vedoucí (rentkova) | První verze. Převzato z přílohy v issue #7 beze změny obsahu, doplněna tabulka verzí a odkazy na navazující dokumenty. |

Navazuje na [zadání v1.0](../02-zadani/zadani-v1.0.md) a [katalog požadavků](katalog-pozadavku.md). Pojmy jsou ve [slovníku](slovnik-pojmu.md). Dokument je podkladem pro hranici systému v Use Case diagramu (#9).

## 1. Co je uvnitř systému

Systém představuje webovou aplikaci s interní částí pro zaměstnance a veřejnou nabídkou vozidel. Funkce s prioritou **M** jsou určeny pro první verzi; funkce **S** pro kompletní verzi podle schváleného rozpočtu.

| Oblast | Funkce | Požadavky |
|---|---|---|
| Evidence vozidel | VIN, SPZ, stav, fotografie, doklady, náklady, marže, vyhledávání a životní cyklus | F1–F5 (M) |
| Typy prodeje | Vlastní, komisní a protiúčtový prodej; schvalování cen | F6–F9 (M) |
| Zájemci a rezervace | Evidence domluv, rezervací, pořadí zájemců, zkušebních jízd a kalendáře | F10–F14 (M) |
| Veřejná nabídka | Nabídka vozidel, dostupnost, dotazy a žádosti o prohlídku | F15–F18 (M) |
| Externí inzerce | Evidence inzertních míst a upozornění na stažení | F19 (S) |
| Komunikace | Firemní e-maily přiřazené k zákazníkům a vozidlům | F20 (S) |
| Historie zákazníků | Zájem, domluvy, nákupy, doklady, poprodejní kontakty | F21 (M) |
| Prodej | Smlouvy, předávací protokoly, kontrolní seznam, evidence plateb a slev | F22–F25 (M) |
| Účetnictví | Napojení na existující účetní systém | F26 (M) |
| Kontroly | Upozornění na rezervace, doklady, přepis a dlouho neprodaná vozidla | F27 (M) |
| Statistiky | Přehled prodejů, marží a výkonu obchodníků | F28 (S) |
| Audit | Historie změn vozidel včetně uživatele a času | F29 (M) |

Součástí jsou také přihlášení, správa rolí a oprávnění, zálohování a ochrana osobních údajů podle nefunkčních a legislativních požadavků zadání. Přesná oprávnění některých rolí a vybraná právní pravidla vyžadují potvrzení.

## 2. Co je mimo rozsah

Navazuje na kapitolu **7. Mimo rozsah projektu** v zadání v1.0. U položek bez výslovného potvrzení zákazníkem jde o návrh týmu, nikoli o definitivně odsouhlasené vyloučení.

| ID | Mimo rozsah | Důvod a co systém dělá místo toho | Původ rozhodnutí |
|---|---|---|---|
| O1 | Automatické publikování a stahování inzerátů z externích portálů, novin a plakátů | Systém pouze eviduje inzertní místa a upozorňuje na stažení (F19). | **Návrh týmu – potvrdit** |
| O2 | Online platby a zálohy přes veřejný web | Systém platby eviduje (F24), ale neobsahuje veřejnou platební bránu. | **Návrh týmu – potvrdit** |
| O3 | Automatický import ze stávajících tabulek | Data ručně přepíší zaměstnanci; zákazník tento postup uvedl v rozhovoru. | **Potvrzeno zákazníkem** |
| O4 | Samotné vyřízení přepisu v registru vozidel | Přepis provádějí zaměstnanci; systém pouze sleduje termín a upozorňuje. | **Potvrzeno zákazníkem** |
| O5 | Vývoj vlastního účetního systému | Požadováno je napojení na stávající účetnictví (F26), nikoli jeho náhrada. | **Návrh týmu – potvrdit** |

**Další hranice odpovědnosti:** Fyzické opravy a příprava aut, provedení zkušební jízdy, podpis a předání vozidla, uskutečnění bankovní transakce a právní posouzení dokumentů probíhají mimo software. Aplikace může tyto úkony evidovat nebo kontrolovat, nikoli sama fyzicky provést.

## 3. Aktéři a okolní systémy

### 3.1 Lidské role

| Aktér | Interakce |
|---|---|
| Majitel | Schvalování cen, slevy, správa uživatelů, přehledy |
| Seniorní obchodník | Schvalování výkupu a protiúčtu, slevy, obchodní agenda |
| Obchodník | Vozidla, zákazníci, rezervace, jízdy, prodejní doklady |
| Účetní | Platby, náklady a účetní údaje |
| Pracovník přípravy | Evidence přípravy, prací a nákladů |
| Zákazník / zájemce | Prohlížení nabídky, dotaz, žádost o prohlídku |

Jeden zaměstnanec může mít více rolí. Některá oprávnění účetní, pracovníka přípravy a správce uživatelů jsou v zadání **odvozena týmem a čekají na potvrzení**.

### 3.2 Externí systémy

| Systém | Vazba | Stav |
|---|---|---|
| Stávající účetní systém | Přenos účetních údajů (F26) | Integrace požadována; název, verze a rozhraní neznámé |
| Firemní e-mailová služba | Načítání zpráv (F20) | Požadováno jako S; technické řešení neznámé |
| Externí inzertní portály | Bez automatické integrace; pouze ruční evidence inzerce | Navržená hranice, potvrdit |
| Registr silničních vozidel | Bez přímého napojení; pouze evidence a hlídání termínu | Přepis zajišťují zaměstnanci |
| Banky / platební služby | Evidence plateb, nikoli potvrzené API | Přímé propojení není specifikováno |
| Původní tabulky | Zdroj pro ruční přepis dat | Potvrzeno zákazníkem |

Do UC diagramu patří jako externí systémový aktér jen ten systém, který **přímo komunikuje** s navrhovanou aplikací. Samotná existence okolní služby nestačí.

## 4. Otevřené otázky

1. Potvrzuje zákazník vyloučení automatického publikování a stahování inzerátů?
2. Potvrzuje zákazník, že nebude možné zaplatit nebo složit zálohu přes veřejný web?
3. Jaký účetní systém klient používá a jaké poskytuje integrační rozhraní?
4. Jaká firemní e-mailová služba se používá a jak bude probíhat načítání zpráv?
5. Jaká jsou přesná oprávnění účetní, pracovníka přípravy a správce uživatelů?
6. Jak se přiděluje role seniorního obchodníka?
7. Prodává autobazar také nová vozidla?
8. Jak se potvrdí zákonná pravidla komisního prodeje a záručních lhůt (L4, L5)?
9. Kdy je potřeba číslo řidičského průkazu a jak dlouho se uchovává?
10. Kdo bude systém po předání spravovat a jaká podpora je požadována?
11. Které funkce priority S budou schváleny v rámci rozpočtu?
12. Potvrzuje zákazník, že se nebude vyvíjet vlastní účetní systém?

## 5. Pravidla pro UC diagram (týden 5)

**Název hranice systému:** `Informační systém autobazaru`.

- **Uvnitř obdélníku:** případy užití jako „Založit vozidlo“, „Schválit výkupní cenu“, „Vytvořit rezervaci“, „Naplánovat zkušební jízdu“, „Zobrazit nabídku“, „Odeslat dotaz“, „Vygenerovat smlouvu“, „Evidovat platbu“, „Předat účetní údaje“ nebo „Spravovat uživatele“.
- **Vně obdélníku:** majitel, seniorní obchodník, obchodník, účetní, pracovník přípravy, zákazník a přímo integrované externí systémy.
- **Nezobrazovat jako funkci systému:** fyzickou opravu auta, samotnou zkušební jízdu, fyzické předání, úřední přepis ani vedení externího účetnictví.
- **Rozlišit fáze:** M v základním diagramu, S případně v samostatném diagramu rozšíření.
- **Označit nejistoty:** nepotvrzené integrace, oprávnění a rozhodnutí o rozsahu nejsou definitivní.

## 6. Závěr

Systém zajišťuje **evidenci, koordinaci a kontrolu procesů autobazaru** od založení vozidla přes rezervaci a prodej až po poprodejní evidenci. Nenahrazuje fyzické činnosti zaměstnanců, úřední procesy ani externí účetnictví. Tento dokument je **pracovní podklad pro hranici UC diagramu**; otevřené otázky je nutné potvrdit se zákazníkem.
