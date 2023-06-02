# SPLETNI PAJKI

## Arhitektura

### Osnovna arhitektura

Vsak spletni pajek vsebuje:

- Frontier (frontier) -  vanj se zapisujejo URL-ji, ki so naslednje na vrsti za obdelavo

- Semenske strani - strani iz katerih izvira naš pajek

- Repozitorij -  vanj se shranjujejo informacije, ki jih je pajek pridobil

- Implementacija:
  
  - Shranjevanje URL-jev
  
  - Strategija izbire URL-jev
  
  - Strategija, če je Frontier poln

- Izzive in omejitve

### Pajki z iskanjem v širino

- Frontier se polni na podlagi FIFO principa - prvi notri prvi ven

- Zaradi tega mora Frontier imeti omejeno velikost

### Zgodovina pajka

- Razlogi, zakaj mora pajek imeti zgodovino:
  
  - Ne želimo obistaki isto stran večkrat
  
  - Poveča učinkovitost, ker se iz zgodovine lahko učimo

- Implementacija v RAM-u ker potrebujemo veliko hitrost - Uporabljamo razpršene tabele (hash table)

- Potrebujemo tudi iskanje duplikatov

### Preferenčni pajki

- Ti pajki gredo preferenčno rajši v nekatere strani kot druge

- Pomembno je, da se zavedamo:
  
  - Okolice preference: topologija spleta, vsebina strani
  
  - Izbira semenskih strani

- Pajek mora imeti možnost sortiranja:
  
  - Sortiran dinamični seznam in Hash table

- Časovna kompleksnost je večja kot pri osnovnih pajkih

- Imenujemo jih tudi **Best-first** pajki

## Implementacija

Implementacija pajka vsebuje:

- Zajem strani (fetching)

- razčlenjevanje (parsing)

- odstranjevanje stopwordov in stemming

- Ekstrakcija linkov in kaknonizacija (canonicalization)

- Izogibanje zankam

- Realizacija repozitorija

- Sočasnost

### Zajem strani

- Spletni pajek se obnaša kot spletni odjemalec.

- Omejimo čas čakanja na odgovor in velikost.

- Pomagamo si lahko z HTTP glavami, ki nam dajo lahko pomembne podatke

- Detekcija in odprava napak

- Vodenje statistike

### Razčlenjevanje

- Pomembno je, da izluščimo povezave in naredimo analizo vsebine

- Pri razčlenjevanju si pomagamo s tem da pretvorimo dokument v DOM
  
  - Najprej pošistimo HTML in naredimo DOM
  
  - Notri poiščemo značke in odstranimo vse dele, ki se ne nanašajo na vsebino

- Datoteke ne bodo vedno v HTML formatu.
  
  - Ponavadi to vidimo v HTML headerju

### Odstranjevanje stopwordov in stemming

- Eliminacija besed brez pomena, dodane vrednosti

- Stemming - Besede spravimo v določeno obliko:
  
  - Pretvorimo besedo v koren besede: running, runs -> run
  
  - Boljša je lematizacija, ki pretvori besedo v svojo korensko obliko.

- POS tagging - Oblikoslovno označevanje
  
  - Classla -> stanza
  
  - NLP -> procesiranje naravnega jezika
  
  - primer: dan->sme1, Martin->IOme1
  
  - besedne vrste:
    
    - S, I - samostalniki
    
    - G - glagoli
    
    - P - pridevniki
    
    - Z - zaimki, ...
  
  - Oblikoslovne kategorije:
    
    - spol(m, ž, s), število(e, d, m), sklon(i, r, d, t, m, o), oseba(1., 2., 3.), stopnjevanje, določnost in razmerje

### Ekstrakcija povezav in kanonizacija

HTML je možno spraviti v hierarhično DOM obliko, ki omogoči lažjo ekstrakcijo povezav.

Filtriranje: Moramo vedeti, katere povezave so spletne strani, ne pa drugi dokumenti. Tega ne moremo zanesljivo vedno vedeti samo iz povezave.

