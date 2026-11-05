# Výběr klíčových případů užití pro M1

## 1. Rozhodnutí o rozsahu podrobné analýzy

Pro podrobnou specifikaci a navazující modelování vybíráme **UC05 Změnit stav vozidla, UC09 Zaevidovat zájemce a domluvu, UC10 Podržet vozidlo pro zájemce, UC19 Prodat vozidlo a UC23 Předat vozidlo**.

Výběr sleduje hlavní potřebu majitele: **„Abychom věděli, které auto můžeme prodat a co jsme komu slíbili.“** Zachycuje dostupnost vozidla, historii domluv, závazek vůči konkrétnímu zájemci a dokončení prodeje až po předání. Přednost mají situace, kde nesprávná nebo neúplná analýza může vést k dvojímu příslibu, nabídnutí nepřipraveného vozidla nebo předání bez potřebných podkladů.

Jde o pracovní rozhodnutí o zaměření analýzy pro M1, nikoli o potvrzení dosud otevřených obchodních pravidel zákazníkem. Ostatní UC zůstávají v celkovém diagramu a seznamu, ale v tomto výběru nedostanou samostatnou podrobnou specifikaci. Nevyřazujeme tím jejich požadavky z rozsahu systému ani neměníme priority M/S.

## 2. Vybrané UC a zdůvodnění

### UC05 Změnit stav vozidla

- **Aktér:** Obchodník podle současného seznamu UC. Oprávnění pracovníka přípravy je otevřené.
- **Vazba na požadavky:** kapitola 2.1 katalogu (stavy vozidla), F16.
- **Přínos pro zákazníka:** stav umožňuje rozlišit, zda vozidlo teprve evidujeme, připravujeme, nabízíme, rezervujeme, prodáváme nebo předáváme. Podporuje odpověď na otázku, které vozidlo lze ukázat a prodat.
- **Proč podrobně:** nesprávné přechody mohou zpřístupnit nepřipravené vozidlo nebo ponechat prodané vozidlo v nabídce. Stav ovlivňuje rezervaci, veřejnou nabídku i prodej.
- **Zaměření specifikace a modelování:** povolené a zamítnuté změny stavu, jejich podmínky a dopad na dostupnost; návaznost na rezervaci, prodej a předání. Doménový model musí zachytit stav vozidla a související události podle potvrzených scénářů.
- **K validaci:** OT11 (stavy a přechody), OT1 (oprávnění pracovníka přípravy). Přesný stavový postup ani pravidlo pro každý přechod zatím nepovažujeme za potvrzené.

### UC09 Zaevidovat zájemce a domluvu

- **Aktér:** Obchodník.
- **Vazba na požadavky:** F10.
- **Přínos pro zákazníka:** kolega dohledá, kdo má o vozidlo zájem, co s ním obchodník sjednal, kdo domluvu zaznamenal a kdy. Informace nezůstane pouze v paměti nepřítomného obchodníka.
- **Proč podrobně:** ztracená nebo nejednoznačná domluva je přímo jedním z hlavních problémů původního zadání. Vozidlo může mít více zájemců a jeden zájemce více navazujících domluv.
- **Zaměření specifikace a modelování:** přiřazení zájemce a domluvy k vozidlu, dohledatelnost autora a času, více zájemců a více domluv. Rozlišit záznam domluvy od vytvoření platného podržení v UC10; podrobnosti tohoto rozdílu musí potvrdit zákazník.
- **K validaci:** OT12 (vztah podržení, zálohy a rezervace). Zapsání domluvy typu záloha samo neurčuje, kdo eviduje platbu nebo jaký má platba účinek na rezervaci.

### UC10 Podržet vozidlo pro zájemce

