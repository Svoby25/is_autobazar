# UC09 Zaevidovat zájemce a domluvu

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 12. 11. 2026 | Jan Svoboda | První verze specifikace (#11). Scénáře odvozeny z F10, F14 a odpovědí O6, O8 a OT7. Připraveno s pomocí AI, každý krok ověřen proti konkrétnímu požadavku nebo odpovědi zákazníka; co se ověřit nedalo, je vedeno jako otevřená otázka v kap. 7. |

## 1. Identifikace

| Položka | Hodnota |
| --- | --- |
| **ID a název** | UC09 Zaevidovat zájemce a domluvu |
| **Primární aktér** | Obchodník |
| **Spouštěč** | Zájemce projevil o konkrétní vozidlo zájem — osobně, telefonicky, nebo přes veřejnou nabídku (UC15). |
| **Vstupní podmínka** | Uživatel je přihlášen (N6) a vozidlo je v systému evidováno (F1). |
| **Výstupní podmínka — úspěch** | U vozidla je zaevidovaný zájemce a jeho domluva včetně druhu, obsahu, autora a času (F10). Domluva je dohledatelná i v nepřítomnosti obchodníka, který ji sjednal. |
| **Výstupní podmínka — neúspěch** | Domluva není uložena a obchodník ví, který údaj chybí. |

## 2. Pokryté požadavky

| Požadavek | Jak se v UC projevuje |
| --- | --- |
| F10 | Evidence zájemce a domluvy typu prohlídka, zkušební jízda, podržení, záloha, podpis dokumentu, s autorem a časem. |
| F14 | Zkušební jízda jako zvláštní druh domluvy s datem, časem, vozidlem a údaji z dokladu. |
| F21 | Zaevidovaná domluva se objeví v historii zákazníka. |
| L8 | Ukládají se jen nezbytné osobní údaje. |

Tento UC řeší **záznam domluvy**. Vznik platného závazku vůči zájemci, tedy podržení a rezervaci, řeší UC10. Zápis domluvy typu *podržení* v tomto UC sám o sobě nevytváří platnou rezervaci (viz Q9.1).

## 3. Hlavní scénář

1. Obchodník otevře detail vozidla a zvolí přidání zájemce.
2. Systém nabídne vyhledání existujícího zájemce nebo založení nového.
3. Obchodník zájemce vybere nebo zadá jeho údaje.
4. Systém zájemce přiřadí k vozidlu.
5. Obchodník zvolí druh domluvy: prohlídka, zkušební jízda, podržení, záloha, nebo podpis dokumentu (F10, O6).
6. Obchodník doplní obsah domluvy — co bylo se zájemcem sjednáno.
7. Systém uloží domluvu a zaznamená, kdo ji sjednal a kdy (F10/3).
8. Systém zobrazí u vozidla seznam zájemců a jejich domluv a totéž promítne do historie zákazníka (F21).

## 4. Alternativní scénáře

**A1 — Zájemce už v systému je.** V kroku 3 obchodník vybere existujícího zájemce. Systém u něj zobrazí vozidla, o která už zájem projevil, aby bylo vidět, že jde o téhož člověka. Scénář pokračuje krokem 4.

**A2 — Domluva typu zkušební jízda.** V kroku 6 systém navíc vyžaduje datum, čas a údaje z osobního dokladu zájemce (F14/1, F14/2). Podle odpovědi na OT7 se číslo řidičského průkazu eviduje **jen u zkušebních jízd**, spolu se jménem a kontaktem; u ostatních druhů domluv se nevyžaduje. Naplánovaná jízda se zobrazí v kalendáři (F14/3). Kalendář navrhl tým, zákazník ho nepotvrdil.

**A3 — Domluva typu podržení.** V kroku 6 obchodník zaznamená, že se zájemcem domluvil podržení vozidla. Vlastní vytvoření podržení s dobou platnosti probíhá v UC10, na který systém naváže. Dokud UC10 neproběhne, vozidlo není rezervované.

**A4 — Domluva typu záloha.** V kroku 6 obchodník zaznamená přijetí zálohy. Evidenci samotné platby řeší UC24 (F24). Jaký účinek má záloha na vznik rezervace, zákazník neurčil ani v odpovědi na OT12 (viz Q9.1).

**A5 — Jeden zájemce u více vozidel.** Zájemce může mít domluvy u několika vozidel současně. Systém mu nebrání být zároveň v pořadí u více vozidel; pořadí patří vozidlu, nikoli zájemci.

**A6 — Více domluv u jednoho vozidla.** K témuž vozidlu lze zaevidovat domluvy několika zájemců. Omezení na jeden platný závazek se týká jen rezervace (F12), nikoli počtu domluv.

## 5. Chybové scénáře

**E1 — Neúplné údaje zájemce.** V kroku 4 systém zjistí, že chybí údaj potřebný k identifikaci zájemce. Zájemce neuloží a označí chybějící pole. Které údaje jsou u pouhého zájemce povinné, zadání neurčuje (Q9.2).

**E2 — Chybí druh domluvy.** V kroku 7 systém odmítne uložit domluvu bez zvoleného druhu, protože by nešlo rozlišit prohlídku od podržení.

**E3 — Zkušební jízda bez údajů z dokladu.** V kroku 6 ve variantě A2 systém odmítne uložit jízdu bez data, času a údajů z dokladu (F14/1, F14/2).

**E4 — Zkušební jízda u vozidla, které nelze ukázat.** Vozidlo není ve stavu *Připraveno k prodeji*. Systém na to upozorní. Zda jízdu zakázat, nebo jen upozornit, zadání neuvádí (Q9.3).

**E5 — Vozidlo je už prodané nebo předané.** V kroku 1 systém upozorní, že vozidlo není v nabídce. Evidence domluvy se nezakazuje — poprodejní kontakt je podle F21 legitimní —, ale obchodník vidí, v jakém stavu vozidlo je.

## 6. Hranice případu užití

Tento UC **neřeší**:

- vznik platného podržení a práci s pořadím zájemců (UC10, UC12),
- evidenci platby včetně zálohy (UC24),
- potvrzení termínu prohlídky požadovaného z webu (UC13),
- rozhodnutí, kdy se ze zájemce stává zákazník. Slovník oba pojmy odlišuje a jejich vztah vede jako otevřený.

## 7. Otevřené otázky

| ID | Otázka | Dopad |
| --- | --- | --- |
| Q9.1 | Jaký účinek má zaevidování domluvy typu *podržení* nebo *záloha* na vznik rezervace? Odpověď na OT12 („auta mají přiřazeného obchodního zástupce, ten to vše řeší“) určuje odpovědnou osobu, ne chování systému. | A3, A4, vazba na UC10 |
| Q9.2 | Které údaje jsou povinné u zájemce, který si zatím jen přišel vozidlo prohlédnout? L8 žádá minimalizaci, rozsah ale zadání neurčuje. | E1 |
| Q9.3 | Smí se naplánovat zkušební jízda u vozidla, které ještě není připravené k prodeji? | E4 |
| Q9.4 | Kdy se ze zájemce stává zákazník a jde o jeden záznam, nebo dva? Slovník otázku vede jako otevřenou. | Model tříd, F21 |

## 8. Vazby na ostatní artefakty

- **Navazující UC:** UC10 (podržení), UC11 (zkušební jízda), UC13 (potvrzení prohlídky), UC24 (platba), UC18 (historie zákazníka).
- **Diagramy:** evidence domluvy je vstupem do [activity diagramu rezervace](../diagrams/activity-rezervace.svg).
- **Model tříd:** třídy Zájemce, Domluva a jejich vazba na Vozidlo v [doménovém modelu](../05-modely/domenovy-model.md).
