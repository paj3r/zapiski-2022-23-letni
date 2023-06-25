# BSO vprašanja za izpit

### Opišite osnovne lastnosti čakalnih vrst pri FreeRTOS-u.

Čakalne vrste so osnovni mehanizem za komunikacijo med procesi. S čakalnimi vrstami so izvedeni semaforji in mutexi. Delujejo na principu Fifo. Uporabnik lahko določi vrsto elementa in število elementov, ki jih lahko vrsta sprejme.

### Kako bi pri uporabi protokola MQTT preprečili krajo podatkov v omrežju?

Da bi preprečili krajo podatkov v omrežju moramo podatke zakodirati. To lahko naredimo na senzorju ali pa z uporabo TLS. TLS bo časovno bolj zahtevna operacija, kot da uporabljamo globalno geslo za kodiranje, a bo bolj varno. Za kodiranje lahko uporabimo kakršno koli simetrično kodiranje oz. enkripcijo kot na primer AES.

### Od česa je odvisna jakost sprejetega signala?

Jakost sprejetega signala je odvisna od oddaljenosti od oddajnika signala, moči oddanega signala, možnih ovir na poti, frekvence signala, šum na poti, tehničnih zmogljivosti sprejemnika, ...

### Kaj so dobre in kaj slabe lastnosti "Contention based MAC" protokolov?

Dobra lastnost je ta, da je navadno enostavnejši od "schedule based" MAC in s tem zahtevajo manj procesorske moči. Če je malo prometa je ta tudi učinkovitejši, ker ni potrebe po usklajevanju. Če pa je veliko prometa, pa pride do kolizij-trkov, zato je v primeru velike količine prometa boljši "schedule based" MAC.

### Kaj so hibridni načini popravljanja napak in kako vplivajo na porabo energije?

Hibridni načini popravljanja napak uporabljajo kombinacijo popravljanja v naprej in za nazaj. Popravljanje vnaprej omogoča popravljanje napak v sprejemu z redundančnimi biti in kodiranjem, popravljanj za nazaj pa ponovno pošiljanje neprispelih paketov. Potrebno je spremljati prenosni kanal in se prilagajati glede na njegovo stanje. Poraba bo večja kot pri uporabi popravljanja v naprej in popravljanja za nazaj samega, a lahko prihranimo pri ponovnem pošiljanju paketov. hibridni način omogoča veliko večjo zanesljivost pošiljanja paketov.

### Kako deluje LTS (Lightweight Time Synchronisation) protokol?

Strežnik sporoči uro napravi in naprava popravi to uro. Vmes se izračuna razlika v času med lokalnim časom in časom strežnika. Ne popravlja se frekvence oscilatorja.

### Kako deluje NTP (Network Time Protocol)?

Izračuna se čas med zahtevo in odgovorom, predposatvimo, da je polovica izračunanega časa, čas, ki ga v omrežju potrebuje odgovor povprečje med časi. In s tem sinhroniziramo uri med seboj.

### Ali je moč sprejetega signala referenčnih oddajnikov primerna za določitev položaja v prostoru?

V idealnem svetu je lahko primerna, saj z uporabo treh referenčnih oddajnikov lahko določimo natančno lokacijo v prostoru. V realnem svetu, pa lahko prihaja do šumov in ovir na poti, ki lahko privedejo do tega da bo naša izračunana lokacija ne-natančna.

### Kateri so osnovni performančni indeksi pri grupiranju (clustering) v senzorskih omrežjih?

Poraba energije, hitrost prnosa podatkov, zanesljivost prenosa podatkov, natančnost podatkov, usklajenost ure, število kolizij, ...

### Kaj je "data aggregation" v senzorskih ormežjih? Kaj so dobre in slave strani takšnega načina?

Namesto, da senzor direktno pošlje svoje podatke strežniku, se lahko izvede "data aggregation", tako, da se nad podatki, ki so izmerjeni v soseski senzorjev agregira. Npr izmed bližnjih 5 senzorjev se pošlje samo najvišja temperatura. Agregacija v večini primerov zmanjša število poslanih paketov in s tem porabljeno energijo za pošiljanje. Slaba stran je ta, da se pri računanju lahko zgodijo napake, ki se stopnjujejo.

