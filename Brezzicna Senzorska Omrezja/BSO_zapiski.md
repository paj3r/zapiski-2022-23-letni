Vodilo i2c ...

### Vodilo SPI

enostavno serijsko vodilo za povezavo naprav.

Vodilo vodi gospodar, na katerega lahko priklučimo več naprav.

Prenos se vrši serijsko, kjer gospodar tvori uro. V 8 urinih ciklih se prenesejo podatki prek shift registra. (8 bitov, vsak v svojem urnem ciklu)

Vsaka naprava se naslavlja posebaj.

Povezave gospodarja in naprave: 

- MOSI - master output slave input

- MISO - Master input slave output

Protokol je zelo hiter, uporablja se za komunikacijo komunikacijskih naprav.

Hitrost ure lahko doseže tudi do 10 MHz in več, spodnja hitrst ni določena

Realizacija je pogosto v strojni opremi, pri enostavnejših mikrokontrolerjih je lahko realizirana programsko.

Pogosto vezja podpirajo SPI in I2C vodila

SPI vodilo se uporablja tam, kjer so potrebne visoke hitrosti.

## Primer majhne porabe energije

TODO

# Predavanje 3

TODO

senzorji...

## Prenos podatkov iz senzorskih omrežij

### MQTT

Message Queueing Telemety Transport

Sporočillni sistem, ki ga je razvil IBM

Sedaj je standard ISO/IEC PRF 20922

Je sistem za pošiljanje sporočil na osnovi odjemalec/strežnik 

Prirejen za prenos sporočil med napravami (M2M)

Enostaven in primeren za rešitve z omejenimi resursi

##### Odjemalec strežnik

Odjemalec pošilja podatke na posrednika (broker), ki nato pošilja podatke strežnikom.

- Prostorska neodvisnost: napravi, ki si pošiljata podatke ne ptrebujeta informacij, kot so na primer IP številka in številka vrat

- Časovna neodvisnost: izvorna in ponorna naprava sta časovno popolnoma neodvisni

- Neodvisnost pri sinhronizaciji: prejemnik in oddajnik sta med seboj popolnoma neodvisna, saj za prenos skrbi posrednik.

##### Naslavljanje sporočil

Primer naslova: *Fakulteta/prostor/vir*

Naslov je hierarhičen, posamezni deli naslova so ločeni s /, simbol + pomeni kater koli del naslova(*fakuteta/+/temperatura*), simbol # pomeni karkoli (*fakulteta/#*), naslovi, ki se začnejo s \$ so rezervirani za sistem.

##### Vzpostavljanje povezave

MQTT uporablja TCP prenosni nivo., odjemalec se mora povezati s posrednikom.

Connect -> ConAck

##### Varnost

- Varnost:
  
  - Za prijavo na strežnik se lahko uporablja uporabnišško ime in geslo
  
  - Uporablja se lahko šifrirana povezava TLS
  
  - Nekateri strežniki omogočajo lastno šifriranje podatkov E2E

- Težave:
  
  - Generiranje ključev s pomočjo certifikatov je procesorsko in pomnilniško zahtevno opravilo

##### Uporaba v brskalniku

MQTT omogoča komunikaciji preko tehnologije webSocket

Neposredna komunikacija je samo med posrednikom in brskalnikom

Posrednik je obilajno monejpi račinalnik, zato nima težav z ...

# Predavanje 5?

## Aloha protokol

#### Propustnost

- Predpostavimo, da je vrjetnost generiranja k okvirov v intervalu t podana s Poissonovo vretnostno porazdelitvijo:
  
  $\pi_k(t) = {(\lambda t)^k \over k!}e^{-kt} ni pravilna$

##### Težave pri dostopu do skupnega medija

- Pri dostopu do skupnega medija naetimo na težavo, kako zaznati ter se izogniti trkom na mediju

- Zaznava trka mora zahtevati im manj časa

- Ko trk zaznamo, je potrebno v čim krajšem času nadaljevati z uspešnim prenosom podatkov.