Avtonomno poizvedovanje: Brska po skritem spletu prek queryjev

URL naslove moramo normalizirati, zato, da se izognemo duplikatom

### Pajkove zanke

Zanka: Pajek se vedno giblje po istih straneh.

Zgodi se takrat, ko se strani avtomatsko generirajo.

Reševanje:

- Ne spremejamo piškotkov (cookijev)

- Omejimo dolžino URL-ja

- Omejimo število strani iz določene domene

### Repozitorij

Ko enkrat strani zajamemo, moramo strani shraniti v

- Bazo:
  
  - Vse v eni datoteki, lahko poizvedovanje

- V svojo datoteko:
  
  - Hashiramo strani -  da nimamo dupoliaktov:
    
    - Velik overhead za OS
  
  - Veliko strani v eni datoteki:
    
    - Potrebujemo mapiranje

### Paralelno delovanje

Izkorišča računalnišče vire do polne zmogljivosti:

- Uporabimo več-procesorsko delovanje

- Uporabimo več-nitno delovanje

Potrebujemo Frontier managerja, ki poskrbi, da bo en proces bral ali pisal iz Froneiterja naenkrat.

## Univerzalni pajki

Univerzalni pajki morajo obiskati več sto tisoč strani na sekundo

Zaradi tega potrebujemo visoko skalabilnost v vse strani.

Cilj univerzalnega pajka je:

- Zajeti čim več strani

- Ne pozabiti pomembnih strani

- Imeti čim bolj sveže podatke

#### Zajemanje vs. svežina vs pomembnost

Indeksirati hočemo celoten splet

Moramo imeti pomembnostne metrike - (in-degree, PageRank)

Do nothing approach: Če merimo pomembnost z količino vhodnih povezav, bomo slej kot prej prišli v to stran

Če hočemo imeti statistično pravilen vzorec spleta:

- Ne sme biti odvisna samo od vhodnih povezav

- $P_r(accept(p)|crawl(p)) * P_r(crawl(p))$

- $Pr(accept(p)|crawl(p)) = \frac{1}{PageRank(p)} = \frac{1}{f(p)}$

### Skalabilnost

Uporabljajo množico izboljšav pred običajnimi pajki:

- Asinhrona vrata - ne blokirajo komunikacije, več vrat odprtih na vsaki niti

- Več URL vrst, ne potrebujemo še enkrat opravljati TLS handshake

- Uporaba DNS:
  
  - Uporaba UDP - ni varen, a ne potrebujemo
  
  - Uporabljamo hiter predpomnilnik
  
  - Uporabimo predpomnenje

- Uporaba več povezav hkrati

- Uporaba SAN (Storage switch)

## Fokusirani pajki

- ODP shranjuje dobre spletne strani izbranih kategorij

- Fokusirani pajek išče strani, ki ustrezajo izbranim kategorijam in dopolnjuje indeks

- Fokusirani pajki imajo za razliko od Tematskih pajkov že velik kontekst dobrih spletnih strani, ki so kategorizirane.

#### Klasifikacija fokusnega pajka

- Za vsako kategorijo bi lahko izdelali klasifikator:
  
  - Vsaki strani izračunamo vrjetnost da spada v nekatero kategorijo - Relevance Score
  
  - V frontierju imamo strani razvrščene po seštevku vrjetnosti da spada v katero kategorijo

- Šibka strategija:
  
  - Analiziramo stran in te URLje napišemo v frontier z Relevance scori.

- Stroga strategija:
  
  - Najprej poišče kategorijo, ki je v listu in izračuna verjetnost, ter izbere list z največjo vrjetnostjo
  
  - Pogledamo, če je list sam ali njegov prednik v kategoriji, ki jo iščemo, ga dodamo, drugače pa ne.

#### Klasifikacija z naivnim bayesom

- $P_r(c|d) = \frac{P_r(d|c)*P_r(c)}{P_R(d)}$, kjer je **$c \in C$** kategorija iz množice kategorij **$C$** in **$d$** predstavlja stran, ki smo jo obiskali.

