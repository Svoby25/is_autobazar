# Doménový model — odpovědnosti tříd

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 0.1 | 12. 11. 2026 | Jan Svoboda | První verze (#16). Doprovodný text k [doménovému diagramu tříd](../diagrams/trid-domenovy.svg), na který diagram odkazuje: odpovědnosti tříd, zdroje atributů, omezení modelu a vysvětlení poznámek P1–P3 a Q1–Q4 z diagramu. Připraveno s pomocí AI, každá odpovědnost ověřena proti konkrétnímu požadavku, scénáři nebo odpovědi zákazníka; co se ověřit nedalo, je vedeno jako otevřená otázka v kap. 5. |

## 1. K čemu model slouží

Model zachycuje **pojmy a jejich vztahy**, ne návrh databáze ani implementaci. Nejsou v něm operace, datové typy ani klíče. Slouží ke třem věcem:

1. Ověřit, že analýza unese situace ze scénářů — hlavně více zájemců o jedno vozidlo a tři formy prodeje.
2. Držet pojmy jednotné se [slovníkem](../03-pozadavky/slovnik-pojmu.md) a [katalogem požadavků](../03-pozadavky/katalog-pozadavku.md).
3. Být podkladem pro sekvenční diagramy (#21) a konsolidovaný model v plné UML notaci (#23).

Rozsah odpovídá jádru scénářů pro M1. Účetnictví, správa účtů a inzerce rozpracované nejsou.

## 2. Odpovědnosti tříd

Každá třída má jednu až dvě věty o tom, za co v systému odpovídá, a zdroj, ze kterého odpovědnost plyne. **Žádná třída tu nemá odpovědnost, kterou nepodpírá požadavek, scénář nebo odpověď zákazníka.**

### 2.1 Vozidlo a formy prodeje

| Třída | Za co odpovídá | Zdroj |
| --- | --- | --- |
| **Vozidlo** | Drží identitu a aktuální stav předmětu obchodu: čím je jednoznačně určené (VIN), v jakém je stavu a zda ho lze ukázat zákazníkovi. Je středem celého modelu — váže na sebe náklady, domluvy, závazky, prodej i doklady. | F1, F2, F5, F6, kap. 4.1 zadání, [UC05](../04-pripady-uziti/uc05-zmenit-stav-vozidla.md) |
| **Náklady** | Evidují jednotlivý výdaj na vozidlo (oprava, převoz, příprava), aby šlo spočítat skutečnou pořizovací cenu, a ne jen nákupní. | F4, O2 |
| **Komisní prodej** | Drží podmínky, za kterých autobazar prodává cizí vozidlo: minimální prodejní cenu a marži. Podle nich systém odmítne prodej pod minimem. | F8, O5, [UC19](../04-pripady-uziti/uc19-uc23-prodej-a-predani.md) A19.1 |
| **Komitent** | Zastupuje vlastníka vozidla v komisi. Do systému sám nevstupuje, je o něm pouze evidence. | F8, L4, [akteri.md](../04-pripady-uziti/akteri.md) |
| **Plná moc** | Dokládá, že autobazar smí cizí vozidlo prodat. Je povinnou položkou kontrolního seznamu u komisního prodeje. | F8, F23/2, O12 |
| **Protiúčet** | Zaznamenává, že zákazník dal své vozidlo jako část platby, a za jakou cenu je autobazar přijal. Přijaté vozidlo vzniká jako **nové Vozidlo** napojené na původní prodej. | F9, O5 |

### 2.2 Zájemci a přísliby

| Třída | Za co odpovídá | Zdroj |
| --- | --- | --- |
| **Zájemce** | Zastupuje člověka, který projevil zájem o konkrétní vozidlo, ale zatím nekoupil. Umožňuje dohledat, komu se co slíbilo, i když obchodník chybí. | F10, F12, O6, O7 |
| **Domluva** | Zaznamenává jednotlivou dohodu se zájemcem — prohlídku, zkušební jízdu, podržení, zálohu, podpis — včetně toho, kdo ji sjednal a kdy. Je to paměť firmy místo paměti obchodníka. | F10, O6, [UC09](../04-pripady-uziti/uc09-zaevidovat-zajemce-a-domluvu.md) |
| **Podržení** | Zvláštní druh domluvy, který nese **sjednanou dobu platnosti**. Od ostatních domluv se liší tím, že vytváří závazek vůči zájemci. | F11, O6, [UC10](../04-pripady-uziti/uc10-podrzet-vozidlo.md) |
| **Rezervace** | Drží informaci, že vozidlo je v daném okamžiku slíbeno jednomu zájemci. Zodpovídá za pravidlo, že platná rezervace je u vozidla nejvýše jedna. | F12, O7 |
| **Pořadí zájemců** | Udržuje frontu dalších zájemců u jednoho vozidla, aby po zániku závazku bylo komu vozidlo nabídnout. Pořadí patří vozidlu, ne zájemci. | F12, F13, O7 |
| **Obchodník** | V modelu vystupuje jako autor záznamu — u koho je vidět, kdo domluvu sjednal a kdo změnu provedl. Role a oprávnění model nemodeluje. | F10/3, F29 |

### 2.3 Prodej a předání

| Třída | Za co odpovídá | Zdroj |
| --- | --- | --- |
| **Zákazník** | Zastupuje osobu, se kterou autobazar uzavírá obchod, a nese údaje potřebné pro smlouvu a pro identifikaci podle AML. | F21, L2, L8, O14 |
| **Kupní smlouva** | Zaznamenává uzavřený obchod mezi autobazarem a zákazníkem o konkrétním vozidle. Její podpis je okamžik, kdy se vozidlo stává prodaným. | F22, O12, [UC19](../04-pripady-uziti/uc19-uc23-prodej-a-predani.md) |
| **Předávací protokol** | Dokládá, v jakém stavu bylo vozidlo předáno — technický stav, tachometr a odkaz na doklad STK. Bez těchto údajů nelze protokol vystavit. | F22/2, L6 |
| **Kontrolní seznam před předáním** | Odpovídá za to, že se vozidlo nepředá bez potřebných podkladů. Dokud není splněný, systém blokuje přechod do stavu *Předáno*. | F23, [UC23](../04-pripady-uziti/uc19-uc23-prodej-a-predani.md) E23.2 |
| **Technický průkaz** | Doklad o vozidle, který je nutný k prodeji a předání a je položkou kontrolního seznamu. | F3, F23 |
| **Sleva** | Zaznamenává snížení prodejní ceny včetně toho, kdo ji zadal, kdy a v jaké výši. Existuje proto, aby slevy nebyly mimo kontrolu. | F25, O2, O16 |
| **Záloha** | Zaznamenává platbu přijatou předem v souvislosti s prodejem vozidla. | F10, F24, O6 |

## 3. Co model záměrně nezachycuje

| Co | Proč |
| --- | --- |
| Role jako samostatné třídy | Oprávnění jsou v kap. 3 zadání v1.0 a u části rolí nejsou potvrzená (OT1). Model by jinak tvrdil víc, než zadání říká. |
| Platbu jako proces | Evidenci platby řeší UC24 a napojení na účetní systém Pohoda (F26, OT6). Model drží jen Zálohu jako doloženou skutečnost. |
| Inzerát a veřejnou nabídku | Priorita S (F19, F20) nebo vlastnost zobrazení, ne doménový pojem jádra scénářů. |
| Stav jako samostatnou hierarchii tříd | Stav je atribut Vozidla. Přechody popisuje [UC05](../04-pripady-uziti/uc05-zmenit-stav-vozidla.md), ne struktura tříd. |
| Vlastní vozidlo / komisní / protiúčet jako podtřídy Vozidla | Původ a vlastnictví se mohou v čase měnit — vozidlo přijaté na protiúčet se stane vlastním a může jít dál do prodeje. Neměnné podtřídy by to znemožnily. Proto je *typ prodeje* atribut (P1). |

## 4. Zdroje atributů

Atributy jsou jen ty, které vyplývají ze zadání nebo ze scénářů.

| Třída | Atribut | Zdroj |
| --- | --- | --- |
| Vozidlo | VIN, SPZ (nepovinná), hrubý technický stav, výkupní cena | F1, O4 |
| Vozidlo | technický stav | F15, L6 |
| Vozidlo | stav | kap. 4.1 zadání, OT11 |
| Vozidlo | typ prodeje | F6, O5 |
| Vozidlo | prodejní cena | F15, F25 |
| Vozidlo | /pořizovací cena (odvozená) | F4 — výkupní cena plus všechny náklady |
| Náklady | druh výdaje, částka | F4, O2 |
| Komisní prodej | minimální prodejní cena, marže | F8, O3, O5 |
| Protiúčet | cena protiúčtu | F9 |
| Domluva | druh domluvy, obsah domluvy, sjednáno kdy | F10, O6 |
| Podržení | platnost do | F11, O6 |
| Rezervace | platnost | F12 |
| Kupní smlouva | podepsána | F22, O12 |
| Předávací protokol | technický stav, tachometr, odkaz na doklad STK | L6 |
| Kontrolní seznam | podepsaná smlouva, technický průkaz, plná moc u komise, zaplaceno, identifikace zákazníka | F23 |
| Sleva | výše, zadána kdy | F25 |
| Záloha | částka | F24 |

**Pořizovací cena** je jediný odvozený atribut (značený `/`). Způsob výpočtu marže u komisního prodeje zadání nepopisuje, proto marže u Komisního prodeje odvozená není — je to zadaná hodnota.

## 5. Předpoklady a otevřené otázky

[Diagram](../diagrams/trid-domenovy.svg) na tuto kapitolu odkazuje. Tečkované vztahy v něm označují otevřenou otázku, nikoli potvrzenou asociaci.

### 5.1 Předpoklady týmu (P1–P3)

| ID | Předpoklad | Proč je to jen předpoklad |
| --- | --- | --- |
| **P1** | Vozidlo může mít více záznamů o komisní dohodě (`1 -- 0..*`). | Zadání neříká, zda se komisní dohoda u vozidla může opakovat, například po vrácení komitentovi a novém svěření. Násobnost `0..*` tuto možnost nechává otevřenou, místo aby ji vyloučila. |
| **P2** | Vozidlo může být předmětem více kupních smluv (`1 -- 0..*`). | Pokrývá opakovaný prodej téhož vozidla, například po přijetí na protiúčet. Zadání opakovaný prodej neřeší. |
| **P3** | Kontrolní seznam je u smlouvy nejvýše jeden aktuální (`1 -- 0..1`). | F23 mluví o jedné kontrole před předáním. Zda se při odloženém předání zakládá nová, zadání neříká. |

### 5.2 Otevřené otázky (Q1–Q4)

| ID | Otázka | Čeho se v diagramu týká | Dopad |
| --- | --- | --- | --- |
| **Q1** | Podle jakého pravidla se řadí pořadí zájemců a eviduje se historie jeho změn? Odpověď O7 potvrzuje jen to, že pořadí existuje. FIFO se nezavádí. | `Pořadí zájemců -- Zájemce {ordered, unique}` | Model drží pořadí jako uspořádanou množinu bez pravidla řazení. |
| **Q2** | Jak spolu souvisí Zájemce a Zákazník — je to jeden záznam ve dvou rolích, nebo dva? Slovník otázku vede jako otevřenou. | `Zájemce .. Zákazník`, `Zákazník -- Kupní smlouva`, `Zákazník -- Záloha` | Dokud se nerozhodne, nelze sloučit historii zájmu a historie nákupů podle F21. |
| **Q3** | Kdy se vozidlo přijaté na protiúčet stává majetkem autobazaru, jak se počítá doplatek a co se stane s novým záznamem, když se prodej zruší? | `Protiúčet -- Vozidlo`, `Kupní smlouva -- Protiúčet` | Model zakládá přijaté vozidlo jako nové, ale okamžik převodu vlastnictví neurčuje. |
| **Q4** | Patří doklad (plná moc, technický průkaz, předávací protokol) k vozidlu, ke smlouvě, nebo ke komisní dohodě? Zadání dokládá jen to, že existovat musí. | `Komisní prodej -- Plná moc`, `Vozidlo -- Technický průkaz`, `Kupní smlouva -- Předávací protokol` | Vazby dokladů jsou v modelu vedeny tak, jak je vyžadují scénáře, ne jako potvrzené pravidlo. |

### 5.3 OT12 — podržení, rezervace a záloha

Diagram vede mezi **Podržením a Rezervací** tečkovaný vztah s popiskem „vztah nevyjasněn“ a mezi **Zálohou a Rezervací** vztah „účinek neurčen“. Je to nejdůležitější otevřené místo celého modelu.

Zákazník na OT12 odpověděl: *„Auta mají přiřazeného obchodního zástupce, ten to vše řeší.“* Odpověď určuje **odpovědnou osobu, nikoli chování systému** — neříká, zda je podržení a rezervace totéž, ani zda přijetí zálohy zakládá rezervaci. Model proto:

- vede Podržení jako **specializaci Domluvy**, protože to z F10 a F11 plyne jednoznačně,
- vede Rezervaci jako **samostatnou třídu**, protože F12 mluví o stavu vozidla vůči jedinému zájemci,
- **netvrdí, že jde o totéž**, a oba vztahy nechává tečkované.

Dokud zákazník neodpoví konkrétněji, nelze model v tomto místě uzavřít. Totéž platí pro otázku Q9.1 ve specifikaci [UC09](../04-pripady-uziti/uc09-zaevidovat-zajemce-a-domluvu.md) a P6 ve specifikaci [UC10](../04-pripady-uziti/uc10-podrzet-vozidlo.md).

## 6. Ověření proti scénářům

Model unese situace, kvůli kterým vznikl:

| Situace ze scénáře | Jak ji model unese |
| --- | --- |
| Více zájemců o jedno vozidlo ([UC10](../04-pripady-uziti/uc10-podrzet-vozidlo.md) A1) | `Vozidlo 1 -- 0..* Domluva` a `Pořadí zájemců 0..* -- 0..* Zájemce` |
| Nejvýše jedna platná rezervace ([UC10](../04-pripady-uziti/uc10-podrzet-vozidlo.md) E1, F12) | Omezení je v poznámce u třídy Rezervace; `0..*` zachovává i ukončené rezervace |
| Jeden zájemce čeká u více vozidel ([UC09](../04-pripady-uziti/uc09-zaevidovat-zajemce-a-domluvu.md) A5) | Pořadí patří vozidlu, zájemce v něm může být u více vozidel |
| Komisní prodej s plnou mocí ([UC19](../04-pripady-uziti/uc19-uc23-prodej-a-predani.md) A19.1) | `Vozidlo -- Komisní prodej -- Komitent` a `Komisní prodej -- Plná moc` |
| Protiúčet i u komisního vozidla ([UC19](../04-pripady-uziti/uc19-uc23-prodej-a-predani.md) A19.3) | Protiúčet visí na Kupní smlouvě, ne na typu prodávaného vozidla |
| Blokace předání bez podkladů ([UC23](../04-pripady-uziti/uc19-uc23-prodej-a-predani.md) E23.2) | Kontrolní seznam s pěti položkami navázaný na Kupní smlouvu |
| Dohledatelnost autora a času (F10/3, F29) | `Obchodník 1 -- 0..* Domluva : zaznamenal` |

Situace, které model **neunese a ani nemá**: evidence platby, správa uživatelů a inzerce. Patří do navazujících UC mimo výběr pro M1.

## 7. Vazby na ostatní artefakty

- **Diagram:** [`diagrams/trid-domenovy.puml`](../diagrams/trid-domenovy.puml).
- **Slovník:** [slovnik-pojmu.md](../03-pozadavky/slovnik-pojmu.md), kapitola 12 obsahuje srovnání názvů tříd s pojmy.
- **Scénáře:** specifikace [UC05](../04-pripady-uziti/uc05-zmenit-stav-vozidla.md), [UC09](../04-pripady-uziti/uc09-zaevidovat-zajemce-a-domluvu.md), [UC10](../04-pripady-uziti/uc10-podrzet-vozidlo.md), [UC19 a UC23](../04-pripady-uziti/uc19-uc23-prodej-a-predani.md).
- **Navazuje:** sekvenční diagramy (#21), konsolidovaný model tříd v plné UML notaci (#23).