- Najbolje je, da na isti frekvenci ne sprejemamo in oddajamo hkrati, ko oddajamo ne moremo spremejati.

##### Poslušanje pred oddajo

**CSMA** Carrier sense multiple access preverja ali je medij prost pred oddajo.

Težave lahko nastanejo zaradi skritih vozlišč:

- Če se A in C ne vidita, oba pa vidi B, lahko pride do trkov.

##### Obveščanje o oddajniku

- Težava radijskega prenosa je, da je sprejet signal bistveno šibkejši od oddanjega signala, zato naprava med oddajanjem ne more zaznati, če oddaja še kakšna druga naprava.

- Možne reštve:
  
  - Poseben kanal, kjer se sporoča zasedenost kanala (Busy tone)
  
  - Naprava...

- RTS (Request to send), CTS (Clear to send)

### Algoritem S-MAC

- S-MAC - Sensor MAC

- Težava je neprestano poslušanje medija

- Algoritem uvaja periodo aktivnosti in periodo spanja

- V aktivni periodi se naprava sinhronizira na sosede, če sosedov ni, izbere svojo periodo

- Pojavijo se lahko otoki z različnimmi cikli:
  
  - V tem primeru lahko ena izmed naprav deluje kot posrednik (S-MAC)

### Algoritem Timeout-MAC

- Naprava lahko spi, ko druga naprava oddaja

- Čas trajanja spanja se določi z NAV vektorjem

- Možna težava pri komunikaciji: C žali poslati napravi D, vendar A že pošilja napravi B.

### Brez sinhronizacije

- Naprava se periodično zbuja in preverja ali je signal prost

- Če zazna signal, ki je večji od povprečnega šuma, predpostavi, da je kanal zaseden in oddajanje v teku. Pred podatki mora biti dovolj dolg signal (preamble).

# Protokoli

### Protokol vezja NRF24L01+

- Integrirano vezje proivajalca Nordic, ki se uporablja na vajah

- Značilnosti:
  
  - Bitna hitrost 250 kbps, 1Mbps, 2Mbps
  
  - Modulacija GFSK
  
  - Spremenljiva dolžina podatkov v paketu (0-32 zlogov)
  
  - Lahko deluje v načinu avtomatskega potrjevanja in ponovnega ošiljanja paketov
  
  - Deluje na področju ISM 2.4 GHz
  
  - 126 kanalov

- Nima možnosti broadcasta, nima možnosti sprejemanja vseh paketov.

###### Več prejemnikov

- Naprava lahko komunicira s 6 prejemniki

- Pri takšnem načinu je za vse prejemnike:
  
  - isti frekvenčni kanal
  
  - enaka dolžina naslova prejemnika
  
  - enaka oddajna moč
  
  - enaka bitna hitrost
  
  - enak način izračuna CRC

### IEEE 802.15.4

- Standard opredeljen leta 2003

- Odlike:
  
  - zelo nizka cena
  
  - enostavna imlementacija
  
  - zanesljiv prenos podatkov
  
  - prenos podatkov na kratke razdalje
  
  - majhna poraba energije

- Značilnosti:
  
  - omogoča hitrosti 250kb/s, 50kb/s, 20 kb/s
  
  - Omogoča komunikacijo v obliki zvezde ali točka-točka
  
  - CSMA-CA dostop do kanala
  
  - dinamično naslavljanje
  
  - majhna poraba energije
  
  - podpira veliko število naprav (64K)
  
  - lahko uporablja frekvenčne pasove:
    
    - 16 kanalov na 2,4 GHz
    
    - 10 kanalov na 915 MHz
    
    - 1 kanal na 868 MHz

- ZigBee uporablja IEEE 802.15.4

### Arhitektura

Standard IEEE opredeljuje sapodnja dva sloja:

- Fizični nivo:
  
  - Fizični nivo omogoča komunikacijo na treh ISM področjih