Za potrebe poizvedovanja po dokumentu imamo naslednjo enačbo:

- $P_r(c|d) \approx P_r(c) \prod_{i=1}^{|V|} P_r(w_i|c_k)^{f_{w_i}}$, kjer je $V$ slovar posameznih besed **$w_i$** in dokument **$d$**, ki ga hočemo klasificirati, **$f_{w_i}$** je frekvenca besed $w_i$ v $d$

### Kontkekstualni fokusirani pajki

Zaradi nerelevantnosti trenutne strani nehamo iskati po tej poti.

Pomaga si s sklepanjem z uporabo kontekstnega grafa - hranimo povezave med stranmi. Procedura:

- Za vsak nivo kontekstnega grafa želimo klasifikator, ki pove vrjetnost, da stran spada na določen nivo

## Tuneliranje

Izhajamo iz omejitev Best-first pajkov.

vprašanja:

- Katerim stranem slediti?

- Do kdaj slediti neki poti (na kateri bodo vmes tudi slabe strani)?

- Kako ugotavljati, da je neka pot perpektivna?

**Koncepti:**

- Dobre strani (relevantne strani) - o

- Slabe strani (nerelevantne strani) - x

- Pot  - je sekvenca od ene dobre strani do druge dobre strani (oxxxxo)

- meja podobnosti (threshold) - minimalna podobnost z kategorijo, da je dobra stran

- cutoff (max dožina poti)

- dolžina - od zadnje dobre strani

dolžina(p) = 0 if p relevantna; 1 + dolžina(parent(p))

Ugotovtve raziskave:

- Najpogostejša razdalja med dvema dobrima stranema je 7-8.

- Boljši starši imajo boljše otroke, obratno ne velja

- Zaporedje dobrih strani je dober indikator, da je stran perspektivna - če so 3 dobre strani zapored in nato ena slaba, je dober indikator, da nadaljujemo po tej poti.

- Predlagali so formulo:
  dolžina(p) = 0 if p relevantna;$min(1, (1-c)e^{\frac{2d_p}{C}})$ , kjer $d_p$ razdalja starša, $c$ - trenutna korelacija, $C$ - cutoff

## Tematski pajki

1. Omejeno znanje o temi, ki jo iščejo | ključne besede, spletna stran

2. Iščemo v realnem času (ni indeksa)

3. Učimo se sproti

**Prednosti:** Zelo sveži podatki

**Slabosti:** Počasnejši, manj natančni

**Signali / informacije**, ki jih tematski pajek lahko upošteva:

- Leksikalna podobnost

- Topološka podobnost / podobnost povezav

- Semantična podobnost

##### Leksikalna podobnost

p1 in p2 sta podobni, če imata podobno vsebino.

Če je p1 relevantna, in je p1 podoben p2 => velika vrjetnost, da je p2 relevantna.

##### Podobnost povezav

Če sta p1 in p2 podobni po povezavah, potem sta si blizu:

- sta povezani

- imata podobne strani, ki na njiju kažejo (in-link)

- Kažeta na podobne strani (out-link)

**Indici iz povezav:**

1. kocitiranost - če imata strani podobne cicate, sta si strani podobni

2. stičišča - spletne strani, ki kažejo na dobre strani -> če stičišče kaže na stran, sklepamo da je dobra

3. Bibliografska podobnost - če stran kaže na iste strani kot dobra stran, sklepamo da je dobra (obratno od kocitiranosti)

##### Načini izračuna

1. Leksikalna podobnost: TF/IDF + kosinusna podobnost

2. Podobnost po povezavah: bag of links - vreča povezav -> Jaccardova podobnost

3. Semantična podobnost: ODP

Variacije princiap gibanja BEST-first:

- Naivni BF pajek: TF-IDF

- Infospider, Clevercrawler, Sharksearch: tekst URL, pozicija besed v DOM, tagi, ...

##### Best n-first pajek

Eksploracija - raziskovanje

Eskplotacija - sledenje strategiji naučeni iz zgodovinskih podatkov / preteklosti

