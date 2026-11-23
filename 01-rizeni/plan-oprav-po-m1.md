# Připomínky z M1 a plán oprav

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 23. 11. 2026 | Jan Svoboda | První verze (#20). Zaznamenán stav připomínek z M1 a sestaven plán oprav z nálezů vlastní kontroly a z review pull requestů #62 a #63. Připraveno s pomocí AI. Podle plánu semestru úkol patří koordinátorovi — **rozdělení řešitelů a termínů níže je návrh ke schválení**, ne hotové rozhodnutí. |

## 1. Připomínky z M1

Prezentace M1 proběhla **19. 11. 2026** (#18). K dnešnímu dni **nejsou zapsané žádné připomínky vyučujícího ani týmu** — ani v issue #20, ani jinde v repozitáři.

Je to zapsáno tak, jak to je, včetně nepříjemné části: nedá se odlišit, jestli žádné připomínky nepadly, nebo jestli padly a nikdo si je nezapsal. Prezentaci vedla vedoucí týmu, takže poznámky mohly skončit u ní. Doporučení: ověřit v Teams dřív, než se tenhle dokument uzavře jako konečný.

**Co z toho plyne pro plán:** opravy se neodvozují od připomínek zvenčí, ale od **vlastní kontroly artefaktů** podle definice „hotovo“ ([`kontrola-pred-m1.md`](kontrola-pred-m1.md), #19) a z review pull requestů otevřených v týdnu 9. Materiálu je dost — žádný z dvanácti nálezů kontroly zatím opravený není.

## 2. Co se bude opravovat

### 2.1 Z kontroly před M1

| Issue | Co | Artefakty | Role | Termín |
| --- | --- | --- | --- | --- |
| [#57](https://github.com/Svoby25/is_autobazar/issues/57) | Souhrnná tabulka katalogu uvádí čísla, která neodpovídají obsahu | `katalog-pozadavku.md` kap. 7 | Analytik | **26. 11.** (týden 10) |
| [#56](https://github.com/Svoby25/is_autobazar/issues/56) | Zastaralá tvrzení o zodpovězených otázkách | `pripady-uziti.md`, `katalog-pozadavku.md`, `registr-rizik.md` | Analytik | **26. 11.** (týden 10) |
| [#59](https://github.com/Svoby25/is_autobazar/issues/59) | Pojmy *klient* a *obchodní zástupce* mimo slovník | `slovnik-pojmu.md`, `zadani-v1.0.md` | Dokumentarista | 3. 12. (týden 11) |
| [#58](https://github.com/Svoby25/is_autobazar/issues/58) | Chybějící a rozbité tabulky verzí | `vyber-klicovych-uc.md`, `plan-semestru.md`, `katalog-pozadavku.md` | Dokumentarista | 3. 12. (týden 11) |
| [#60](https://github.com/Svoby25/is_autobazar/issues/60) | Tři artefakty neprošly kontrolou dalšího člena | `slovnik-pojmu.md`, `vymezeni-rozsahu.md`, `akteri.md`, `pripady-uziti.md` | kdokoli kromě autora | 3. 12. (týden 11) |

**#57 a #56 mají přednost.** Obojí je nepravdivé tvrzení v dokumentu, na který se u M2 bude ukazovat, a obojí je práce na patnáct minut. Kdyby se mělo něco odložit, tak ne tyhle dvě.

### 2.2 Z review pull requestů v týdnu 9

Oba pull requesty byly otevřené 19. 11. a nálezy jsou v jejich komentářích.

| Zdroj | Co | Závažnost | Role | Termín |
| --- | --- | --- | --- | --- |
| [#62](https://github.com/Svoby25/is_autobazar/pull/62) | Sekvenční diagram UC10 ověřuje platnou rezervaci jen na začátku, ne znovu při ukládání. Ukazuje průběh, který nevylučuje dvojí příslib — tedy hlavní riziko ze zadání. Rozchází se se scénářem E1 v [UC10](../04-pripady-uziti/uc10-podrzet-vozidlo.md) a s kritériem F12/4. | **blokující** | Návrhář | 26. 11. |
| [#62](https://github.com/Svoby25/is_autobazar/pull/62) | UC01 není mezi klíčovými UC; hlavičky odkazují na složku místo na konkrétní soubor specifikace | nízká | Návrhář | 26. 11. |
| [#63](https://github.com/Svoby25/is_autobazar/pull/63) | CRC model zavádí třídu *Pobočka* (zadání mluví o jedné provozovně), pojmy mimo slovník (`ZajemOVozidlo`, `Uzivatel`, `ZkusebniJizda`), Zákazníka definuje tak, že zahrnuje zájemce, a u Rezervace rozhoduje OT12 | **vysoká** | Analytik + Dokumentarista | 3. 12. |

Nález u #63 není oprava jednoho řádku — jsou to dva modely tříd s různými pojmy. Patří do **#24 (sjednocení pojmů)**, které tím dostává podstatně víc práce, než plán předpokládal. Doporučení: dolaďovat CRC model vedle [`domenovy-model.md`](../05-modely/domenovy-model.md), ne nezávisle.

### 2.3 Nedodělek z týdne 9

[#22 Opravit scénáře a model tříd podle sekvencí](https://github.com/Svoby25/is_autobazar/issues/22) zatím nezačalo, protože sekvenční diagramy nejsou sloučené. Jakmile #62 projde, je to první věc na řadě — a nález o souběhu z 2.2 je přesně to, co #22 má zachytit.

## 3. Co se vědomě neřeší

| Co | Proč ne |
| --- | --- |
| [#38](https://github.com/Svoby25/is_autobazar/issues/38) poslední bod — kontrola diagramů jako povinná pro `main` | Rozhodnuto nezapínat. Workflow funguje a chybu spolehlivě najde; červené CI ale merge nezastaví, zastaví ho jen povinné review. Riziko je vědomé a je v registru. |
| Nález N12 — „auto“ místo „vozidlo“ v `zadani-v1.0.md` kap. 4.1 | Kosmetika v dokumentu, který je ve verzi 1.0 a odkazuje se na něj z ostatních artefaktů. Přečíslování kvůli jednomu slovu nemá cenu; vyřeší se, až se zadání bude měnit kvůli change requestu (#25). |
| Nález N7 u dokumentů z #55 a #61 | Vyřešeno jejich schválením a sloučením 23. 11. |

## 4. Jak to zapadá do plánu

| Týden | Datum | Původně v plánu | Přibývá z tohoto plánu |
| --- | --- | --- | --- |
| 10 | 26. 11. | #23 konsolidovaný diagram tříd, #24 popis tříd a sjednocení pojmů | #57, #56, oprava #62 |
| 11 | 3. 12. | #25 change request, #26 analýza dopadu, #27 aktualizace artefaktů | #59, #58, #60, nález #63 |
| 12 | 10. 12. | **#28 matice trasovatelnosti**, #29 prezentace M2, #30 osnova závěrečné | — |

Týden 11 je přetížený: ke třem úkolům change requestu přibývají čtyři opravy. Pokud se bude muset něco posunout, posouvají se **#58 a #60** — tabulky verzí a dodatečná kontrola nejsou vstupem pro matici trasovatelnosti, kdežto sjednocení pojmů (#59, #24) ano.

**Tvrdý termín je matice trasovatelnosti #28.** Trasuje požadavek → UC → scénář → sekvence → třída, takže potřebuje všechny články v `main`. Dnešním sloučením #55 a #61 tam jsou požadavky, UC i scénáře; **chybí sekvence (#62) a konsolidovaný model tříd (#63, #23)**. Dokud tyhle dva pull requesty visí, matici nemá z čeho sestavit — a je to poslední položka před prezentací M2, takže ji nelze odložit.

## 5. Co tento plán nepokrývá

- **Připomínky, které možná padly a nebyly zapsané.** Kapitola 1 to přiznává; dokument je potřeba doplnit, jakmile se u vedoucí ověří, jestli něco má.
- **Věcnou správnost vůči zákazníkovi.** Nálezy jsou o vnitřní konzistenci artefaktů, ne o tom, zda zákazník chce to, co je zapsané.
- **Rozdělení práce.** Role u úkolů jsou převzaté ze zadání issues a z plánu semestru. Konkrétní řešitele přiděluje koordinátor na schůzce nad kanbanem.