- **Aktér:** Obchodník.
- **Vazba na požadavky:** F11, F12, N5.
- **Přínos pro zákazníka:** jedno vozidlo nelze současně platně slíbit dvěma zájemcům. Doba podržení respektuje individuální dohodu a další zájemci mohou zůstat v pořadí.
- **Proč podrobně:** jde o nejrizikovější koordinaci mezi obchodníky. Analýza musí zachytit souběžné požadavky a odlišit platný závazek od pouhého zájmu.
- **Zaměření specifikace a modelování:** vytvoření podržení s platností, již obsazené vozidlo, přidání dalšího zájemce do pořadí a souběžný pokus dvou obchodníků. Navazující vypršení se odkáže na UC12 a F13. Activity diagram rezervace musí ukázat i vypršení, zrušení a návaznost na dalšího zájemce, s označením nepotvrzených pravidel.
- **K validaci:** OT12 (význam rezervace, podržení a zálohy, odpovědnost za další kontakt), OT9 (měřitelná rychlost N5). Pořadí ani způsob kontaktování dalšího zájemce nesmí scénář doplnit bez zdroje.

### UC19 Prodat vozidlo

- **Aktér:** Obchodník. Na souvisejících schváleních a slevách se podílejí role podle navazujících UC.
- **Vazba na požadavky:** F8, F22. Podle současného diagramu zahrnuje UC20 a může se rozšířit o UC21 a UC22.
- **Přínos pro zákazníka:** převádí domluvu se zájemcem do evidovaného prodeje a prodejních dokladů. Rozlišuje vlastní vozidlo, komisi a případný protiúčet.
- **Proč podrobně:** v jednom procesu se setkávají údaje o vozidle a zákazníkovi, smlouva, cenová pravidla a odlišné formy prodeje. Chyba může vytvořit nesprávný doklad nebo obejít potřebné schválení.
- **Zaměření specifikace a modelování:** hlavní průběh prodeje, chybějící údaje a doklady, komisní prodej, sleva a protiúčet jako odkazy na rozšiřující UC. Popsat hranici vůči evidenci platby UC24 a předání UC23. Activity diagram prodeje a předání musí rozlišit varianty, které vyplývají z podkladů.
- **K validaci:** OT3 (platby), OT4 (informování o komisi), OT7–OT8 (osobní údaje), OT2 (seniorní role). Blokace prodeje pod minimální komisní cenou v F8 je odvození týmu. Nesmí se vydávat za zákazníkem potvrzené pravidlo.

### UC23 Předat vozidlo

- **Aktér:** Obchodník.
- **Vazba na požadavky:** F23, L5, L6.
- **Přínos pro zákazníka:** odděluje dokončení prodeje od skutečného předání a pomáhá ověřit, že jsou dostupné potřebné doklady a zaznamenaný stav vozidla.
- **Proč podrobně:** neúplné předání může přerušit dohledatelnost historie a obejít kontrolu potřebných podkladů. Komisní prodej navíc vyžaduje práci s plnou mocí.
- **Zaměření specifikace a modelování:** kontrolní seznam, úplné a neúplné podklady, předávací protokol a návaznost na stav vozidla. Aplikace eviduje a kontroluje předání; fyzické předání provádějí zaměstnanci.
- **K validaci:** část kontrolního seznamu F23 doplnil tým, právní pravidla L5/L6 nejsou plně potvrzená. OT5 řeší záruku a nová vozidla. Přesný okamžik přechodu do stavu Předáno musí odpovídat validovaným stavům z OT11. Záznam v tomto dokumentu není právním posouzením.

## 3. Pokrytí hlavního problému

| Potřeba z původního zadání | Vybrané UC | Co se bude ověřovat |
| --- | --- | --- |
| Vědět, které vozidlo lze ukázat a prodat | UC05, UC10, UC19, UC23 | Soulad stavu, platného podržení, prodeje a předání. |
| Vědět, co bylo komu slíbeno i při nepřítomnosti kolegy | UC09, UC10 | Vazba zájemce, vozidla a domluvy, autor a čas, platnost podržení. |
| Neslíbit stejné vozidlo dvěma lidem | UC10 | Odmítnutí druhé platné rezervace a práce s pořadím zájemců. |
| Připravit prodejní doklady a nepředat bez potřebných podkladů | UC19, UC23 | Chybějící podklady, odlišnosti komise a protiúčtu, hranice prodeje a předání. |

