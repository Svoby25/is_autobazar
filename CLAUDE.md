# Kontext projektu pro Claude Code

## Co je to za projekt

Týmová semestrální analýza pro předmět **NNPSW – Projektování softwarových systémů a UML** (FEI, Univerzita Pardubice), tým 5 lidí. Úkolem není software naprogramovat, ale převést neúplné zákaznické zadání (informační systém pro autobazar) do ověřené analýzy: zadání, katalog požadavků, slovník, Use Case diagram a specifikace UC, activity a sekvenční diagramy, doménový model tříd, plán práce, rizika a zpracování změny zadání.

Hodnotí se tři milníky: M1 validace analýzy (týden 8), M2 změna a konzistence (týden 12), M3 finální obhajoba (týden 13). Plán po týdnech je v `01-rizeni/plan-semestru.md`.

## Klíčové soubory

- `02-zadani/zadani-puvodni.md` – původní text zadání, neměnit.
- `02-zadani/otazky-a-odpovedi.md` – otázky na zákazníka a jeho odpovědi (zdroj pravdy o tom, co zákazník řekl).
- `02-zadani/zadani-v1.0.md` – zadání v1.0: role, funkční požadavky F1–F29, nefunkční N1–N9, legislativní L1–L8, mimo rozsah, harmonogram, otevřené body.
- `01-rizeni/plan-semestru.md` – backlog na celý semestr.
- `README.md` – pravidla týmu, workflow, verzování, definice hotovo.

## Konvence

- Všechny dokumenty česky, v Markdownu. Diagramy v PlantUML (`.puml` v `diagrams/`), vygenerované SVG vedle zdroje.
- Každý dokument začíná tabulkou verzí (verze, datum, autor, změna). v0.x pracovní, v1.0 schválená. Verze se nepíše do názvu souboru.
- ID požadavků: F (funkční), N (nefunkční), L (legislativní). Priorita M = první verze, S = kompletní verze. ID se nemění ani po přečíslování dokumentu, kvůli trasovatelnosti.
- Používej pojmy ze zadání a slovníku (vozidlo, komisní prodej, protiúčet, podržení, rezervace, zájemce, komitent, seniorní obchodník…). Nevymýšlej synonyma.
- Práce přes větve a pull requesty, `main` je chráněná. Commit zprávy česky s číslem úkolu, např. `Doplněna akceptační kritéria F10–F14 (#15)`.

## Pravidla předmětu pro AI (důležité)

- Výstup AI není potvrzený požadavek zákazníka. Co zákazník neřekl, zapiš jako otevřenou otázku nebo předpoklad, ne jako fakt.
- Definice „hotovo“ vyžaduje otevřené otázky místo domýšlení nepodložených detailů.
- U důležitých rozhodnutí, na kterých se podílela AI, uveď v tabulce verzí nebo v seznamu rozhodnutí, že vznikla s pomocí AI a jak byla ověřena.
- Repozitář je veřejný: žádné osobní ani citlivé údaje.

## Stav k 8. 10. 2026 (týden 3)

Hotovo: otázky a odpovědi zákazníka, zadání v1.0, plán semestru, README.

Nezvalidováno zákazníkem (vedeno jako otevřené body v kap. 9 zadání):
- Oprávnění pracovníka přípravy, účetní a správa uživatelů (tabulka rolí je částečně odvozená).
- L1–L8 doplnil tým z legislativy. Dva body pravděpodobně kolidují s odpověďmi zákazníka: záruka 2 měsíce u ojetých aut (zákon: 24 měsíců, u použitého zboží lze smluvně zkrátit na 12) a informace o komisním prodeji až při prohlídce.
- Rozpor platby: převod a karta (odp. 13) vs. hotovost do 100 000 Kč (odp. 26).
- Prodává autobazar i nová auta? (odp. 28)

Nerozhodnuto: kanban v GitHub Projects, nebo v Microsoft Planneru (README počítá s GitHub Projects). Jména členů v README jsou zatím prázdná.

## Další krok (týden 4)

Z `zadani-v1.0.md` vytvořit `03-pozadavky/katalog-pozadavku.md` (v0.1) s akceptačními kritérii a `03-pozadavky/slovnik-pojmu.md`. Dál viz plán semestru.