### Kako je izvedeno preklapljanje opravil pri FreeRTOS-u?

Ob vsakem ciklu ure operacijski sistem določi, katero opravilo se bo izvajalo. ura se generira na strojnem nivoju in sproži prekinitev, ki omogoča operacijskemu sistemu menjavo opravil. Na vrsto vedno pride opravilo z višjo prioriteto.

### Kakšne so osnovne zahteve, ki jih mora zadovoljiti element senzorskega omrežja?

Element senzorskega omrežja mora biti energijsko učinkovit, imeti dolgo življenjsko dobo, biti relativno natančen, omogočati posobadblajnje, programabilen, ...

### Kakšne načina sporočil omogoča protokol MQTT?

Omogoča 3 načine sporočil (QoS):

- Večinoma enkrat (0) - ni zagotovila o prispetju paketa, sporočila se samo pošlje brez potrdila

- Vsaj enkrat (1) - Zagotovljeno je prispetje paketa, a so možni duplikati. To se naredi z potrjevanjem sporočil. Paket se lahko pošlje večkrat če ne dobi potrdila

- Natanko enkrat (2) - Zagotoljeno je samo eno prispetje paketa. To se laredi z 4-way handshake, s tem da strežnik in odjemalec oba pošljeta potrditev da sta poslala enkrat in sprejela enkrat.

### Kakšne so najpogostejše motnje pri sprejemu radijskega signala?

Pojemanje - energija se s povečano razdaljo razdeljuje na večje območje

Refleksija - odbijanje od površine, razpršitev v materjal

Difrakcija - začne se "nov val" iz ostrega roba

Raztros - več refleksij na grobih površinah

Doppler fading - zamik frekvenc

Šum - stranski efekt na prejemnikovih komponentat

Kolizije - pošiljanje drugih podatkov po istem spektru/kanalu

### Kakšne težave lahko nastopijo pri protokolu RTS/CTS?

Pride lahko do težave skritega vozlišča. Na primer: A pošlje RTS b-ju, in c pošlje rts B-ju medtem, ko b pošlje rts c-ju. Nato pride do kolizij pri veseh paketih.

Pride lahko do exposed vozlišča. Na primer: a pošlje RTS b-ju, ta pošlje CTS a-ju a se izgubi na poti do C-ja. D nato lahko prosto komunicira z C-jem, a pri tem moti sprejemanje B-ja.

### Kateri so trije osnovni tipi ARQ?

Automatic Repeat reQuest. Osnovni trije tipi so:

- Alternating bit - menjava bita pri vsakem paketu

- Goback N: pošiljanje več paketov in potrdi se v zaporedju zadnji pravilno sprejet paket

- Selective repeat/reject: selektivno potrjevanje. pošilja se samo manjkajoče pakete.

### Kako deluje HRTS (Hierarchy Referencing Time Synchronisation)?

Namenjen sinhronizaciji vseh naprav, ki so dosegljive v enem koraku. Element R vsem pošlje trenutni čas, samo ena naprava odgovori z trenutnim časom in časom sprejema, ter izračuna odmik, ki ga nato pošlje vsem napravam v omrežju. Težava je, da je dejansko omrežje sinhronizirano samo z eno napravo, za druge se predvideva da so.

### Na kakšne načine lahko določimo položaj v prostoru?

Položaj v prostoru lahko določimo z GPS, časovnim zamikom med tremi napravami, moči prejetega signala, z uporabo ultrazvoka ali laserja. BLE uporablja beacon, ki imajo dokaj slabo natančnost.

### Kaj je poplavljanje in na kaj moramo biti pozorni pri implementaciji algoritma?

Popravljanje je pošiljanje paketa med dvema napravama, tako, da pošlje vsem napravam. To uporabimo, ko ne vemo točnega naslova naslovne naprave. Je zelo resursno potratno in zasede omrežje. Potrebuje veliko overheada.

### Kaj je energijsko učinkovito usmerjanje in kaj so kriteriji za postavitev takšnega usmerjanja?