Vybrané UC pokrývají rizikovou návaznost od stavu a domluvy po předání. Nejde o tvrzení, že samy pokrývají všech 46 požadavků.

## 4. Co se vědomě podrobně nespecifikuje

Následujících 23 UC zůstává v celkovém diagramu a seznamu. Odkaz z vybraného scénáře na jiný UC nevytváří šestou samostatnou podrobnou specifikaci. Navazující UC a otevřené body se však nesmějí při modelování ignorovat.

| UC | Důvod omezení podrobnosti pro M1 |
| --- | --- |
| UC01 Založit vozidlo, UC02 Zadat údaje komisního prodeje, UC03 Upravit vozidlo a přiložit doklady | Poskytují vstupní údaje pro vybrané procesy. Pro tento výběr stačí návaznosti na evidenci a podmínky úplnosti údajů; samostatné detailní scénáře mají nižší prioritu než dostupnost a závazky. |
| UC04 Zapsat náklad na vozidlo, UC06 Vyhledat vozidlo | Důležité podpůrné funkce, ale neřeší přímo vznik a splnění příslibu. Jejich požadavky a otevřená oprávnění zůstávají v katalogu. |
| UC07 Sjednat výkupní cenu, UC08 Schválit výkupní cenu nebo cenu protiúčtu | Podpůrná cenová agenda. Vazby na dostupnost a protiúčet se zohlední v UC05 a UC19, bez samostatné specifikace schvalovacího procesu. |
| UC11 Naplánovat zkušební jízdu | Specifický druh domluvy. UC09 zachytí evidenci domluvy, nikoli celý kalendář a plánování jízdy. Rozsah osobních údajů zůstává otevřený. |
| UC12 Vyřídit vypršelé podržení | Navazuje na UC10 a patří do activity diagramu rezervace. Pro M1 se nevypracuje samostatná podrobná specifikace; odpovědnost za kontakt a pravidla po vypršení zůstávají v OT12. |
| UC13 Potvrdit termín prohlídky, UC14 Prohlížet veřejnou nabídku, UC15 Poslat dotaz nebo domluvit prohlídku | Veřejný vstup do agendy. Výběr upřednostňuje interní koordinaci a dokončení závazku. Veřejná nabídka nadále musí respektovat F16 a otevřené F18/L4. |
| UC16 Evidovat inzerci vozidla, UC17 Přiřadit e-mail k zákazníkovi a vozidlu, UC26 Zobrazit přehledy prodejů a marží | Navazují na požadavky priority S (F19, F20, F28). Pro M1 mají přednost základní procesy. |
| UC18 Zobrazit historii zákazníka, UC27 Zobrazit historii změn vozidla | Jde o zpřístupnění evidovaných informací. Vybrané procesy musí zachovat dohledatelnost podle svých požadavků, ale samostatné zobrazovací scénáře se nerozpracují. |
| UC20 Identifikovat zákazníka z dokladu, UC21 Poskytnout slevu, UC22 Přijmout vozidlo na protiúčet | Sdílený nebo rozšiřující průběh UC19. Ve specifikaci UC19 se uvedou místa návaznosti, požadavky a nejistoty. Nevzniknou samostatné detailní specifikace těchto UC. |
| UC24 Zaevidovat platbu | Samostatná agenda s otevřenými způsoby plateb, oprávněními a účetní integrací (OT1, OT3, OT6). UC19/UC23 zachytí hranici a potřebnou návaznost bez domýšlení platebního procesu. |
| UC25 Zobrazit upozornění | Podpůrný přehled. Návaznosti na vypršení podržení a neúplné předání se zaznamenají u příslušných procesů, bez detailního scénáře přehledu. |
| UC28 Spravovat uživatele a role | Provozní správa mimo hlavní obchodní průběh, navíc s nevalidovanými oprávněními (OT1). Oprávnění zůstávají podmínkou vybraných UC. |