- Moduacije:
  
  - področje 2,4 GHz:
    
    - 250kb/s
    
    - 16 simbolov tvori ortagonalno množico 32-chipnih(bitnih) PN kod:
      
      - Zaporedje 32 bitov, takih zaporedij je 16 -> 4 biti na simbol
    
    - Čipna modulacija je O-QPSK na 2 Mchip/s
  
  - Področje 868/915 MHz PHY
    
    - 20/440kb/s
    
    - Podatkovna podulacija je BPSK z diferencialnim kodiranjem
    
    - Spreading code is a 15-chip m-sequence
    
    - Čipna modulacija je BPSK na 300/600 chip/s

- Odddajna moč
  
  - Minimalno vsaj 0,5 mmW
  
  - Občutljivost sprejemnika (PER < 1%)
    
    - -85dBm na 2,4 GHz
    
    - -92dBm na 868/915 MHz
  
  - Omogoča:
    
    - merjenje razmerja signal šum (RSSI)
    
    - merjjenje moči signala
    
    - indikacijo praznega kanala
    
    - dinamično izbiro kanala

Baje je biu še bluetooth low energy prejšn tedn

# Predavanje 6?

### Bluetooth mesh

- Deluje nad BLE skladom

- Za komunikacijo uporablja samo pakete za obveščanje(advertising packets)

- V napravi je lahko več elementv, kjer se lahko vsak element samostojno naslovi

###### Sklad

- Lower Transport Layer: Zagotavlja zanesljiv prenos paketo Po potrebi pakete pretvori v serijo manjših paketov, ki se na drugi strani združijo

- Network layer: Mrežni nivo, ki določa naslavljanje in moreitno porepošiljanje paketa. Upravlja tudi s šifriranjem povezave.

- Barer layer: Prenosni nivo, ki določa kako se neki

- Models: Skupek osnovnih funkcionalnosti sitema

- Foundation layer: Osnovne funkcionalnosti elemmenta (npr. nastavitve elementa)

- Access layer: Skrbi, da so podatki pravilno posredovani višjim plastem

- Upper transport layer: Definira šifriranje paketov na storitveni plasti. Upravlja elemente z majhno porabo energije. (Friendship)

###### Primer omrežja

Naprave v omrežju lahko imajo različne naloge:

- Posredovanje (Node relay)

- Majha poraba energije (Low energy)

- Prijateljska naprava (Friend node)

- Zastopnik (Proxy node)

###### Nadzovorano polavljanje

Paketi se v omrežju pšiljajo z nadzorovanim poplavljanjem:

- Pakete posredujejo nprej samo naprave, ki imajo funkcionalnost releja

- Ko naprava prejme paket, preveri v tabeli prejetih paketov, ali ej prejet paket predhodno sprejet. Naprej posreduje le eeno kopijo paketa

###### Grupe

V omrežju se postavijo grupe z enakimi značilnostimi, ki delujejo na načinu naročanja in objavljanja

###### Dodajanje naprave v omrežje

- Vsaka naprava se mora pred uporabo dodati v omrežje (Provisioning)

- Problem je, ker je za dodajanje potrebna 2 nivoja kriptografije -> na nivoju grupe

### ANT+

- Protokol ANT+ je protokol, katerega lastnik je podjetje Garmin

- Uporablja se za povezavo senzorjev za upoprabo predvsem na področju športa

- Na trgu je veliko senzorskih elementov na področju športa

- Podpirajo ga nekateri mobilni teefoni

- Omogoča prenos podatkov na kratke razalje pri majhni podabi elektrine energije

- Deluje na področju ISM 2,4GHz

# Prenosni nivo

Osnovne naloge prenosnega nivoja:

- Uokvirjenje

- Odprivanje in popravljanje napak

- Nadzor prenosa paketov

- Upravljanje s prenosnim nivojem

Uokvirjenje: SYNC, določitve zaletka glave, ...

###### Preverjanje pravilnosti

- pri enostavnih protokolih se uporablja kontrolna vsota

- Običjano se uporablja ciklina redundančna koda CRC

- CRC se lahko enostavno implementira v strojni opremi

