# Otázky na zákazníka a jeho odpovědi

| Verze | Datum | Autor | Změna |
| --- | --- | --- | --- |
| 1.0 | 8. 10. 2026 | tým | Otázky připravené s pomocí AI, odpovědi zaznamenané z rozhovoru se zákazníkem (týden 2). |

Odpovědi jsou zapsané tak, jak je zákazník řekl. Interpretace a z nich odvozené požadavky jsou v [zadani-v1.0.md](zadani-v1.0.md).

## Organizace a role

**1. Kolik máte poboček a zaměstnanců a jaké role ve firmě jsou? Kdo s autem co dělá a jak se zastupujete, když někdo chybí?**
Jednu pobočku, 10 zaměstnanců: obchodník, majitel, účetní a pracovník skladu a přípravy vozidel.

**2. Kdo smí vidět nákupní ceny a marže, kdo smí dávat slevy a do jaké výše?**
Nákupní ceny vidí obchodník, majitel a účetní. Slevy smí dávat pouze seniorní obchodník nebo majitel. Uživatel může mít více rolí.

## Vozidla

**3. Jakými fázemi auto prochází od první informace o něm po předání a co musí být splněno, aby šlo nabídnout zákazníkovi?**
Výkupní cenu u vykupovaných aut sjednává obchodník nebo majitel, ale musí ji schválit majitel nebo seniorní obchodník. U komisního prodeje se sjedná minimální prodejní cena a marže. U všech aut se eviduje hrubě technický stav.

**4. Jaké údaje, náklady a doklady k autu evidujete a podle čeho ho jednoznačně poznáte, i když ještě nedorazilo?**
VIN, výkupní cena, SPZ (pokud má), technický stav.

**5. Jak se liší vlastní prodej, komisní prodej a auto na protiúčet?**
Vlastní: koupíme a pak prodáme. Komisní: domluví se minimální cena a marže. Protiúčet: částku musí schválit majitel nebo seniorní obchodník.

## Zájemci a rezervace

**6. Jaké druhy domluv se zákazníkem rozlišujete a jaká pravidla pro ně platí?**
Prohlídka, zkušební jízda, podržení, záloha, podpis dokumentu. Doba podržení je individuální dohoda.

**7. Může mít auto více zájemců v pořadí? Co se stane, když rezervace vyprší?**
Ano. Po vypršení se auto nabídne dalšímu zájemci v pořadí.

**8. Jak plánujete zkušební jízdy a co při nich od zákazníka potřebujete?**
Osobní doklady. Eviduje se datum, čas a vybrané vozidlo.

## Inzerce a veřejná nabídka

**9. Kde inzerujete a co se má s inzerátem stát při rezervaci a prodeji?**
Web, noviny, plakáty. V aplikaci chce mít přehled, kde všude inzeráty jsou.

**10. Má mít systém veřejnou nabídku pro zákazníky? Co v ní má být vidět a má jít přes ni domluvit prohlídku nebo poslat dotaz?**
Ano. Zákazník vidí cenu, technický stav, popis vozidla a fotografie. Může domluvit prohlídku i poslat dotaz.

**11. Mají se dotazy z webu i portálů sbíhat na jedno místo a kdo je vyřizuje?**
Uvádí firemní e-mail a tyto e-maily chce vidět v systému.

## Prodej a zákazníci

**12. Jaké dokumenty k prodeji připravujete a co musí být vyřízené před předáním?**
Kupní smlouvu (zákazník řekl „nákupní“), k dispozici musí být technický průkaz vozidla, u komisního prodeje plná moc.

**13. Jak zákazníci platí a musí systém navazovat na účetnictví?**
Převodem nebo kartou. Systém musí být napojen na účetní systém.

**14. Jaké údaje o zákaznících potřebujete, jak dlouho je uchováváte a s čím se ozývají po koupi?**
Údaje z osobních dokladů: jméno, příjmení, adresa, číslo řidičského průkazu. (Doba uchování a poprodejní kontakty nezodpovězeny.)

## Funkce navíc

**15. Jaká upozornění a přehledy potřebujete?** Ano (všechny navržené).

**16. Má systém zaznamenávat, kdo co u auta změnil?** Ano.

## Nefunkční požadavky

**17. Na jakých zařízeních a kde budou prodejci se systémem pracovat?** Web, kdekoli.

**18. Kdy musí systém fungovat a jaký výpadek nebo ztráta dat je přijatelná?** Výpadek maximálně jeden den v pracovní době.

**19. Kolik aut máte v nabídce, kolik prodáte za měsíc a počítáte s růstem?** 300 aut, měsíčně 30, ano.

**20. Jak se mají zaměstnanci přihlašovat a kdo řeší ochranu osobních údajů?** E-mail a heslo, důvěryhodná osoba pro GDPR.

## Dodání

**21. Od kdy potřebujete systém používat a je termín pevný?** Za půl roku, není pevný, ale maximálně rok.

**22. Chcete systém celý najednou, nebo postupně?** Prvotní verze k náhledu za půl roku, kompletní nejpozději za rok.

**23. Kdo bude rozhodovat o požadavcích a jak často se chcete potkávat?** Majitel. Nejlépe jednou ročně, teď na začátku vícekrát podle potřeby a dohody.

**24. Co je důležitější: termín, rozsah, nebo rozpočet?** Rozpočet.

**25. Jak proběhne přechod, zaškolení a kdo se bude o systém starat?** Majitel. Přechod ručním přepsáním pracovníky.

## Právní povinnosti

**26. Přijímáte vyšší platby v hotovosti nebo zprostředkováváte úvěr? Jak ověřujete totožnost?** Hotovost jen do 100 000 Kč, úvěr nabízí, doklad totožnosti.

**27. Jak sdělujete, že jde o auto v komisi a kdo je vlastníkem?** Když zákazník přijde na prohlídku, předají mu tyto údaje.

**28. Jakou záruku dáváte a jak dokládáte stav auta při předání?** Záruka 2 měsíce, u nových 2 roky. Doklad z kontroly STK.

**29. Kdo vyřizuje přepis v registru a potřebujete hlídat, že proběhl?** Obchodníci a pracovníci autobazaru.

## Rozpory a nejasnosti zjištěné při zpracování

- Odpověď 13 uvádí platbu převodem a kartou, odpověď 26 hotovost do 100 000 Kč.
- Odpověď 28 zmiňuje „nová“ auta, zadání mluví jen o ojetých.
- Záruka 2 měsíce (28) a informace o komisi až při prohlídce (27) pravděpodobně neodpovídají zákonu. Viz L4 a L5 v zadání.
- Četnost schůzek jednou ročně (23) neodpovídá plánu s náhledovou verzí za půl roku.
