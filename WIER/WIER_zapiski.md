# SPLETNI PAJKI

# Predavanje 2

### Pajkove zanke

Zanka: Pajek se vedno giblje po istih straneh.

Reševanje:

- Ne spremejamo piškotkov (cookijev)

- Omejimo dolžino URL-ja

- Omejimo število strani iz določene domene

POS tagging - Oblikoslovno označevanje

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

# TODO od prejšnjič

- fokusirani pajki:
  
  - kategorije -> drevo kategorij
  
  - učna množica
  
  - klasifikator ( p, c∈C) -> bayesov klasifikator
  
  - šibka in stroga strategija

- Kontekstualni pajki:

# Predavanje 3

## Tuneliranje

Izhajamo iz omejitev Best-first pajkov.

vprašanja:

- Do kdaj slediti neki poti (na kateri bodo vmes tudi slabe strani)?

- Kako ugotavljati, da je neka pot perpektivna?

**Koncepti:**

- Dobre strani (relevantne strani) - o

- Slabe strani (nerelevantne strani) - x

- meja podobnosti (threshold)

- cutoff (max dožina)

- dolžina

dolžina(p) = 0 if p relevantna; 1 + dolžina(parent(p))

Ugotovtve raziskave:

- Najpogostejša razdalja med dvema dobrima stranema je 7-8.

- Boljši starši imajo boljše otroke, obratno ne velja

- Zaporedje dobrih strani je dober indikator, da je stran perspektivna - če so 3 dobre strani zapored in nato ena slaba, je dober indikator, da nadaljujemo po tej poti.

- Predlagali so formulo:
  dolžina(p) = 0 if p relevantna; min(1, 1-(c*e^(2dp/c))), kjer c - podobnost s kategorijo

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

Značilnost: prilagajajo ali spreminjajo strategijo

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