- Še vedno obstaja mahhna vrjetnost, da bo pri vvečkratnih napakah CRC pravilno izračunan

### ARQ Protokol

- ARQ (Automatic Repeat reQuest) protokol je protokol s potrjevanjem. Če pride do napake, se pošiljanje ponovi.

- Obstajajo trije osnovni tipi ARQ protkoola:
  
  - Alternating B>it: menjava bita pri vsakem paketu
  
  - Goback N: pošiljanje več paketov in potrdi se v zaporedju zadnji pravilno sprejet paket
  
  - Selective Repeat/reject: Sekeltivno potrjevanje. Pošilja se samo manjkajoče pakete.

###### Tehnike popravljanja napak (Ni ARQ več)

FEC (Forward error correcting):

- Bločno kodiranje

- konvolucijsko kodiranje

- hibridno kodiranje

###### Prepletanje

- napake se prikomunikacijah pogosto pojavijo skupaj (burst)

- Težavo se reši s prepletanjem (interleaving), kar pomeni, da se bloki ne pošiljajo zaporedno, ampak po delčkih. Del prvega bloka, del drugega bloka, ...

- Prepletanje ni popravljanje ali detekcija napak, ampak izogibanje napakam.

# Predavanje 7?

##### Turbo kodiranje

- Algoritem *Turbo code* se približa Shannnovi teoretčni meji.

- Kot konvolucija, le da se gleda po 2h grafih in se ta grafa med sabo dopolnjujeta - popravljata

- Uporaba tudi v novejših sistemih, UMTS

- Naslednik je LDPC (low density parity check)

- LDPC se med drugim uporablja. 802.11 n/ac, 10GBase-T Ethernet

- LDPC:
  
  - XOR med vektorjem in matriko
  
  - Zelo učinkovit za velika kodna razmerja

### Hibridni modeli

- Hibridni model združuje ARQ in FEC

- pri ARQ se v primeru ponovitve portebna energija podvoji

- V primeru FEC pa, ...

##### Prilagajanje prenosnemu kanalu

Naprava se lahko prilagaja, glede na število napak oz. na razmerj signal šum:

- zmanjša kodno razmerje pri FEC

- zmanjša bino hitrost paketa

- zmanjša bitno hitrost

- poveča moč oddajanja

### Adaptivni modeli

Pridobivanje informacij o prenosnem kanalu:

- število ponovitev pri ARQ

- število popravljenih bitov pri FEC

- merjenje RSSI in razmerja signal šum

# Poimenovanje in naslavljanje

- kako ločiti naprave in omrežja med seboj

- Poimenovanje je označenavnje stvari s ciljem enoličnega dostopanja do resursov (naprava, podatek, omrežje, ...)

- Naslov določa, kako dostopamo do resursa

- Težave nastanejo pri samodejnem določanju enoločnih imen in tudi naslovov

### Primeri naslovov pri RK:

- UID enolični naslov

- MAX naslov

- Omrežni naslov je naslov ki je bičajno povezan z usmerjanjem

- Oznaka omrežja služi za ločevanje omrežij med seboj

- Oznaka resursa (resourse identifier) je običajno enoločna oznaka (Web naslov)

### Delo z naslovi

- Poimenovanje (Address allocation): dodeljevanje imena iz nabora imen

- Odvzemanje imen (Adress dealocation)

- Detekcija in reševanje konfliktov (coflict detection/resolution)

- Povezovanje naslovov na rezličnih plasteh

- Format naslova

### Enoličnost naslovov

Naslovi so llahko:

- Globalno enolični (UUID, ...)

- Enolični v omrežju (lokalni IP naslovi)

- Lokalno enolični (Bluetooth naslovi v piconetu)

### Določanje naslovov

- Naprava ima lahko fiksno določen naslov - npr. MAC
  
  - Centralizirano določanje naslovov
  
  - Porazdeljeno določanje naslovov

- Napravi se lahko naslov določi dinamično - npr. DHCP

Iskanje podvojenih naslovov (DAD - Duplicate Address Detection)