Energijsko učinkovito usmerjanje je tkšno usmerjanje, da je vsota moči za pošiljanje paketa od ene do druge naprave minimalna za vsak par naprav. Šteje se najmanjša možna poraba na preneseni paket ali bit. med kriterije štejemo izbiro protokola (proaktiven, reaktiven), oblika omrežja (zvezda, mesh), cache management, načini za obvladovanje ozkih grl.

### V kakšnih stanjih je lahko opravilo pri FreeRTOS?

- Čakanje (stand-by), se izvaja (running), suspended (onemogočen), blocked (čaka na dogodek)

### Kakšni so osnovni načini zajema podatkov (npr. zaznavanje dogodka) v senzorskih omrežjih?

poznamo 4 tipe zajema podatkov:

- Tip 1: spremljanje osebe ali objekta

- Tip 2: spremljanje lokacije za industrijske potrebe, spremljanje v realnem času

- Tip 3: zajemanje podatkov v objektih in izven objektov

- Tip 4: naprave, ki so priključene na zunanji vir napajanja 

### Kako je oblikovan naslov pri MQTT protokolu in kako naslavljamo skupine?

Naslov j oblikovan hierarhično, posamezni deli so ločeni s /. + pomeni katerikoli del naslova, # pa karkoli npr (/fri/+/temperatura, /fri/p1/#).

### S kakšnimi programskimi postopki lahko povečamo zanesljivost prenosa podatkov?

Zanesljivost lahko povečamo z vpeljanjem redundantnih bitov, ki jih lahko uporabljamo za detekcijo napak ali popravljanje napak. Zanesljivost lahko povečamo tudi z vpeljanjem ponovnega pošiljanja paketov.

### Kakšne so značilnosti "Schedule based MAC" protokolov? Kateri so tipični predstavniki takšnih protokolov?

Značilnosti "schedule based" MAC protokolov so, da imajo naprave na voljo točno določene časovne enote, kjer lahko pošiljajo. Pri teh omrežjih je pomembno, da so naprave med seboj usklajene. Primer protokola je TDMA (Time division multiple Access).

### Kakšne so glavne naloge povezovalne plasti (link layer)?

Glavne naloge povezovalne plasti so: vzpostavitev povezave, nadzor povezave, izbira frekvenčnega kanala, podpora topologijam za prenos podatkov.

### Zakaj je potrebna časovna sinhronizacija v senzorskih omrežjih?

Ker ima vsak senzor svoj oscilator, lahko delujejo različno, in imajo skozi čas zamike. Sinhronizacijo časa potrebujemo, da bojo podatki natančni, da se bodo paketi pošiljali ob pravem času, da bodo meritve pravilno izvedene.

### kaj je trilaterizacija pri določanju položaja v prostoru? Pojasni postopek.

Znane imamo razdalje do treh točk v prostoru. Rešimo sistem enačb, da dobimo naš položaj v prostoru.

### Kakšni so najbolj pogosti tipi hierarhičnih omrežij?

najbolj pogosti tipi hierarhičnih omrežij so:

- Hrbtenica - vsako bozlišče ima za soseda kontrolno vozlišče, kontrolna vozlišča so med seboj povezana, uporabljajo se samo povezave znotraj hrbtenice.

- Gruče - Vozlišča se razdelijo v grupe, kjer je vsako vozlišče v eni gruči. Gruča ima lahko vodjo gruče, prek katerega se pogovarjajo z ostalim omrežjem.

### Kaj je geografsko usmerjanje in kje so lahko težave pšri takšnem usmerjanju?

Geografsko usmerjanje je usmerjanje na osnovi geografske pozicije. Pri tem usmerjnaju pošljemo paket elementu, ki je v smeri elementa, kateremu hočemo pošiljati. Lahko pošljemo tudi na področje, kjer je bi morala naprava biti. Težava nastopi, ko algoritem privede do poti brez izhoda (slepe ulice).

### Na kaj mora biti programer pazljiv pri določanju prioritet opravilom v sistemu FreeRTOS?

