# UC10 Podržet vozidlo pro zájemce

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 12. 11. 2026 | Jan Svoboda | První verze specifikace (#11). Doprovodný text k [activity diagramu rezervace](../diagrams/activity-rezervace.svg), na který diagram odkazuje. Scénáře odvozeny z F10–F13, N5 a odpovědí O6, O7, OT12 a OT13. Připraveno s pomocí AI, každý krok ověřen proti konkrétnímu požadavku nebo odpovědi zákazníka; co se ověřit nedalo, je vedeno jako otevřená otázka v kap. 8. |

Tento UC je jádro hlavního problému ze zadání: **neslíbit stejné vozidlo dvěma zájemcům**. Proto je popsaný podrobněji než ostatní a má vlastní activity diagram.

## 1. Identifikace

| Položka | Hodnota |
| --- | --- |
| **ID a název** | UC10 Podržet vozidlo pro zájemce |
| **Primární aktér** | Obchodník |
| **Spouštěč** | Obchodník se se zájemcem domluvil, že se mu vozidlo podrží na sjednanou dobu. |
| **Vstupní podmínka** | Uživatel je přihlášen (N6). Vozidlo je evidováno a zájemce je u něj zaevidován (UC09, F10). |
| **Výstupní podmínka — úspěch** | Vozidlo má právě jedno platné podržení pro konkrétního zájemce se sjednanou dobou platnosti. Vozidlo je ve stavu *Rezervováno* a ve veřejné nabídce je označeno jako rezervované (F12, F16/2). |
| **Výstupní podmínka — neúspěch** | Nový závazek nevznikl, dosavadní platný závazek zůstal nedotčený a obchodník vidí aktuální stav vozidla. |
| **Nefunkční požadavek** | Zjištění, zda je vozidlo volné, a založení rezervace včetně potvrzení pro zákazníka zvládne obchodník do 5 minut (N5, odpověď na OT9). |

## 2. Pokryté požadavky

| Požadavek | Jak se v UC projevuje |
| --- | --- |
| F10 | Podržení je druh domluvy; eviduje se autor a čas. |
| F11 | Doba platnosti podržení je individuálně sjednaná, není pevně daná. |
| F12 | Nejvýše jedno platné podržení u vozidla; ostatní zájemci čekají v pořadí. |
| F13 | Navazující vypršení a nabídnutí dalšímu zájemci (řeší UC12). |
| F16 | Rezervované vozidlo zůstává v nabídce, ale je označené. |
| F29 | Záznam o změně stavu vozidla. |
| N5 | Celý průběh do 5 minut. |

## 3. Hlavní scénář

1. Obchodník otevře detail vozidla a zvolí podržení pro zájemce.
2. Systém zobrazí, zda u vozidla existuje platný závazek, a aktuální pořadí zájemců (F12/3).
3. Systém ověří, že vozidlo žádný platný závazek nemá.
4. Obchodník vybere zájemce a zadá sjednanou dobu platnosti podržení (F11).
5. Systém ověří úplnost údajů a že zadaná platnost končí v budoucnosti (P1).
6. Systém při ukládání znovu ověří, že mezitím nevznikl jiný platný závazek (F12/1).
7. Systém uloží podržení, zaznamená autora a čas (F10/3) a převede vozidlo do stavu *Rezervováno* (UC05).
8. Systém zobrazí, komu a do kdy je vozidlo slíbeno, a aktuální pořadí zájemců.

Krok 6 je vědomě oddělený od kroku 3. Mezi zobrazením stavu a uložením může jiný obchodník vytvořit závazek na totéž vozidlo; ověření až při ukládání je jediné, které zabrání dvojímu příslibu.

## 4. Alternativní scénáře

**A1 — Vozidlo už má platný závazek, zájemce chce čekat.** V kroku 3 systém zjistí platné podržení pro jiného zájemce. Nové podržení nevznikne. Obchodník zařadí zájemce do pořadí u tohoto vozidla (F12/2). Systém zapíše zájemce do pořadí a zobrazí jeho umístění. Pravidlo řazení ve frontě zadání neurčuje (P2).

**A2 — Vozidlo už má platný závazek, zájemce čekat nechce.** Obchodník ponechá zaevidovanou domluvu podle UC09 bez vzniku závazku a bez zařazení do pořadí. Vozidlo zůstává rezervované pro původního zájemce.

**A3 — Prodloužení nebo změna doby platnosti.** Obchodník se se zájemcem domluví na jiné době platnosti stávajícího podržení. Systém uloží novou platnost a zaznamená autora a čas změny (F29). Zda smí platnost měnit i jiný obchodník než ten, který podržení sjednal, zadání neurčuje (P4).

**A4 — Zrušení podržení zájemcem.** Zájemce o vozidlo přestal mít zájem. Obchodník ověří zájemce a dotčený platný závazek, zapíše zrušení včetně autora a času a ukončí platnost závazku. Vozidlo přestává být rezervované. Pokud u vozidla čeká další zájemce, pokračuje se podle A5. Vrácení případné zálohy tento UC neřeší (P3).

**A5 — Vozidlo se nabízí dalšímu zájemci v pořadí.** Po zániku závazku systém nabídne vozidlo dalšímu zájemci v pořadí (F13/2). **Nová rezervace nevzniká automaticky** — nové podržení prochází znovu tímto UC. Kontakt na dalšího zájemce řeší přiřazený obchodník; podle odpovědi na OT13 může v minimální verzi komunikace probíhat mimo systém.

**A6 — Vypršení platnosti.** Uplynula sjednaná doba podržení. Systém upozorní obchodníka, který podržení sjednal (F13/1), a ukončí platnost závazku. Celý tento průběh je samostatný případ užití UC12; zde je uveden kvůli návaznosti.

## 5. Chybové scénáře

**E1 — Souběžný pokus dvou obchodníků.** Dva obchodníci současně zakládají podržení téhož vozidla pro různé zájemce. V kroku 6 uspěje nejvýše jeden z nich (F12/1). Druhému systém zobrazí konflikt a aktuální stav vozidla; jeho zájemce lze zařadit do pořadí podle A1. **Toto je hlavní chybový scénář celého UC** — řeší přímo riziko dvojího příslibu z původního zadání.

**E2 — Neúplné údaje.** V kroku 5 chybí zájemce nebo doba platnosti. Systém závazek neuloží a označí chybějící pole. Oprava znamená nový průchod od kroku 4.

**E3 — Platnost v minulosti.** V kroku 5 je zadaná doba platnosti už uplynulá. Systém závazek neuloží. Že má systém takovou hodnotu odmítnout, je návrh týmu (P1).

**E4 — Zájemce není u vozidla zaevidován.** V kroku 4 obchodník zvolí zájemce, který u vozidla nemá žádnou domluvu. Systém nabídne jeho zaevidování podle UC09 a teprve potom pokračuje.

**E5 — Vozidlo nelze rezervovat.** Vozidlo je ve stavu *Prodáno*, *Předáno* nebo *Staženo z prodeje*. Systém podržení nevytvoří a zobrazí aktuální stav vozidla.

**E6 — Zrušení se netýká aktuálního závazku.** V alternativě A4 obchodník ruší závazek, který už neplatí, protože mezitím vypršel nebo byl změněn. Systém nesoulad oznámí, závazek nemění a zobrazí aktuální stav.

## 6. Co tento UC vědomě neřeší

- **Platby a zálohy.** Přijetí ani vrácení zálohy není součástí tohoto UC (UC24, F24).
- **Vlastní vypršení podržení.** Patří do UC12, zde jen jako návaznost (A6).
- **Kontaktování dalšího zájemce.** Podle odpovědi na OT13 je na přiřazeném obchodníkovi a v minimální verzi může probíhat mimo systém.
- **Prodej.** Podržení je příslib, ne prodej. Prodej řeší UC19.

## 7. Předpoklady a otázky v activity diagramu

[Activity diagram rezervace](../diagrams/activity-rezervace.svg) na tuto specifikaci odkazuje. Jeho žluté poznámky odpovídají následujícím položkám:

| Poznámka v diagramu | Položka zde | Význam |
| --- | --- | --- |
| Q1 (pravidlo řazení a změny pořadí) | P2 | Řazení fronty zadání neurčuje; FIFO se nezavádí. |
| Q2 (účinnost zrušení a vrácení zálohy) | P3 | Vrácení zálohy řeší UC24, ne tento UC. |
| P1 (validace úplnosti a budoucí platnosti) | P1 | Návrh týmu, zákazník nepotvrdil. |
| P2 (ukončení a uvolnění po zrušení) | P5 | Návrh týmu, zákazník nepotvrdil. |
| OT12 | P6 | Vztah podržení, rezervace a zálohy. |

## 8. Otevřené otázky a předpoklady

| ID | Co je nejisté | Stav | Dopad |
| --- | --- | --- | --- |
| P1 | Systém odmítne neúplné údaje a platnost v minulosti. | předpoklad týmu | E2, E3 |
| P2 | Podle jakého pravidla se řadí pořadí zájemců a lze s ním hýbat? Odpověď O7 říká jen, že pořadí existuje. | otevřeno | A1 |
| P3 | Co se stane se zálohou při zrušení podržení? | otevřeno | A4 |
| P4 | Smí podržení změnit nebo zrušit i jiný obchodník než ten, který ho sjednal? | otevřeno | A3, A4 |
| P5 | Po zrušení se závazek ukončí a vozidlo se uvolní. | předpoklad týmu | A4 |
| P6 | Jak spolu souvisí podržení, rezervace a záloha? Odpověď na OT12 určuje odpovědnou osobu („přiřazený obchodní zástupce to řeší“), ne chování systému. Tato specifikace proto s podržením a rezervací pracuje jako s jedním platným závazkem a netvrdí, že jde o totéž. | otevřeno | Celý UC, model tříd |

## 9. Vazby na ostatní artefakty

- **Předchozí UC:** UC09 (evidence zájemce a domluvy).
- **Navazující UC:** UC12 (vypršelé podržení), UC05 (změna stavu), UC19 (prodej), UC24 (záloha).
- **Diagram:** [`diagrams/activity-rezervace.puml`](../diagrams/activity-rezervace.puml).
- **Model tříd:** třídy Podržení, Rezervace, Pořadí zájemců v [doménovém modelu](../05-modely/domenovy-model.md).