- Strong DAD

- Weak DAD

### Režija pri naslavljanju

Pri določanju naslovov je težava pri izbiri dolžine naslova:

- Enoličen naslov
  
  - MAC: običajno 48 bitov
  
  - UUID: 128 bitov
  
  - IPv4: 48 bitov
  
  - IPv6: 128 bitov

### Primeri algoritmov

Nekaj primerov algoritmov za dodajanje naslovov:

1. Naključno izbere naslov iz nabora naslovov

2. izogibanje naslovov iz neposredne okolice

3. Začasno izbere poseben naslov za iskanje konfliktov:
   
   - Pošlje naključno izbrani naslov z uporabo posebnega naslova
   
   - Počaka na orgovor omrežja in v primeru podvojenega naslova postopek ponovi

4. Nekej

###### Naključno dodajanje naslovov

Birthday paradox - zelo vrjetno je, da bodo naslovi podvojeni

#### Naslavljanje glede na vsebino

- V primeru naslavljanja glede na vsebino, rezultat vrnejo samo naprave, ki ustrezajo pogoju naslavljanja

- Primmer sestavljenega naslova:
  
  - Temperatura je večja od 10 stopinj
  
  - izbrani prostor so predavalnice
  
  - Relativna vlaga je manjša od 50 %

- V klasičnih omrežnij se naslavljanje glede na vsebino pstavi nad IP naslovom

###### Geografsko naslavljanje

- V primeru geografskega naslavljanja naslov določa:
  
  - Fizična lokacija naprave
  
  - Področje, v katerem se nahaja naprava

- Pri geografskem naslavaljanu se uporablja poseben primer geografskega usmerjanja prometa

# Čas v senzorskih omrežjih

Čas je potreben za:

- SInhronizacijo naprav

- določanje vrstnega dera dogodkov v omrežju

- izračun veličin, ki so osvisek od časa

- podporo protokolom na MAC nivoju (TDMA)

Vrste časov:

- Fizični čas, to je čas, ii je poseldica fizikalnega procesa

- realni čas, to je referenčni čas

- Logični čas, ki ga uporabljamo za določanje zaporedja dogodkov

Primer določitve logičnega časa je Lampert

### Ura v senzorskem elementu

Sestavljena iz:

- oscilatorja

- števca

Težava oscilatorjev je natančnost

- Izvor napake je lahko: sprememba temperature, napetosti, vlage

- Natančnost kvarčnih oscilatorjev je v razredu $10^{-5}$

### Sinhronizacija

- Zunanja sinhronizacija se vrši, ko ima element dostop do referenčnega izvora ure. Ura je točna, ko je napaka manjša od $\sigma$

- Notranja sinhronizacija se vrši med elementi omrežja ki nimajo dostopa do referenčne ure

### Protokol NTP

Network time protocol

- Sinhronizacija časa odjemalca s strežnikom

- Iztačuna se čas med zahtevo in odgovorom. Predpostavimo, da je polovica izraunanega časa, čas ki ga v omrežju potrebuje odgovor je povprečje?

### Protokol LTS

Lightweight Time Synchronization

- omogoča sinhronzacijo v omrežju in tudi za nazaaj

- Izračuna samo razliko med lokalnim časom in časom strežnika in ne popravlja frekvence okalnega oscilatorja

- Dva osnovna gradnika:
  
  - Medsebojna sinhronizacija
  
  - sinhronizacija v omrežju, kjer je nekej.....

# Določanje razdalje

- triangulacija

- merjenje razdalj

Komercialno dostopni sistemi za merjenje časa:

- Delujejo na principu merjenja časa potovanja radijskega signala

- Delujejo po standardu IEEE802.15.4-2011-UWB

- Doseg do 290m

- Natančnost v območju 10cm

- Majhna poraba energije

Bluetooth low energy:

- uporablja svetilnike (iBeacon)

- svetilniki trošijo ezelo malo energije

- svetilniki so poceni

- narančnost v rangu +/- 1,5m