Paziti mora, da daje prednosti opravilom, ki ne smejo biti prekinjena, oz. jih "zapakira" v prekinitveno servisni program. Pazi tudi, da vsako opravilo dobi svojo časovno rezino ne-glede na prioriteto. To lahko naredi s tem, da pošlje yield komando iz opravila z višjo prioriteto, da da možnost drugim opravilom.

### Katere so glavne razlike med I2C in SPI vodiloma?

Glavne razlike med I2C in SPI so:

- I2C omogoča half duplex, SPI omogoča full duplex

- I2c ima 2 žici, SPI ima 4 žice

- I2C omogoča več gospodarjev in več sužnjev, SPI omogoča enega gospodarja

- I2C je počasnejši, a zanesljivejši od SPI, saj ima potrditve po vsakem bajtu prejetih informacij.

### Naštej nekaj priomerov aktivnih senzorjev.

Merilnik razdalje (npr. laserski), merilnik vlage, merilnik tlaka, merilnik napetosti, ...

### Kako je senzor neodvisen od odjemalca v primeru uporabe MQTT protokola?

Senzor je pri MQTT neodvisen od odjemalca, ker se senzor vedno pogovarja s posrednikom oz. brokerjem, tako ne vidi komunikacijo, ki jo vršita odjemalec in strežnik oz. posrednik.

### Pri amplitudni modulaciji (ASK) se pojavi težava, če pošiljamo daljše zaporedje ničel. Zakaj se ta težava pojavi in kako se ji izognemo?

Daljše zaporedje ničel lahko povzroči izgubo referenčne amplitude, ker signala praktično ni, ko je logična vrednost enaka 0. To lahko rešimo tako, da določimo logično ničlo na drugi amplitudi, ne na 0 (npr. 0.15V).

### Zakaj dodatni kanal pri komunikaciji bistveno olajša dostop do medija? Primer takšnega protokola je PAMAS.

To jke koristno, za primere kolizij pri uporabi navadnega RTS/CTS protokola. V tem primeru ne pride do tolikšnega števila kolizij in s tem se zmanjša število možnih napak. Omogoča tudi bolj učinkovito reševanje konfliktov.

### Kaj so dobre in kaj slabe lastnosti protokola Bluetooth MESH?

Dobre lastnosti Bluetooth mesh:

- Protokol je znan in široko podprt

- Omogoča dodajanje različnih vrst naprav, od BLE do nabadnega BT

- Omogoča varno povezavo

- Omogoča avtomatsko gradnjo velikega omrežja brez overheada

Slabe lastnosti Bluetooth mesh:

- Ker uporablja 2 nivoja enkripcije, večja poraba energije pri vzpostavitvi povezave

- Povečana latenca v primerjavi z drugimi protokoli

- Deluje na 2.4GHz območju

### Kje se v realnem svetu uporablja določanje pozicije na osnovi moči prejetega signala?

Pri GSM, UMTS, v industriji, za lociranje stroja, pametni sesalniki uporabljajo RSSI, za iskanje poti do polnilne postaje.

### Kaj je glavna značilnost protokola za usmerjanje prometa Šepetanje/govorica (gossiping/rumor routing)?

Glavna značilnost je, da se naredi nekaj naključnih sprehajalcev, ki začnejo pot na ponoru. Izvor nato pošlje svojega sprehajalca in upa, da sreča drugega sprehajalca, ki izvira iz ponora. Značilnost je, da je pot naključna.

### Kaj je pomembna prednost prenosa podatkov preko mobilnih omrežij (NB-IoT) pred protokoli, ki delujejo na ISM področju (Lora, SigFox)?

Prednost pšrenosa podatkov pred protokoli, ki delujejo na ISM območju je, da imajo mobilna omrežja široko in zanesljivo infrastrukturo, kar jih LoRa in Sigfox ne nujno imata. NV-IoT namreč uporablja že obstoječo LTE infrastrukturo.

### Kdaj lahko pride pri FreeRTOS-u do smrtnega objema (deadlock)?

Do tega lahko pride, ko sta opravili odvisni in kažeta drug na drugega, zato se izvajata samo ti dve opravili. oba dajeta procesorski čas drugemu, zato pride do cikla. Temu se izognemo z boljšim pisanjem programov.

