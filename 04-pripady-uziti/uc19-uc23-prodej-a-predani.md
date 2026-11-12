# UC19 Prodat vozidlo a UC23 Předat vozidlo

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 12. 11. 2026 | Jan Svoboda | První verze specifikace (#11). Doprovodný text k [activity diagramu prodeje](../diagrams/activity-prodej.svg), na který diagram odkazuje. Scénáře odvozeny z F8, F9, F22–F25, L1, L2, L5–L7 a odpovědí O12, O13, O26, OT3 a OT5. Připraveno s pomocí AI, každý krok ověřen proti konkrétnímu požadavku nebo odpovědi zákazníka; co se ověřit nedalo, je vedeno jako otevřená otázka v kap. 9. |

Oba případy užití jsou v jednom dokumentu, protože na sebe přímo navazují a sdílejí jeden activity diagram. **Hranice mezi nimi je ostrá:** UC19 končí podepsanou smlouvou a stavem *Prodáno*, UC23 začíná kontrolou podkladů a končí stavem *Předáno*. Mezi nimi leží evidence platby (UC24), která není součástí ani jednoho.

---

# UC19 Prodat vozidlo

## 1. Identifikace

| Položka | Hodnota |
| --- | --- |
| **ID a název** | UC19 Prodat vozidlo |
| **Primární aktér** | Obchodník |
| **Další zúčastnění** | Seniorní obchodník nebo majitel (sleva F25, cena protiúčtu F9), účetní (platba UC24) |
| **Spouštěč** | Zákazník se rozhodl koupit konkrétní vozidlo. |
| **Vstupní podmínka** | Uživatel je přihlášen (N6). Vozidlo je evidováno a je dostupné pro tento prodej. |
| **Výstupní podmínka — úspěch** | Je zaevidovaná podepsaná kupní smlouva, vozidlo je ve stavu *Prodáno* a skryté z veřejné nabídky (F16/3). |
| **Výstupní podmínka — neúspěch** | Smlouva není zaevidovaná, vozidlo není označeno jako prodané a je zaznamenáno, co prodeji bránilo. |
| **Zahrnuje** | UC20 Identifikovat zákazníka z dokladu (`include`) |
| **Rozšiřuje se o** | UC21 Poskytnout slevu, UC22 Přijmout vozidlo na protiúčet (`extend`) |

## 2. Pokryté požadavky

| Požadavek | Jak se v UC projevuje |
| --- | --- |
| F8 | U komisního vozidla kontrola komitenta, minimální prodejní ceny a plné moci; blokace prodeje pod minimem. |
| F9 | Cenu protiúčtu schvaluje majitel nebo seniorní obchodník; přijaté vozidlo vzniká jako nové. |
| F22 | Generování kupní smlouvy z údajů o vozidle a zákazníkovi. |
| F25 | Slevu zadává jen seniorní obchodník nebo majitel, eviduje se autor, čas a výše. |
| F16 | Prodané vozidlo se skryje z veřejné nabídky. |
| F29 | Záznam o změně ceny, stavu a slevy. |
| L2 | U prodeje na úvěr a u prvotního neprověřeného obchodu identifikace z dokladu. |

## 3. Hlavní scénář

1. Obchodník zvolí u vozidla prodej konkrétnímu zákazníkovi.
2. Systém ověří dostupnost vozidla a existující závazky vůči zájemcům (UC05, UC10).
3. Systém vyžádá identifikaci zákazníka a údaje potřebné pro smlouvu (UC20).
4. Obchodník doplní nebo potvrdí údaje zákazníka.
5. Systém podle typu prodeje ověří podklady: u komisního vozidla komitenta, minimální prodejní cenu a plnou moc (F8).
6. Obchodník potvrdí konečnou cenu.
7. Systém vygeneruje kupní smlouvu předvyplněnou údaji o vozidle a zákazníkovi (F22/1).
8. Obchodník zaeviduje podepsanou smlouvu.
9. Systém převede vozidlo do stavu *Prodáno*, skryje ho z veřejné nabídky (F16/3) a zaznamená autora a čas (F29).
10. Systém odkáže na evidenci platby (UC24) a předání (UC23).

## 4. Alternativní scénáře UC19

**A19.1 — Komisní prodej.** V kroku 5 jde o vozidlo v komisi. Systém ověří, že je evidován komitent, minimální prodejní cena a plná moc (F8/1, F8/3). Konečná cena nesmí klesnout pod minimální prodejní cenu (F8/2). Blokaci prodeje pod minimem odvodil tým z F8; zákazník ji v této podobě nepotvrdil.

**A19.2 — Sleva.** Zákazník žádá slevu. Slevu smí zadat jen seniorní obchodník nebo majitel (F25/1); jinému uživateli systém pole nezpřístupní. U slevy se eviduje autor, čas a výše (F25/2). Limit výše slevy zákazník neuvedl (Q19.1). Tento průběh je UC21.

**A19.3 — Protiúčet.** Zákazník nabízí jiné vozidlo jako část platby. Cenu protiúčtu schvaluje majitel nebo seniorní obchodník (F9/1). Po schválení vznikne přijímané vozidlo jako **nové vozidlo** s odkazem na tento prodej (F9/2) a prochází vlastní evidencí (UC01). Protiúčet je nezávislý na typu prodávaného vozidla — může doprovázet i komisní prodej. Tento průběh je UC22.

**A19.4 — Prodej bez předchozí rezervace.** Vozidlo nebylo nikomu podrženo. Krok 2 proběhne bez kontroly závazků a scénář pokračuje beze změny.

**A19.5 — Prodej na úvěr.** Zákazník platí úvěrem, který autobazar zprostředkovává. Podle L2 je nutná identifikace z dokladu totožnosti, bez ní prodej nelze dokončit (L2/1).

## 5. Chybové scénáře UC19

**E19.1 — Vozidlo je slíbeno někomu jinému.** V kroku 2 má vozidlo platný závazek vůči jinému zájemci. Prodej nepokračuje a systém zaznamená důvod. **Platný příslib nelze prodejem obejít** (P19.1).

**E19.2 — Neúplná identifikace zákazníka.** V kroku 4 chybí údaje potřebné pro smlouvu nebo pro identifikaci podle L2. Systém smlouvu nevygeneruje a prodej nelze dokončit.

**E19.3 — Chybějící podklady u komise.** V kroku 5 chybí komitent, minimální prodejní cena nebo plná moc. Prodej nepokračuje; systém uvede, který podklad chybí (F8).

**E19.4 — Cena pod minimální prodejní cenou.** V kroku 6 je konečná cena komisního vozidla nižší než minimální prodejní cena. Systém prodej odmítne (F8/2).

**E19.5 — Sleva bez oprávnění.** Obchodník bez oprávnění se pokusí zadat slevu. Systém pole nezpřístupní (F25/1).

**E19.6 — Neschválená cena protiúčtu.** V alternativě A19.3 nebyla cena přijímaného vozidla schválena. Prodej s tímto protiúčtem nelze dokončit (F9/1).

**E19.7 — Zákazník smlouvu nepodepíše.** V kroku 8 k podpisu nedojde. Systém zaznamená důvod, vozidlo **neoznačí** jako *Prodáno* a ponechá ho v dosavadním stavu.

---

# UC23 Předat vozidlo

## 6. Identifikace

| Položka | Hodnota |
| --- | --- |
| **ID a název** | UC23 Předat vozidlo |
| **Primární aktér** | Obchodník |
| **Spouštěč** | Vozidlo je ve stavu *Prodáno* a zákazník si pro něj přijel. |
| **Vstupní podmínka** | Vozidlo je ve stavu *Prodáno* a existuje zaevidovaná podepsaná kupní smlouva. |
| **Výstupní podmínka — úspěch** | Vozidlo je ve stavu *Předáno*, je vygenerovaný předávací protokol, běží záruční lhůta (L5) a hlídá se termín přepisu (L7). |
| **Výstupní podmínka — neúspěch** | Vozidlo zůstává ve stavu *Prodáno* a je vidět, která položka kontrolního seznamu chybí. |

## 7. Hlavní scénář UC23

1. Obchodník zvolí u prodaného vozidla předání.
2. Obchodník doplní technický stav, stav tachometru a odkaz na doklad z STK (L6).
3. Systém vygeneruje předávací protokol (F22/2, L6/1).
4. Systém ověří kontrolní seznam: podepsaná smlouva, technický průkaz, u komise plná moc, zaplaceno, identifikace zákazníka (F23).
5. Systém zobrazí, které položky jsou splněné, a u každé kdo ji potvrdil a kdy (F23/3).
6. Obchodník fyzicky předá vozidlo a doklady zákazníkovi.
7. Obchodník potvrdí, že předání proběhlo.
8. Systém převede vozidlo do stavu *Předáno*, zaznamená autora a čas (F29), založí evidenci záruční lhůty (L5) a hlídání termínu přepisu (L7/1).

Krok 6 probíhá mimo systém. Systém předání **eviduje a kontroluje**, neprovádí ho.

## 8. Alternativní a chybové scénáře UC23

**A23.1 — Komisní vozidlo.** V kroku 4 kontrolní seznam navíc obsahuje plnou moc komitenta (F23/2).

**A23.2 — Předání se odkládá.** V kroku 7 k předání nedojde. Systém zaznamená důvod odložení a vozidlo ponechá ve stavu *Prodáno*, nikoli *Předáno*.

**E23.1 — Neúplné podklady protokolu.** V kroku 2 chybí technický stav, tachometr nebo odkaz na doklad STK. Systém protokol nevygeneruje (L6/1) a vozidlo nelze předat.

**E23.2 — Nesplněný kontrolní seznam.** V kroku 4 není splněná některá položka. Systém zobrazí chybějící položky a **zablokuje** přechod do stavu *Předáno* (F23/1). Vozidlo zůstává *Prodáno*.

**E23.3 — Není doložená platba.** Položka „zaplaceno“ není splněná. Vozidlo se nepředá. Podepsaná smlouva se tím automaticky neruší; odstoupení a storno zadání neřeší (Q19.4).

**E23.4 — Chybí technický průkaz.** Položka kontrolního seznamu není splněná a vozidlo nelze předat. Který technický průkaz zákazník požaduje — malý, nebo velký —, slovník vede jako otevřené (Q19.5).

---

## 9. Otevřené otázky a předpoklady

Číslování navazuje na [activity diagram prodeje](../diagrams/activity-prodej.svg):

| Poznámka v diagramu | Položka zde | Co je nejisté | Stav |
| --- | --- | --- | --- |
| P1 | P19.1 | Platný příslib jinému zájemci nelze prodejem obejít. | předpoklad týmu |
| Q1 | Q19.2 | U protiúčtu okamžik převodu vlastnictví, výpočet doplatku a osud nového záznamu při zrušení prodeje. | otevřeno |
| Q2 / OT5 | Q19.3 | Délka záruční lhůty. Zákazník uvádí 2 měsíce u ojetých, odpověď na OT5 navíc 1 měsíc na motor a karoserii a půl roku na skryté vady; zákon dává spotřebiteli 24 měsíců, u použitého zboží lze zkrátit nejvýše na 12. Rozpor trvá, specifikace lhůtu neurčuje. | otevřeno |
| Q3 / OT3 | — | Způsoby platby. **Vyřešeno:** odpověď na OT3 připouští kartu, hotovost i úvěr, L1 potvrzuje interní limit 100 000 Kč na hotovost. Diagram i kap. 5.9 katalogu ještě hlásily rozpor; opraveno v katalogu v0.4 (#14). | uzavřeno |
| Q4 | Q19.4 | Odstoupení od smlouvy, storno prodeje a vypořádání už přijatých plateb. | otevřeno |
| Q5 | Q19.5 | Který technický průkaz patří do kontrolního seznamu — malý, nebo velký? | otevřeno |
| — | Q19.1 | Maximální výše slevy. Zákazník limit neuvedl. | otevřeno |
| — | Q19.6 | Kdo posuzuje, že jde o podezřelý obchod podle L2? Katalog to vede jako neurčené. | otevřeno |

## 10. Co tyto UC vědomě neřeší

- **Evidenci platby** (UC24, F24). UC19 na ni odkazuje, UC23 kontroluje jen položku „zaplaceno“ v seznamu.
- **Vlastní účetní zpracování** (F26, systém Pohoda podle odpovědi na OT6).
- **Přepis v registru vozidel.** Vyřizují ho zaměstnanci, systém jen hlídá termín (L7, odpověď O29).
- **Poprodejní kontakt a historii** (UC18, F21).

## 11. Vazby na ostatní artefakty

- **Předchozí UC:** UC05 (stav vozidla), UC09, UC10 (závazky vůči zájemcům).
- **Související UC:** UC20 (identifikace), UC21 (sleva), UC22 (protiúčet), UC24 (platba), UC08 (schválení ceny protiúčtu).
- **Diagram:** [`diagrams/activity-prodej.puml`](../diagrams/activity-prodej.puml).
- **Model tříd:** třídy Kupní smlouva, Předávací protokol, Kontrolní seznam před předáním, Protiúčet, Sleva v [doménovém modelu](../05-modely/domenovy-model.md).