- primerni so za grobo določanje položaja, kot na primer v nakupovalnih centrih, muzejih, ...

### Določanje pozicije v prostoru

- običajno se za določanje pozicije v prostoru uporabljajo radijski svetilniki

- Naprave lahko poleg merjenja razdalj do svetilnikov uporabljajo še senzorje za pospešek, žiroskope in magnetometer

- Na osnovi oddaljenosti od znanih točk (svetilnikov) izračunajo svoj položaj v prostoru

- Potrebno je postaviti infrastrukturo (svetilnike) in natanččno določiti pozicijo le teh.

### Določanje pozicije s pomočjo slike

- Določanje pozicij v prostoru se uporablja za različne namene:
  
  - določanje pozicije satelita na položaj zvezd
  
  - določanje relativne pozicije (optična miška)

- Optična miška:
  
  - majhna poraba energije
  
  - zajema črno belo sliko 20x20 točk
  
  - obdelava slike na čipu

### Določanje pozicije na osnovi jakosti signala

- Pozicijo lahko določimo s pomočjo jakosti sprejetega signala (RSSI)

- Težava je predvsem v velikem nihanju sprejetega signala

### Neznan naslov

### Izzivi

- V velikih omrežjih se pojavije težave:
  
  - Veliko trkov
  
  - velike obremenitve sprejemnika
  
  - veliko možih poti do naslovnika
  
  - velik doseg oddajnika pomeni veliko porabo energije

### Nadzor topologije

\# TODO slikca

- Omrežjee lahko zapišemo kot graf:
  
  $G = (V, E)$
  
  $V - $ množica točk
  
  $(v_1, v_2) \in E \subseteq V^2$

- Pri spremembi je...

##### Enostavno omrežje

- Število aktivnih točk (elementov) se lahko zmanjša:
  
  $V_T \subseteq V$

- Upravljamo lahko število aktivnih povezav med elementi
  
  - Običajno z nadzorom oddajne moči
  
  - Uvajanjem hierarhije

##### Hierarhično omrežje

- Hrbtenica:
  
  $D \subset V - $ Točke hrbtenice  dominantoan množica
  
  $\forall v \in V:v \in D \ \vee \ \exists D \in (v, e)...$

- Gruče:
  
  $C \subset V - $ Točke vodij gruč
  
  $\forall v \in V - C: \exists c \in C:(v, c) \in E$
  
  $\forall c_1, c_2 \in C:(c_1, c_2) \notin E$

- Vodje gruč niso neposredno povezani med seboj

##### Kazalniki

- povezanost - pri spremembi topologije se povezanost elementov ne sme prekiniti

- Faktor povečanja:
  
  - Faktor povešanja števila korakov: $max_{u, v\in V} \frac{|(u, v)_T|}{|(u, v)_G|}$
  
  - Faktor povečanja porabe energije = $max_{u, v\in V} \frac{E_T(u, v)}{E_T(u, v)}$

- Zmanjpevanje števila povezav

- Propustnost: promet med posameznimi elementi se lahko poveča, kar lahko povzroči težave

- Odpornost na premikanje točk

- Dodatna sporočila, ki so posledica algoritmov za nadzor topologije

##### Graf povezanosti

- Omrežje s 5000 elementi na področju 1000 x 1000 m

- Spreminja se izhodna moč in s tem doseg elementa

- Graf prikazuje:
  
  - Verjetnost povezanosti omrežja v odvisnosti od dosega elementa
  
  - Velikost največje gruče v odvisnosti od dosega elementa

##### Nadzor izhodne moči

###### Algoritem RNG

- Algoritem RNG (Relative Neighbourhood Graph) izvede povezavo med dvema elementoma, če med njima ni nobenega drugega elementa

$\forall u, v \in V: (u, v) \in E' \iff \nexists w \in V: d(u, w)^2 \lt d(u, v^2)$

- Ohrani povezanost

- Lokalno izvajanje

- Faktor povečanja dolžine je  $O(\sqrt{|V|})$