### Kako je izvedeno naslavljanje pri I2C vodilu?

Pri I2C je naslavljanje izvedeno z 7-bitnim številom, ki je poslano takoj za start bitom.

### Kaj pomeni pri merilnem elementu čas okrevanja?

Čas okrevanjaa pri merilnem elementu nam pove, koliko časa rabi element, da je po meritvi pripravljen na ponovno meritev.

### Katere informacije potrebuje senzor, da lahko pošlje ponoru sporočilo preko MQTT protokola?

Potrebuje informacije na akterem naslovu je MQTT strežnik, morebitne podatke za dostop (uporabniško ime, geslo), morebiten ključ za kriptiranje in na kateri naslov naj pošlje podatke.

### Kaj pomeni izraz simbol pri prenosu podatkov?

Simbol pomeni najmanjši časovni interval, v katerem se prenaša bit ali če to omogoča modulacija, več bitov.

### Zakaj se pri BLE uporablja naključni naslov?

Pri BLE se naključni naslov upšorablja za skrivanje naprav pred odkrivanjem identitete.

### Zakaj se uporablja prepletanje (interleaving) pri prenosu podatkov?

Prepletanje podatkov se uporablja, ker pri prenosu lahko pride do napak v kosu (burst) in s tem bi izbugili celotno vsebino paketov, s prepletanjem, pa izgubimo le del večih paketov, kjer po navadi lahko informacije pridobimo nazaj, ali pa povprašamo po ponovnem pošiljanju.

### Katere kazalnike uporabljamo pri spremembah topologije?

- Povezanost - Pri spremembi topologije se ne sme prekiniti

- Faktor povečanja: 
  
  - števila korakov
  
  - porabe energije

- Zmanjševanje števila povezav

- Propustnost - promer med posameznimi elementi se lahko poveča

- Odpornmost na premikanje točk

- Dodatna sporočila, ki so posledica algoritmov za nadzor topologije

### Zakaj se omrežij SigFox in LoRa skoraj ne motita, čerav delujeta na istih frekvencah?

SigFox in LoRa se ne motita, ker LoRa uporablja izredno široke pasove, SigFox pa izredno ozke pasove, zato je prekrivanje pasov minimalno.

### Kaj pomeni stanje "blocked" v FreeRTOS-u?

Stanje blocked v FreeRTOS pomeni, da je proces v fazi čakanja. Proces z višjo prioriteto ali PSP se trenutno izvaja.

### Zakaj je hitrost podatkov pri serijski povezavi (RS232) manjša od nazivne hitrosti?

Ker se v nazivni hitrosti šteje prenos vseh bitov, ne le podatkovnih bitov. Pri serijski komunikaciji se pošiljajo tudi start in stop bit in po možnosti tudi pariteta.

### Kaj pomeni histereza pri izvajanju meritve?

Histereza pomeni, da je trenutna meritev odvisna od prejšnjih meritev. Npr, izmerili smo zelo visoko temperaturo in elementi so se permanentno deformirali, zato kaže temperaturo napačno.

### Zakaj se pri MQTT protokolu uporablja življenjska doba sporočila?

Pri MQTT se uporablja žicljenjska doba sporočila, da se zagotovi sveže podatke in omeji napolnjenost omrežja oz. čakalne vrste.

### Kaj pomeni SINR in kako je definirana?

Sinr pomeni Signal to noise Ratio in pomeni razmerje prejete moči z šumom in interferenco.

### Kaj je prednost in kaj pomanjkljivost predaljčastega ALOHA protokola?

Prednost predalčkastega aloha protokola je, da se pri koliziji izgubi celoten paket, ne samo delček paketa, kar bi cel paket zavrglo. Slabost pa je še vedno, da ni sporočanja kdaj lahko kakšen element oddaja in je s tem efektivna izraba kanala majhna (okoli 30%).

### Kaj je naloga GATT protokola pri BLE?

Naloga GATT protokola je, da uvaja hierarhijo med atribute, ki jo sestavljajo profili, servisi in karakteristike, ki hranijo dejanske vrednosti (npr. količina baterije)

### Katera dva parametra uporabljamo pri popravljanju lokalnega časa in kakšna je njuna funkcija?