Kako deluje?

- Iz frontierja vzame n najboljpih URL-jev

- Vse obdela in vse najdene UR-je da v frontier

## Adaptivni pajki

Značilnost: prilagajajo ali spreminjajo strategijo, gre se za inkrementalno učenje.

Algoritem:

1. izbira značike (lambda fei)

2. zajemi n strani

3. preračunaj faktorje interesa

4. ponovno razvrsti URL-je v frontierju

##### Inteligentni pajek

primer pajka z adaptivno strategijo

Značilke:

- vsebina (ključne besede)

- URL tekst

- število že obiskanih strani ki kažejo na P

- Relevantni kocitati

# Predavanje 5?

zadnjič -> kako naredit pajka, ki uporablja spdbujavalno učenje, da se premika po spletu, ima boljše rezultate-> boljše se premika po relevantnih straneh

### Evalvacija pajkov

- Evalvacija prek aaplikacij -> ključna aplikacija je iskalnik

- Predpogoji:
  
  - Zadostno število poizvedb
  
  - Zadostno število tematik
  
  - Metodologije, ki upoštevajo dinamičnost spleta

- Izziv:
  
  - Nimamo splošno priznanih množic za evalvacijo -> Relevantnost zato ocenjujemo. Kako?
    
    - Število ključnih besed, ki se pjavijo v dokumentu.
    
    - Frekvenca ključnih besed na strani
    
    - Kosinusna razdalja
    
    - Klasifikator
    
    - N-pajkov
    
    - Metrike na osnovi prestiža

### Metrike

Natančnost: $P = {TP \over TP + FN}$, TP = true positive, FN = false negative

Priklic: ...

###### Metrike na osnovi natančnosti

- Harvest rate: $št. relevantnih \over št. obiskanih$

- Dolžina zajema: Koliko korakov moramo narediti za N relevantnih strani

###### Metrike na osnovi priklica

1. Štejemo relevantne strani (omejimo se s časom ali številom korakov)

2. Kot izhodišče vsamemo klasificirane strani npr. ODP -> pomaknemo se N korakov proč.

### Etika pajkov

1. Frekvenca klicov na domeno: 1 na sekundo

2. Etiketa pajka: 
   
   - el. naslov, Ime in priimek
   
   - namen pajka

3- Robots.txt - Administrator pove, do kje lahko kakšen pajek dostopa.

# INFORMACIJSKO POIZVEDOVANJE

Komponente:

- Obdelava poizvedbe

- Iskalnik

- Indeks 

- Kolekcija

- Indeksirnik -> Podatke iz kolekcije daje v indeks

Dodatni izzivi:

- Velikost, hitrost

- Vsebina

- SPAM

### Modeli informacijskega poiizvedodanja

1. Logični model

2. Vektorski model

3. Jezikovni model

4. Verjetnostni modeli

1., 2., 3., Uporabljajo "Vrečo besed" ali bag of words. -> ne zanima nas vrstni red besed.

### Formalizacija

**D** - Kolekcija dokumentov $\{d_1, d_2, ... d_n\}$ - dokumenti

**V** - Slovar besed $\{t_1, t_2, ... t_n\}$ - termini, |**V**|- velikost slovarja

$d_j$  = $(w_1, w_2, w_3 ..., w_i)$ dokument z indeksom j, $w_n$ - utež besede (termina) v dokumentu

## Logični model

Uteži terminov v dokumentu predstavljene z 1 ali 0, če termin je v dokumentu ali ni.

Predstavljeno je kot vektor, med poizvedbo in dokumentom se izvede vektorski produkt, da se izve, ali ej dokuente relevanten ali ne.

## Vektorski model

Dokument je predstavljen z vektorjem, ki za vsak termin iz slovarja pove nekaj o tem terminu.

Možnosti uteži:

- TF (Term Frequency) - pojavnost termina