- Faktor poveččanja energije je linearen

###### Delaunayeva triangulacija

- Izračuna se Voronoiev diagram
  
  - Čas izračuna je $O(|V|log|V|)$

- Elementa se povežeta, če se Voronijeva podtočja stikajo

- Lahko nastanejo zelo dolge povezave, kar poveča rabo energije

###### Algoritem na osnovi kota

- Osnova algoritma (cone based) je kot iskane naprave

- Prvi korak:
  
  - Začenja z najmanjšo močjo, ...

###### Dominantna množica

- povezana dominantna množica (CDS) - vsi elementi dominantne množice so povezane

- Minimalna povezana dominantna množica (MCDS) - najmanjše število točk v dominantni množici

- MDS in MCDS sta NP-polna problema

##### Usmerjanje pmeta

- Usmerjanje prometa je potrebno, ko želimo paket poslati točno določenemu naslovniku, ki je oddaljen več kot en korak. Naslovnik mora imeti enoličen naslov.

- Težave pri usmerjanju prometa:
  
  - mobilnost elementov
  
  - poraba energije
  
  - velikost usmerjevalnih tabel
  
  - potrebna procesorska moč

##### Poplavljanje

- Najenostavnejši način dostave paketa je poplavljanje.
  
  - paket pošljemo vsem prejemnikom
  
  - ne upošteva se vsebina paketa in naslov,
  
  - Paketi običajno dosežejo svoj cilj
  
  - slaba učinkovitost - zelo veliko poslanih in prejetih paketov
  
  - za preprečevanje zank se uporablja:
    
    - identifikacija paketa
    
    - števec korakov (TTL)

### LoRaWAN

lahko oddajamo samo 1% dneva.

Omrežje sestavljajo 3 osnovni gradniki:

- LoRa senzorji (End Nodes)...



###### Protokolni sklad

Pogovarjajo se na fizičnem nivoju med napravami, transportni do strežnika in aplikacijski do naprave.

### Sigfox

- Je komercialno omrežje, ki ga trži podjetje SigFox. Podjetje ima svoje partnerje  večih državah

- Komunikacija deluje na ISM področju

- Uporablja modulacijo z zelo oszkim spektrom (Utra Narrowband)

- Napenjen napravam z majhno porabo energije in majhnimi zahtevami po prenosu podatkov

- Domet je do 30 km na odprtem prostoru

###### Ultra-narrow band

- Zelo ozka pasovna širina - 100Hz

- Zelo kratki paketi (12 bajtov)

- Zelo nizka hitrost prenosa

###### Pošiljanje

Naprava pošlje paket trikrat na različnih frekvencah in ob različnih časih.

### Načini povezovanja naprav

Naprave se lahko povezujejo

- Na strežnik

- Na drugo napravo

### Načini komunikacije

- Naprave običajno komunicirajo zelo redko in prenašajo zelo malo podatkov

- V običajnih mobilnih omrežjih bi signalizacija presegla količino koristnih informacij

- Težava je, ker še ni uveljavljenih novih protokolov za komunikacijo med napravami in strežnikom

- Še vedno se uporabja protokol IP

### Zahteve

- Zahteve, ki jih mora omrežje zadovoljevati lahko razdelimo na:
  
  - Količina podatkov
  
  - Zahteve QoS
  
  - Časovna občutljivost (zakasnitev pri prenosu podatkov)
  
  - Začetek komunikacije (naprava ali strežnik)

### Pomanjkljivosti obstoječih mobilnih omrežij

- Relativno dog čas prijave v omrežje

- Omrežje zahteva aktivni terminal (keep alive)

- Po prekinitvi (time out) je zahtevana nova prijava v omrežje

- Če je podatkovnega prometa malo, predstavlja signalizacija večji delež prometa po mobilnem omrežju

- Ni optimalno za zelo majhno porabo energije

### Optimizacija omrežij

Zahteve:

- Omogočitev zelo velikega števila naprav na eno celico

- Zniževanje cene