Uporabljamo parametra $\Theta$ in $\Phi$. $\Theta$ nam popravlja napako v frekvenci lokalnega oscilatorja, $\Phi$ pa popravlja razliko med fizičnim in lokalnim časom.

### Katera dva osnovna principa poznamo pri gradnji usmerjevalnih tabel?

Poznamo proaktivni princip, ali na zahtevo. Proaktivni tip pomeni, da se usmerjevalna tabela pri vsaki posodobitvi sistema osveži, na zahtevo pa pomeni, da se usmerjevalna tabela osveži na zahtevo.

### NB-IoT uporablja mobilno omrežje. Kako so dosegli zelo majhno porabo energije?

Majhno porabe energije so dosegli tako, da so: zmanjšali hitrosti prenosa, ne podpira mobilnosti naprav, optimizirali so protokole.

### Kakšne podatkovne tipe lahko prenašamo preko čakalnih vrst v FreeRTOS-u?

Preko čakalnih vrst lahko pošiljamo praktično podatkovne tipe, če imajo fiksno dolžino. Lahko pošiljamo osnovne podatkovne tipe, kazalce, ali binarne podatke, kot na primer pri semaforjih.

### Kako je izvedeno naslavljanje pri SPI vodilu?

Pri vodilu SPI ni potrebe po naslavljanju, saj gospodar in podrejeni neposredno komunicirata med seboj brez posrednikov na ločeni povezavi.

### Kaj pomeni izraz "lezenje" pri merilnem elementu?

Lezenje je zvezno ali stopenjsko spreminjanje kazanja s časom zaradi sprememb meroslovnih lastnosti merilnega inštrumenta.

### Kako lahko odjemalec (Windows, Linux) komunicira z MQTT strežnikom?

Odjemalec lahko komunicira z MQTT strežnikom z uporabo knjižnice oz. orodja za komunikacija npr. Mosquitto.

### Kako je pri BLE izvedeno iskanje novih naprav?

Iskanje poteka prek 3 kanalov za iskanje sosednjih naprav. Naprave pošiljajo pakete za oznanjanje, ki jih naprava ki išče posluša in na enega odgovori.

### Kaj je kodno razmerje?

Kodno razmerje je razmerje med dolžino nekodiranega podatka in dolžino kodiranega podatka.

### Kako bi v čim manj korakih časovno sinhronizirali množico elementov?

Če imamo vodjo množice elementov, bi lahko ta vodja poslal podatek o trenutnem času vsem elementom množice. Če tega nimamo, bi lahko naključni element poslal podatek o trenutnem času vsem elementom množice, ki bi ga sosednji elementi pošiljali drugim. Porobno deluje LTS.

### Katera je največja pomanjkljivost protokola šepetanje/govorice?

Največja pomanjkljivost je, da pot, ki jo bomo izbrali ni nujno optimalna, saj je naključna.

### Zakaj se pri komunikacijah senzorjev uporablja nizka orbita satelitov? kakšne so prednosti in slabosti nizke orbite?

Uporablja se za hitro komunikacijo na nedostopnih krajih npr. vrh hriba z strežnikom, ki je lahko na drugi strani sveta.Prednosti so, da so zakasnitve relativno majhne, slabosti pa so, da so po navadi dražji in orbita sma zaseda manjši prostor, zato je neposredna komunikacija med elementi možna samo na določenem območju.

### Kakšne so prednosti in slabosti ad-hoc omrežij?

Ad- hoc omrežja niso vezana na infrastrukturo:

Prednosti:

- Ne potrebujemo infrastrukture in posledično ni skupne administracije

- Večja robustnost, ker ni odvisnosti od centralnega sistema

- Admionistracija posameznega elementa ni potrebna

- Omrežje se samo postavi in je takoj pripravljeno za uporabo

- Hitra postavitev omrežja

Slabosti:

- Samoorganizacija naprav je lahko zelo zahtevna

- Omejen domet

- Težave pri mobilnosti

- Težave pri dostopu do medija

- Težave pri usmerjanju / posredovanju podatkov

