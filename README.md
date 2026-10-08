# IS Autobazar

Semestrální projekt pro předmět **NNPSW – Projektování softwarových systémů a UML** na FEI Univerzity Pardubice.

Tým postupně převádí neúplné zákaznické zadání do ověřené analýzy informačního systému pro autobazar. UML diagramy používáme tam, kde pomáhají zadání zpřesnit, vysvětlit nebo ověřit.

## O zadání

Majitel autobazaru potřebuje systém, aby věděl, **které auto může prodat a co bylo komu slíbeno**. Dnes má evidenci rozdělenou mezi tabulku, papírové složky a paměť prodejců. Systém má pokrýt evidenci vozidel (vlastních, komisních i na protiúčet), zájemce a rezervace, zkušební jízdy, skutečné náklady a slevy, inzerci a veřejnou nabídku, přípravu dokladů k prodeji a historii po prodeji.

Aktuální verze zadání, otevřené otázky a rozhodnutí jsou ve složce [`02-zadani`](02-zadani).

## Tým

| Člen | Role | Odpovídá za |
| --- | --- | --- |
| Jitka Rentková | Vedoucí týmu / Product owner | Komunikace se zákazníkem, rozsah, finální rozhodnutí, prezentace milníků |
| Aleš Mareš | Koordinátor | Kanban, termíny, schůzky, dodržování pravidel |
| Martin Špaňúr | Analytik | Požadavky, případy užití, upřesňování se zákazníkem |
| Jan Svoboda | Návrhář | UC diagram, activity, sekvenční a třídní diagramy |
| Jana Šimunůnková | Tester / dokumentarista | Akceptační kritéria, kontrola proti zadání, slovník, finální dokumentace |

Role určuje, za co člen odpovídá, ne že dělá jen to. Úkoly z backlogu si bere každý.

## Struktura repozitáře

```
01-rizeni/          pravidla týmu, registr rizik, statusy, zápisy ze schůzek
02-zadani/          verze zadání, otázky, předpoklady, rozhodnutí
03-pozadavky/       katalog požadavků, slovník pojmů
04-pripady-uziti/   UC diagram, specifikace UC, activity diagramy
05-modely/          sekvenční diagramy, diagram tříd
06-zmeny/           change requesty, analýza dopadu, matice trasovatelnosti
07-prezentace/      podklady k milníkům M1, M2, M3
diagrams/           zdrojové soubory PlantUML (.puml) a vygenerované obrázky
```

## Nástroje

- **Markdown** pro všechny textové artefakty.
- **PlantUML** pro UML diagramy. Zdroj je v `.puml`, obrázek (SVG) leží vedle něj.
- **VS Code** s rozšířeními PlantUML a Markdown Preview, případně GitHub Desktop.
- **GitHub Issues a Projects** jako kanban.
- **Microsoft Teams** jako hlavní komunikační kanál.

## Jak pracujeme

1. Úkol existuje jako **Issue** a na tabuli prochází sloupci *Backlog → K řešení → Rozpracováno → Ke kontrole → Hotovo*.
2. Každý úkol má jednoho řešitele a termín. Nejvýše 2 rozpracované úkoly na člena.
3. Na úkol si založíš **větev** pojmenovanou číslem a názvem úkolu, například `12-slovnik-pojmu`.
4. Hotovou práci pošleš jako **pull request** s textem `Closes #12`.
5. Alespoň jeden další člen PR zkontroluje podle definice „hotovo“ a schválí ho. Teprve pak se sloučí do `main`.

Do větve `main` se nezapisuje přímo.

### Commity

Krátce, česky a s číslem úkolu:

```
Doplněna akceptační kritéria F10–F14 (#15)
```

## Verzování artefaktů

- Každý dokument má na začátku tabulku verzí (verze, datum, autor, změna).
- **v0.x** jsou pracovní verze, **v1.0** je verze schválená týmem nebo odevzdaná na milník. Každá další změna zvyšuje druhé číslo.
- Verze se nepíše do názvu souboru, historii drží Git.
- Stav odevzdaný na milník označíme tagem `M1`, `M2`, `M3`.
- Změnu zadání zpracujeme v jedné větvi. Rozdíl v jejím pull requestu slouží jako podklad pro analýzu dopadu.

## Definice „hotovo“

Výstup je hotový, pokud:

1. je srozumitelný i pro člověka mimo tým,
2. navazuje na předchozí artefakty,
3. používá stejné pojmy jako zadání a slovník,
4. obsahuje otevřené otázky místo domýšlení nepodložených detailů,
5. je použitelný jako vstup do dalšího cvičení,
6. prošel kontrolou dalšího člena týmu.

## Milníky

| Týden | Milník | Obsah |
| --- | --- | --- |
| 8 | **M1 – validace analýzy** | Problém, zákazník, uživatelé, požadavky, hlavní případy užití |
| 12 | **M2 – změna a konzistence** | Zpracování změny zadání, trasovatelnost požadavků, UC, scénářů, sekvencí a tříd |
| 13 | **M3 – finální obhajoba** | Finální dokumentace a individuální obhajoba členů |

Plán po týdnech je v [`01-rizeni`](01-rizeni).

## Komunikace

- Veškerá domluva probíhá v týmu v Teams, ne v soukromých chatech.
- Na zmínku odpovídáme do 24 hodin.
- Jednou týdně krátká schůzka nad kanbanem. Kdo nemůže, napíše předem stav svých úkolů.
- Kdo nestíhá termín, ozve se nejpozději 2 dny předem.
- Při neshodě rozhoduje vedoucí týmu.

## Použití AI

AI používáme jen jako pomocný nástroj, například pro formulaci otázek, návrh struktury nebo hledání rozporů. Výstup AI není potvrzený požadavek zákazníka. U důležitých rozhodnutí v [`02-zadani`](02-zadani) uvádíme, že vznikla s pomocí AI a jak jsme je ověřili.

Repozitář je veřejný, proto sem ani do nástrojů AI nevkládáme osobní nebo citlivé údaje.
