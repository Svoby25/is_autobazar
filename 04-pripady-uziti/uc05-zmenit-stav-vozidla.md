# UC05 Změnit stav vozidla

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 12. 11. 2026 | Jan Svoboda | První verze specifikace (#11). Scénáře odvozeny z [katalogu požadavků](../03-pozadavky/katalog-pozadavku.md) v0.3, kap. 4.1 [zadání v1.0](../02-zadani/zadani-v1.0.md) a odpovědi na OT11. Připraveno s pomocí AI, každý krok ověřen proti konkrétnímu požadavku nebo odpovědi zákazníka; co se ověřit nedalo, je vedeno jako otevřená otázka v kap. 7. |

## 1. Identifikace

| Položka | Hodnota |
| --- | --- |
| **ID a název** | UC05 Změnit stav vozidla |
| **Primární aktér** | Obchodník |
| **Další zúčastnění** | Pracovník přípravy (rozsah oprávnění otevřený, viz Q5.1) |
| **Spouštěč** | Na vozidle nastala událost, která mění jeho dostupnost: přivezení na plochu, dokončení přípravy, vznik nebo zánik platného podržení, podpis smlouvy, předání, stažení komitentem. |
| **Vstupní podmínka** | Uživatel je přihlášen (N6) a vozidlo je v systému evidováno (F1). |
| **Výstupní podmínka — úspěch** | Vozidlo má nový stav, změna je zaznamenána s autorem a časem (F29) a dostupnost vozidla ve veřejné nabídce odpovídá novému stavu (F16). |
| **Výstupní podmínka — neúspěch** | Stav vozidla zůstává nezměněný a uživatel ví, která podmínka nebyla splněna. |

## 2. Pokryté požadavky

| Požadavek | Jak se v UC projevuje |
| --- | --- |
| F16 | Veřejná nabídka obsahuje jen vozidla ve stavu *Připraveno k prodeji* a *Rezervováno*; *Prodáno* se skryje. |
| F29 | U každé změny stavu se eviduje autor a čas. |
| F7 | Vozidlo s neschválenou výkupní cenou nelze nabídnout. |
| kap. 2.1 katalogu | Seznam stavů a jejich význam. |

## 3. Hlavní scénář

1. Obchodník otevře detail vozidla.
2. Systém zobrazí aktuální stav vozidla a nabídne stavy, do kterých lze z něj přejít.
3. Obchodník zvolí cílový stav.
4. Systém ověří podmínky přechodu podle kapitoly 4 této specifikace.
5. Systém uloží nový stav a zaznamená, kdo změnu provedl a kdy (F29).
6. Systém promítne změnu do veřejné nabídky podle F16.
7. Systém zobrazí vozidlo v novém stavu včetně informace, zda ho lze ukázat zákazníkovi.

## 4. Přechody mezi stavy

Stavy pocházejí z kap. 4.1 zadání v1.0 a zákazník je v odpovědi na OT11 potvrdil („Stačí jak to je viz. F16.“). **Podmínky jednotlivých přechodů v tabulce níže odvodil tým**; zákazník je takto podrobně nepotvrdil. Dokud je nepotvrdí, nejde o závazné pravidlo (Q5.2).

| Z | Do | Podmínka přechodu | Zdroj podmínky |
| --- | --- | --- | --- |
| Evidováno | V přípravě | Vozidlo je fyzicky na ploše. | kap. 4.1 |
| V přípravě | Připraveno k prodeji | Vozidlo lze ukázat a vyzkoušet; výkupní cena je schválena (F7). | kap. 4.1, F7 |
| Připraveno k prodeji | Rezervováno | Vzniklo platné podržení pro zájemce (UC10, F12). | F12 |
| Rezervováno | Připraveno k prodeji | Platný závazek zanikl vypršením nebo zrušením a žádný jiný platný závazek neexistuje (UC12, F13). | F13 |
| Rezervováno | Prodáno | Byla zaevidována podepsaná kupní smlouva (UC19, F22). | F22 |
| Připraveno k prodeji | Prodáno | Totéž bez předchozí rezervace — zákazník koupil bez podržení. | odvozeno z F16 |
| Prodáno | Předáno | Všechny položky kontrolního seznamu jsou splněné (UC23, F23). | F23 |
| Evidováno, V přípravě, Připraveno k prodeji | Staženo z prodeje | Vozidlo se přestalo nabízet, například ho komitent stáhl. | kap. 4.1 |

Přechody, které tým vědomě **nepovoluje**, protože by obešly kontrolu:

- *Prodáno → Předáno* bez splněného kontrolního seznamu (F23/1).
- *Prodáno* → zpět do nabídky. Odstoupení od smlouvy a storno prodeje zadání neřeší (Q5.3).
- Jakýkoli přechod do *Připraveno k prodeji* u vozidla s neschválenou výkupní cenou (F7/2).

## 5. Alternativní scénáře

**A1 — Vozidlo se zakládá rovnou na ploše.** V kroku 3 obchodník zvolí přechod *Evidováno → V přípravě* bezprostředně po založení vozidla. Scénář pokračuje krokem 4 beze změny.

**A2 — Vozidlo se vrací do nabídky po zániku závazku.** Přechod *Rezervováno → Připraveno k prodeji* spustí UC12 (vyřízení vypršelého podržení), nikoli tento UC. Tato specifikace pak popisuje jen vlastní změnu stavu a její zaznamenání. Pokud u vozidla čeká další zájemce v pořadí, nové podržení **nevzniká automaticky** — prochází znovu UC10 (F13, odpověď na OT13).

**A3 — Vozidlo stahuje komitent.** V kroku 3 obchodník zvolí *Staženo z prodeje*. Systém si vyžádá důvod stažení. Zda se důvod eviduje jako volný text, nebo z číselníku, zadání neurčuje (Q5.4).

## 6. Chybové scénáře

**E1 — Nepovolený přechod.** V kroku 4 systém zjistí, že z aktuálního stavu do cílového přejít nelze. Systém změnu neuloží, zobrazí aktuální stav a uvede, který přechod je možný. Vozidlo zůstává beze změny.

**E2 — Neschválená výkupní cena.** V kroku 4 při přechodu do *Připraveno k prodeji* systém zjistí, že výkupní cena vozidla není schválena. Změnu neuloží a odkáže na UC08 (F7/2). Podle poznámky u F7 v katalogu platí výjimka pro majitele, který smí nabídnout i vozidlo s neschválenou cenou; pro ostatní role přechod neproběhne.

**E3 — Vozidlo má platný závazek.** V kroku 4 při přechodu do *Staženo z prodeje* systém zjistí, že vozidlo je rezervované pro zájemce. Systém změnu neprovede a upozorní, že existuje platný závazek. Jak se má stažení vozidla s platným závazkem řešit, zadání neuvádí (Q5.5).

**E4 — Souběžná změna.** V kroku 5 systém zjistí, že vozidlo mezitím změnil jiný uživatel. Systém změnu neuloží, zobrazí aktuální stav a vyzve k zopakování. Tím se chrání pravidlo F12 o jediném platném závazku.

**E5 — Nedostatečné oprávnění.** V kroku 3 systém nenabídne cílový stav uživateli, jehož role na něj nemá oprávnění. Oprávnění vycházejí z kap. 3 zadání v1.0; u pracovníka přípravy nejsou potvrzená (Q5.1).

## 7. Otevřené otázky

| ID | Otázka | Dopad |
| --- | --- | --- |
| Q5.1 | Smí pracovník přípravy sám změnit stav z *V přípravě* na *Připraveno k prodeji*? Odpověď na OT1 řeší jen správu uživatelů, oprávnění k přechodu stavu neurčuje. | E5, aktéři UC |
| Q5.2 | Odpovídají podmínky přechodů v kapitole 4 praxi autobazaru? Zákazník potvrdil seznam stavů, ne podmínky jednotlivých přechodů. | Celá kapitola 4 |
| Q5.3 | Co se stane se stavem vozidla při odstoupení od smlouvy nebo stornu prodeje? | Přechody z *Prodáno* |
| Q5.4 | Eviduje se důvod stažení z prodeje, a pokud ano, jak? | A3 |
| Q5.5 | Jak se stahuje z prodeje vozidlo, které má platný závazek vůči zájemci? | E3 |

## 8. Vazby na ostatní artefakty

- **Navazující UC:** UC10 (vznik rezervace), UC12 (vypršení podržení), UC19 (prodej), UC23 (předání), UC08 (schválení výkupní ceny).
- **Diagramy:** stavy vozidla se promítají do [activity diagramu rezervace](../diagrams/activity-rezervace.svg) a [activity diagramu prodeje](../diagrams/activity-prodej.svg).
- **Model tříd:** atribut `stav` třídy Vozidlo v [doménovém modelu](../05-modely/domenovy-model.md).