- Težave pri varnosti sporočil (težavno dodeljevanje in preklic certifikatov / ključev)

### Zakaj ima FreeRTOS posebne funkcije, ki se lahko kličejo iz prekinitvenih rutin?

Te funkcije so posebno prirejene za uporabo v prekinitvenih rutinah, ki lahko prekinejo tudi pisanje ali branje čakalne vrste v opravilih, ki so se izvajala pred prekinitvijo.

### Kaj je razlika med točnostjo in natančnostjo pri merjanju fizikalnih veličin?

Točnost je stopnja verodostojnosti (ali je izmerjena vrednost ista dejanski fizilčni vrednosti), natančnost pa stopnja ponovljivosti (ali se meritve med seboj razlikujejo).

### Kaj je potrebno nastaviti na MQTT srežniku, da lahko nanj priključimo nov odjemalec?

Najprej je potrebno konfigurirati strežnik, da sprejme nove odlejalce. To naredimo tako, da bodisi dovolimo vsem napravem, da se povežejo (allow-anonymous = true), ali pa definiramo uporabniška imena in gesla, s katerimi se lahko naprave povežejo na strežnik. Če se želimo stopnjo varnosti moramo definirati tudi varnostne nastavitve, kot na primer šifriranje prenosa z SSL/TLS.Nato se odjemalec lahko poveže na strežnik.

### Kako se rešuje težava skritih omrežij?

Težava skritih omrežij se rešuje z vpeljavo detektije kolizij - CSMA/CD, ali pa vpeljavo drugih protokolov za dostop do skupnega medija - token ring, TDMA.

### Kakšne so 3 vrste naprav, ki jih omogoča BLE?

Vrste naprav ki jih podpira BLE so:

- Naprave, ki omogočajo BR/EBR funkcionalnosti (Navadne BT naprave)

- Naprave, ki omogočajo LE (LE only devices)

- Naprave, ki omogočajo BR/EBR ali LE (dual mode devices)

### Kako dolžina bloka vpliva na uspešnost prenosa podatkov, če uporabljamo bločno kodiranje (na primer BCH)?

Večja dolžina bloka po navadi pomeni večjo možnost odkrivanja in popravljanja napak. Lahko se poveča učinkovitost prenosa, saj je prenesenih več podatkov naenkrat. Kodiranje in dekodiranje zahteva več časa, zaho je lahko večja bločna velikost neprimerna za naprave, z omejenimi resursi.

### Kaj pomeni izraz časovna sinhronizacija za nazaj?

To pomeni, da se sinhronizacija izvaja po potrebi. Ko pride do dogodka, se zabeleži lokalni čas, element se sinhronizira in preračuna zabeležen čas v realni čas.

### Kje nastopijo težave pri pošiljanju paketa na osnovi naključnega sprehoda?

Težave so pri naključnem sprehodu so:

- Verjetnost, da prispe na cilj je majhna

- Lahko trči na že prehojeno pot in preide v cikel

### Kakšne omejitve imamo pri uporabi Iridium omrežja za prenost majhne količine podatkov?

Težave so, da mora biti oddajnik in sprejemnik teh signalov precej močen, kar lahko porabi dosti energije, prenosne hitrosti so majhne, zato je čas oddajanja dolg. Komunikacija je draga.

### Opiši CoAP protokol

### Opiši algoritem S-MAC

### Opiši protokol IEEE 802.15.4

### Katere vloge imajo lahko naprave v IEEE 802.15.4

### Kakšen je tipičen promet v 802.15.4?

### Opiši Bluetooth mesh

### Katere naloge imajo lahko naprave v Bluetooth Mesh?

### Opiši protokol ANT+

### Katere so osnovne naloge prenosnega nivoja?

Osnovne naloge so:

- Uokvirjenje

- Odpravljanje in popravljanje napak

- Nadzor prenosa paketov

- Upravljanje s prenosnim nivojem

### Zakaj uporabljamo prepletanje?

### Kaj je razlika med zunanjo in notranjo sinhronizacijo?

### Kateri so kazalniki pri topografiji omrežja?

### Katere so težave pri uporabi obstoječih mobilnih omrežij za saenzorske naprave?

### 