- Normaliziran TF :
  
  - Evklidova normalizacija: $f_{ij} \over \sqrt{f_{1j}^2+f_{2j}^2+ ... f_{nj}^2}$ 
  
  - Neka druga: $f_{ij} \over max(f_{ij})$

- TF IDF (Term Frequency, inverse document frequency): $w_i = TF \ log {N \over d_{fi}}$

###### Izračun relevantnosti

Koliko je relevantnost našega dokumenta j, pri poizvedbi q -> $relevance(d_j, q)$ 

Če sta $d_j$ in $q$ vektorja, lahko naredimo skalarni produkt in dobimo skalar.

Lahko uporabimo tudi kosinusno razdaljo: $cosine(d_j, q) = {d_j * q \over |d_j| *|q|}$ 

Ali kosinusno podobnost: $1- cosine(d_j, q)$

### Jezikovni model

Lahko jih predstavimo kot avtomate, kjer zmnožimo vrjetnosti povezav med seboj.

Namesto n-gramskega modela (besede povezane med seboj) imamo unigramskega, z namenom pospešitve.

unigramski model: za vsak termin $t_i$ imamo vrjetnost.

Če vse verjetnosti med seboj seštejemo, je rezultat enak ena.-> verjetnostna disribucija čez termine.

S tem dobimo verjetnostno distribucijo za poljubno razporeditev besed.

Verjetnost: $P_r(q | d_j) = \prod_{i=1}^{|V|} p(t_i | d_j)^{f_{iq}}$

Z unigramom ni več zaporedja besed, besede so med seboj neodvisne.

### Upoštevanje povratne informacije

$D = R_R \ \cup \ R_{IR}$

###### Rocchio metoda

$q$ - naša poizvedba

Rocchio metoda poizkša ugtoviti, kje je težišče relevantnih in irelevantnih dokumentov, premakne poizvedbo bližje relevantnim dokumentom. Vse dokumente predstavimo z vektorji.

$q_e = \alpha q + {\beta \over |D_r|} \sum_{d_r \in D_r}d_r - {\gamma \over |D_{IR}|} \sum_{d_{ir} \in D_{IR}} d_{ir}$

Z uporabo tega lahko uporabimo Rocchio metodo za klasifikator

###### Rocchio kasifikator

$c_i = {\alpha \over |D_i|} \sum_{d \in d_i} {d \over |d|} - {\beta \over |D - D_i|} \sum_{d \in D-D_i} {d \over |d|}$

###### LU learning

Labeled and Unlabeled learning

- Sopojavnost besed -> kjer se pojavlja nogomet, se pojavlja tudi šport

###### PU learning

positive and unlabled learning

- zgradimo klasifikator na podlagi množice P ali relevantnih

###### Pseudo feedback

$q$ - osnovna poizvedba

$q_e$ - razširjena poizvedba na osnovi rezultatov prejšnje poizvedbe

Lahko naredimo več ciklov.

# Invertni indeks

Najbolj učinkovit indeks za poizvedovanje.

Sestavljen iz:

- Slovarja V unikatnih terminov iz množice dokumentov $D = \{d_1, d_2, ..., d_n\}$

- Za vsak termin $t_i$ invertni indeks postingov
  $t_i = <{posting}_1>, <{posting}_2>, ...$

V postingih imamo oznako termina, frekvenco termina, in offsete, kje od začetka se pojavlja ta beseda v dokumentu

$<id_j, f_{ij}, [o_1, o_2, ...,o_{|f_{ij}|}]>$

### Latentna semantična analiza - LSI

Namestu, da dokumente predstavimo v vektorskem prostoru, vzpostavimo koncepte, na katere bi dokumente boljše razločili med seboj.

Naredimo razcep na singularne vrednosti.

$A = U \ \Sigma \ V^T$

$U = AA^T$ - kateri termini nastopajo v skupnih dokumentih

$\Sigma = diagonalna \ martika$

$V^T = Singularni \ vektorji \ A^TA$ - kateri dokumetnti imajo skupne termine

# Spletno iskanje

Crawling -> parsing -> indexing -> search & rank

#### Prestiž

preko teorije grafov