- Možnost začetka zveze (triggering)

- Izogibanje preobremenitvi prometa

- Naslavljanje (neodvisno od tel. št.)

- Skupinsko dodeljevanje pravic določenemu tipu naročnika (npr. električni števec)

### Zmanjševanje potrebe po resursih

- Uporaba resursov zaradi ohranjanja zveze, mobilnosti

- Ohranjanje ali prekinitev zveze (trenutna meja 3 min)

- Signalizacija generira promet, ki ej lahko bistveno večji od podatkovnega prometa

- Zmanjševanje konic v prometu

### Standardi za prenos mobilnih omrežij

- LTE CAT 1 - LTE standard za mobilno telefonijo, ki ni optimiran za IoT

- ...

###### LTE Cat M1

posebnosti:

- Dolga življenjska doba baterije - okoli 10 let

- Nizka cena terminala (v razredu GSM, GPRS terminalov)

- Povečan doseg (> 155.7 dB izgub na poti)

- Spremenljiva hitrost prenosa podatkov med 10kbps in 1Mbps glede na potrebe naprave

Uvajanje:

- Uporablja LTE spekter

- Sobivanje z ostalimi LTE standardi

- Omogoča FDD, TDD in HF način delovanja

- Uporablja se lahko obstojea LTE oprema s programsko nadgradnjo

Posebnosti radijskega dela

- deluje s pasovno itino 1.08MHz

- ahko menja kanale

- Omogoča TTI bundling/repetition

- Nov razred moči za terminale: 20dBm

- Dodatne poenostavitve

###### EC-GSM-IOT

se ne uporablja več, brez razloga so ga uvedli baje

### Poraba energije

Uvajajo se metode manjšanja porabe energije:

- "Deep sleep mode", kjer lahko naprava v načinu mirovanja.

- ...

# Satelitska komunikacija

### Posebnosti

Prednosti satelitske komunikacije:

- Pokritost velikih področij

- Omogoča komunikacijo na težko dostopnih krajih

- Omogoča komunikacijo z letali

Slabosti:

- Mobilne naprave podpirajo samo govorno komunikacijo in majhne hitrosti

- Za večje hitrosti je potrebna večja usmerjena antena

- Komunikacijski sateliti so dragi

- Ni možnosti popravila in vzdrževanja satelitov

### Orbite

- Sateliti se lahko nahajajo na različnih orbitah

- Geostacionarna orbita

- Ne geostacionarna orbita
  
  - Srednja zemeljska orbita
  
  - Nizka zemeljska orbita

### Zakasnitve

- Zakasnitve so odvisne od orbite, ki predstavlja oddaljenost od satelita od zemlje:
  
  - Geostacionarna orbita 260ms
  
  - Nizka zemeljska orbita 10ms

- V primeru, ko poteka komunikacija preko sateiltskega omrežja, se zakasnitev še poveča

- Velika zakasnitev povzroča težave pri protokolih, kot so TCP

### Cubesats

- Cubesats je naziv za majhne satelite velikosti npr 10x10x10cm, kjer masa ne presega 2KG

- Običajno so sateliti te vrste nekoliko večji

- Majhna teža pomeni nizko ceno postavitve v orbito

- Zaradi majhne dimenzije je satelite težko slediti, zato predstavljajo nevarnost za druge satelite

###### Swarms

- Sateliti so v nizki orbiti

- Pokrivajo celotno zemeljsko površino

- Zaradi majhnega števila satelitov je komunikacija periodična

- Podjetje je kupil SpaceX za 85 Miljonov dolarjev.

- Deluje v VHF frek. območju (izjemno nizke frekvence)

- Klasična naročnina obsega do 750 paketov in skupno 150kB na napravo na mesec proti satelitu.

###### Orbicom

Večji sateliti .....

### Iridium

Cena modula okoli 300\$, odklepanje 60\$, mesečna naročnina 12\$. Modul lahko priklopimo v arduino ali Raspberry Pi.

### Totum

### orca systems

KONC PREDAVANJ
