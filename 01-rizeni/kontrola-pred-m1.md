# Kontrola artefaktů podle definice „hotovo“ před M1

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 12. 11. 2026 | Jan Svoboda | První verze (#19). Prověřeno 16 dokumentů a 4 diagramy proti šesti bodům definice „hotovo“ z [README](../README.md). Mechanické kontroly (odkazy, tabulky verzí, osobní údaje, soulad ID) provedeny skriptem, obsahové posouzení ručně s pomocí AI. |

## 1. Co se kontrolovalo

Všech 16 dokumentů v `01-rizeni`, `02-zadani`, `03-pozadavky`, `04-pripady-uziti` a `05-modely` a čtyři diagramy v `diagrams/`. Kontrola proběhla nad stavem `main` **včetně [PR #55](https://github.com/Svoby25/is_autobazar/pull/55)**, který do M1 patří — bez něj by chyběly specifikace UC a doménový model.

Definice „hotovo“ z README má šest bodů. Výstup je hotový, pokud:

1. je srozumitelný i pro člověka mimo tým,
2. navazuje na předchozí artefakty,
3. používá stejné pojmy jako zadání a slovník,
4. obsahuje otevřené otázky místo domýšlení nepodložených detailů,
5. je použitelný jako vstup do dalšího cvičení,
6. prošel kontrolou dalšího člena týmu.

## 2. Souhrn

| Artefakt | 1 | 2 | 3 | 4 | 5 | 6 | Nálezy |
| --- | :-: | :-: | :-: | :-: | :-: | :-: | --- |
| `01-rizeni/plan-semestru.md` | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | N11 |
| `01-rizeni/registr-rizik.md` | ✓ | ✗ | ✓ | ✓ | ✓ | ✓ | N4 |
| `02-zadani/zadani-puvodni.md` | ✓ | — | — | — | ✓ | ✓ | neměnit, bez tabulky verzí záměrně |
| `02-zadani/otazky-a-odpovedi.md` | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | — |
| `02-zadani/zadani-v1.0.md` | ✓ | ✓ | ✗ | ✓ | ✓ | ✓ | N8, N12 |
| `03-pozadavky/katalog-pozadavku.md` | ✓ | ✗ | ✗ | ✓ | ✓ | ✓ | **N1**, N3, N6, N9, N10 |
| `03-pozadavky/slovnik-pojmu.md` | ✓ | ✓ | ✓ | ✓ | ✓ | ✗ | N7, N8, N9 |
| `03-pozadavky/vymezeni-rozsahu.md` | ✓ | ✓ | ✓ | ✓ | ✓ | ✗ | N7 |
| `04-pripady-uziti/akteri.md` | ✓ | ✓ | ✓ | ✓ | ✓ | ✗ | N7 |
| `04-pripady-uziti/pripady-uziti.md` | ✓ | ✗ | ✓ | ✓ | ✓ | ✗ | **N2**, N7 |
| `04-pripady-uziti/vyber-klicovych-uc.md` | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | N5 |
| `04-pripady-uziti/uc05…`, `uc09…`, `uc10…`, `uc19-uc23…` | ✓ | ✓ | ✓ | ✓ | ✓ | ✗ | čekají na review v PR #55 |
| `05-modely/domenovy-model.md` | ✓ | ✓ | ✓ | ✓ | ✓ | ✗ | čeká na review v PR #55 |
| `diagrams/*.puml` + SVG | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | soulad se zdrojem hlídá CI |

✓ splněno, ✗ nález, — nehodnoceno.

**Žádný artefakt nechybí.** Všechny nálezy jsou opravitelné úpravou textu; žádný nevyžaduje přepracování.

## 3. Nálezy

Závažnost: **vysoká** = v odevzdané dokumentaci je nepravdivé tvrzení, **střední** = porušení konvence nebo zastaralý údaj, **nízká** = kosmetika.

### N1 — Souhrnná tabulka katalogu uvádí čísla, která neodpovídají obsahu

**Závažnost: vysoká.** `03-pozadavky/katalog-pozadavku.md`, kapitola 7.

Tabulka tvrdí u funkčních požadavků 14 potvrzeno, 12 částečně, 1 předpoklad a 2 otevřeno. Skutečný stav je **27 potvrzeno a 2 částečně**, žádný předpoklad ani otevřený. U legislativních tvrdí 0 potvrzeno a 3 otevřeno, skutečnost je 7 potvrzeno a 1 částečně.

Autor kapitolu sám nadepsal „~~Souhrn~~ dávno outdated, není třeba?“, ale čísla v ní nechal. Pro M1 je to nejhorší možná kombinace: komisi padne do oka tabulka, která si protiřečí s obsahem o pár stran výš.

**Co s tím:** přepočítat, nebo kapitolu zrušit. Otazník v nadpisu není rozhodnutí.

### N2 — Přehled UC tvrdí, že zodpovězené otázky jsou otevřené

**Závažnost: vysoká.** `04-pripady-uziti/pripady-uziti.md`, řádky 46, 47, 56, 66, 70, 80, 81.

| Místo | Tvrzení | Skutečnost |
| --- | --- | --- |
| UC04, UC28 | „Nezvalidováno (OT1).“ | OT1 zodpovězena: uživatele spravuje majitel. |
| UC14 | „F18 a L4 jsou otevřené (OT4).“ | OT4 zodpovězena, oba požadavky mají stav *potvrzeno*. |
| UC24 | „F24 a L1 jsou otevřené (OT3).“ | OT3 zodpovězena, L1 je *potvrzeno*, F24 *částečně*. |
| UC05 | „Stavy jsou předpoklad (OT11).“ | OT11 zodpovězena, přechody popisuje specifikace UC05. |

Dokument tím podhodnocuje, jak daleko analýza je. Část otázek u UC24 („kdo eviduje zálohu“) platí dál a má zůstat.

**Co s tím:** projít poznámky a srovnat je se stavy v katalogu v0.4.

### N3 — Katalog vede OT2 jako otevřenou, přitom je zodpovězená

**Závažnost: střední.** `03-pozadavky/katalog-pozadavku.md`, kapitola 2.8, řádek 103.

„Jak se zaměstnanec stane seniorním obchodníkem: **otevřeno** (OT2).“ Odpověď v kapitole 6 říká, že o roli rozhoduje majitel. Slovník už opraven v v0.2, katalog ne.

### N4 — Registr rizik popisuje rozpory, které jsou vyřešené

**Závažnost: střední.** `01-rizeni/registr-rizik.md`, riziko R2.

Tvrdí, že si navzájem odporují platby (OT3), komisní prodej (OT4) a záruka (OT5). OT3 i OT4 jsou zodpovězené a požadavky z nich mají stav *potvrzeno*; rozpor zůstal jen u OT5. Opatření („rozporné požadavky mají stav otevřeno a nesmí z nich vycházet scénář“) platí dál, jen se zúžilo na jediný případ.

Plán semestru ukládá revizi registru **týdně**; poslední je z 22. 10.

### N5 — Výběr klíčových UC nemá tabulku verzí

**Závažnost: střední.** `04-pripady-uziti/vyber-klicovych-uc.md`.

Konvence z CLAUDE.md i README žádá tabulku verzí u každého dokumentu. Tenhle ji nemá jako jediný z artefaktů analýzy, přitom je to podklad pro výběr v M1 a bude se na něj odkazovat u obhajoby.

### N6 — Tabulka verzí katalogu má duplicitní číslo a není seřazená

**Závažnost: střední.** `03-pozadavky/katalog-pozadavku.md`, řádky 5–9.

Pořadí verzí je 0.2, 0.1, 0.2, 0.3, 0.4. Verze **0.2 je uvedena dvakrát** pro dvě různé změny od dvou autorů ze stejného dne. Nejde poznat, která byla dřív a co vlastně obsahuje „verze 0.2“.

**Co s tím:** přečíslovat tak, aby každá verze byla jednou, a seřadit vzestupně. Obsah řádků neměnit.

### N7 — Tři artefakty neprošly kontrolou dalšího člena týmu

**Závažnost: střední.** Bod 6 definice „hotovo“.

| Artefakt | Pull request | Schválení |
| --- | --- | --- |
| `03-pozadavky/slovnik-pojmu.md` | #44 | žádné |
| `03-pozadavky/vymezeni-rozsahu.md` | #45 | žádné |
| `04-pripady-uziti/akteri.md`, `pripady-uziti.md`, UC diagram | #43 | žádné |

Všechny tři byly sloučeny bez schválení — tehdy ještě `main` nebyla chráněná. Slovník je přitom závazný pro všechny ostatní artefakty.

Dokumenty z PR #55 jsou ve stejné situaci, ale ta se vyřeší jeho schválením.

### N8 — Pojem „klient“ není ve slovníku

**Závažnost: nízká.** `02-zadani/zadani-v1.0.md` (kap. 4, 6), `03-pozadavky/katalog-pozadavku.md` (L1, L2, L5, F26).

Zadání i katalog používají **klient** pro majitele autobazaru, tedy objednatele systému, zatímco **zákazník** je ten, kdo kupuje vozidlo. Slovník zná jen *Zákazníka* a definuje ho jako kupujícího. Čtenář zvenčí si u věty „Klient přijímá hotovost do 100 000 Kč“ musí domyslet, že řeč je o autobazaru, ne o kupujícím.

### N9 — Pojem „obchodní zástupce“ není ve slovníku

**Závažnost: nízká.** `03-pozadavky/katalog-pozadavku.md`, poznámka u F12 a odpověď na OT12.

Zákazník v odpovědi na OT12 mluví o „přiřazeném obchodním zástupci“. Slovník má roli **Obchodník**. Jestli jde o totéž, nebo o novou roli s odpovědností za konkrétní vozidlo, není nikde rozhodnuto — a přitom právě na téhle roli stojí odpověď, která měla uzavřít vztah podržení a rezervace.

### N10 — Katalog slibuje upřesnění, které už proběhlo

**Závažnost: nízká.** `03-pozadavky/katalog-pozadavku.md`, kapitola 2.1.

„Stav *Staženo z prodeje* a přesné přechody mezi stavy navrhl tým a jsou předpoklad (OT11). Upřesní je activity diagramy v týdnu 6.“ Activity diagramy existují a přechody popisuje specifikace UC05.

### N11 — Plán semestru nemá tabulku verzí

**Závažnost: nízká.** `01-rizeni/plan-semestru.md`. Totéž co N5. Plán se podle vlastního textu „může posunout asi o týden“, takže historie změn dává smysl.

### N12 — Zadání v1.0 používá „auto“ místo „vozidlo“

**Závažnost: nízká.** `02-zadani/zadani-v1.0.md`, kapitola 4.1 (výčet stavů).

Slovník má pojem **Vozidlo**. V popisu problému v kapitole 2 je „auto“ citací zákazníka a je v pořádku; ve výčtu stavů je to ale definiční text, který se pak promítá do katalogu i modelu.

## 4. Kontrola osobních a citlivých údajů

Repozitář je veřejný, proto proběhla zvlášť. Prohledány všechny dokumenty i diagramy na e-mailové adresy, telefonní čísla, rodná čísla, IČO/DIČ a sedmnáctimístné VIN.

**Nic nenalezeno.** Jediné osobní údaje v repozitáři jsou jména členů týmu v README a v tabulkách verzí, což je u školního projektu v pořádku a nutné pro autorství. Příklady v dokumentech pracují s obecnými popisy, ne s konkrétními lidmi ani vozidly.

## 5. Co do M1 a co po něm

Do M1 se nic z toho opravit nestihlo — kontrola proběhla v den milníku. Na všechny nálezy jsou založené issues:

| Issue | Nálezy | Role | Proč tahle skupina |
| --- | --- | --- | --- |
| [#57](https://github.com/Svoby25/is_autobazar/issues/57) Souhrnná tabulka katalogu | N1 | Analytik | Samostatně, protože vyžaduje rozhodnutí: přepočítat, nebo zrušit. |
| [#56](https://github.com/Svoby25/is_autobazar/issues/56) Zastaralá tvrzení o zodpovězených otázkách | N2, N3, N4, N10 | Analytik | Jeden průchod podle kapitoly 6 katalogu. Nejvíc vidět u obhajoby. |
| [#58](https://github.com/Svoby25/is_autobazar/issues/58) Tabulky verzí | N5, N6, N11 | Dokumentarista | Konvence, mechanická oprava. |
| [#59](https://github.com/Svoby25/is_autobazar/issues/59) Pojmy klient a obchodní zástupce | N8, N9, N12 | Dokumentarista | Dotýká se slovníku, který je závazný pro ostatní artefakty. |
| [#60](https://github.com/Svoby25/is_autobazar/issues/60) Dodatečná kontrola tří artefaktů | N7 | kdokoli kromě autora | Potřebuje druhého člověka, ne opravu textu. |

Nejvyšší prioritu mají **N1 a N2**. Obojí je nepravdivé tvrzení v dokumentu, na který se při obhajobě ukazuje, a obojí je otázka patnácti minut.

## 6. Co kontrola nepokrývá

- **Věcnou správnost vůči zákazníkovi.** Kontrola ověřuje vnitřní konzistenci artefaktů, ne jestli zákazník opravdu chce to, co je zapsané. To je předmět samotné validace na M1.
- **Úplnost analýzy.** Neposuzuje, jestli 46 požadavků pokrývá celý problém.
- **Kvalitu diagramů.** CI hlídá, že SVG odpovídá zdroji, ne že je diagram správně navržený.
