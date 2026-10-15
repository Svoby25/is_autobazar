# Aktéři a jejich cíle

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 15. 10. 2026 | Jan Svoboda | Pracovní návrh jako podklad pro UC diagram (#9). Analytik ho ověří a dokončí v rámci #8. Připraveno s pomocí AI, ověřeno proti rolím v kap. 3 [zadání v1.0](../02-zadani/zadani-v1.0.md). |

Aktéři vycházejí z rolí v zadání v1.0 a z požadavků v [katalogu](../03-pozadavky/katalog-pozadavku.md). Jeden zaměstnanec může mít více rolí. V systému pak vystupuje jako všichni aktéři, kterým jeho role odpovídají.

## Primární aktéři

Spouštějí případy užití, protože chtějí něčeho dosáhnout.

| Aktér | Cíl v systému | Zdroj | Stav |
| --- | --- | --- | --- |
| Obchodník | Mít v každém okamžiku přehled, které vozidlo lze prodat a co bylo komu slíbeno. Evidovat vozidla, zájemce a domluvy, prodat a předat vozidlo. | O1, kap. 3 | potvrzeno |
| Seniorní obchodník | Totéž co obchodník. Navíc schvaluje výkupní cenu a cenu protiúčtu a poskytuje slevy. | O2, O3, O5 | potvrzeno, způsob přidělení role otevřený (OT2) |
| Majitel | Mít pod kontrolou ceny, slevy a marže, rozhodovat a spravovat zaměstnance v systému. Má všechna oprávnění seniorního obchodníka. | O2, O23, kap. 3 | částečně, správa uživatelů nezvalidována (OT1) |
| Účetní | Evidovat platby a předávat údaje do účetního systému. | O1, O2, O13 | **nezvalidováno** (OT1) |
| Pracovník přípravy | Zapisovat práce a náklady na přípravu vozidla, aby bylo vidět, kdy je vozidlo připravené k prodeji. | O1 | **nezvalidováno** (OT1) |
| Zájemce | Na webu najít vozidlo, zjistit jeho cenu a stav, poslat dotaz nebo si domluvit prohlídku. | O10 | potvrzeno |

## Sekundární aktéři

Systém je využívá nebo jim předává data, sami případ užití nespouštějí.

| Aktér | Role vůči systému | Zdroj | Stav |
| --- | --- | --- | --- |
| Účetní systém | Přijímá údaje o prodejích a platbách (F26). | O13 | potvrzeno, konkrétní systém neznámý (OT6) |
| Firemní e-mailová schránka | Zdroj e-mailů, které se přiřazují k zákazníkovi a vozidlu (F20). | O11 | potvrzeno |

## Kdo aktérem není

- **Komitent** je vlastník vozidla v komisním prodeji. Systém o něm eviduje údaje (F8), ale komitent sám do systému nevstupuje.
- **Zákazník po koupi** do systému nevstupuje. Poprodejní kontakt eviduje obchodník (F21).
- **Čas** jako aktér pro upozornění se nezavádí. Upozornění (F13, F27) si zobrazuje obchodník v rámci svého případu užití.

## Vztahy mezi aktéry

- Seniorní obchodník je specializací obchodníka, umí vše co on a něco navíc.
- Majitel je specializací seniorního obchodníka. Navíc spravuje uživatele, vidí přehledy a pracuje s platbami. Podle tabulky v kap. 3 má i oprávnění účetní, v diagramu je proto přímo napojený na její případy užití.