- Prestiž povezanosti

- Prestiž okolice

- Prestiž ranga
  
  - pageRank
  
  - HITS

### Luščenje

1. Čiščenje HTML

2. zgradimo DOM drevo

3. Analiza strani
   
   - Identificikacija seznamov
   
   - identifikacija objektov
   
   - Ovojnica, luščenje

#### Tehnika

1. Primerjava nizov (stringov)

2. primerjava dreves: Simple Tree Matching:
   
   - $NSTM= \frac{STM(A, B)}{(nodes(A) + nodes(B))/2}$ - Metrika podobnosti
   
   - Obiskujemo drevo v pre-order načinu
   
   - upoštevamo pravila:
     
     - Vsako vozlišče iz A lahko poravnamo samo enkrat
     
     - ohranimo zaporedje vozlišč
     
     - ohranimo hierarhije

kaj bomo obravnaval:

1. Kako iz poravnanih dreves izračunat podobnost

2. Večkratna poravnava
   
   - Center star metoda - na stringih
   
   - Delno poravnana drevesa - na drevesih

3. Gradnja DOM

4. Zajem podatkov s strani
   
   - Identifikacija seznamov
   
   - Segmentacija zapisov na objekte
   
   - poravnava objektov

## Večkratno usklajevanje

Iskanje ponavljajočih se vzorcev iz HTML

- Optimal multiple allignment - Ne uporabljamo

- Center star method

- Partial tree alignment

#### Center star method

Angoritem je nekje

Levensteinva razdalja izberemo $S_c$ -> seštevek razdalj, ki jih ima do drugih stringov je minimalen.

k - št. stringov, n - povp.dolžina stringov

$d(s_1, s_2) -> O(n^2)$

Izbor $S_e -> O(n^2 k^2)$

primerjava/poravnanje stringov $O(kn^2)$

Primer:

$S = \{ABC, XBC, XAB\}$

$S_c = ABC$

Iteracija 1

$c^* = s_c = ABC, S = XBC$

$align(ABC, XBC)$ -> Največji allignment ABC, XBC je 2

$M = \{ABC, XBC\}$

Iteracija 2

$c^* = ABC, S = XAB$

$align(c^*, s)$ dobimo $\_ABC, XAB\_$

$M = \{\_ABC, XAB\_, \_XBC\}$

#### Delna poravnava dreves

Naj bodo $v_j...v_k$ zaporedna vozlišča v drevesu, ki ga primerjamo s centralnim

Vozlišča $v_j...v_k$ lahko vstavimo v $T_s$, če imajo v $T_s$ enolično mesto:

1. Levo od $v_j..v_k$ sta vozlišči, ki sta v $T_s$ skupaj.

2. Če imajo $v_j...v_k$ samo eno vozlišče na levi in če je to vozlišče najbolj desno v $T_s$, potem jih lahko dodamo v $T_s$ desno od tega vozlišča.

3. Če imajo $v_j...v_k$ samo eno vozlišče na desni in če je to vozlišče najbolj levo v T_s, potem jih lahko dodamo v T_s levo od tega vozlišča.

#### Izzivi pri poravnavi

- seznam je v splošnem poljuben

- podatkovni zapisi se ne začnejo nujno s prvim elementom na nivoju

- vmes se lahko prekinejo

#### Definicije

- **Posplošena vozlišča** so kombinacija $r \geq 1$ vozlišč, ki so zaporedna in imajo istega očeta

- **Podatkovni seznam** je seznam $n \geq 2$ posplošenih vozlišč z naslednjimi lastnostmi:
  
  - poslpošena vozlišča imajo istega očeta
  
  - posplošena vozlišča imajo iste dolžine
  
  - posplošena vozlišča so zaporedna
  
  - podobnost posplošenih vozlišč $\gt \tau$
  
  - Kje se začne prvo pospl. vozl.

- Želimo ugotoviti za pospl. vozl.:
  
  1. Kje se začne pospl. vozlišče?
  
  2. Koliko vozlišč zajema
