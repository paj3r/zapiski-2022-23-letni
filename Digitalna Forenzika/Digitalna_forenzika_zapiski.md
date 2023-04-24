# Osnove digitalne forenzike

**Digitalni dokaz** je katerikoli digitalni podatek, ki ej shranjen ali prenešen in omogoča dokaj ali zanikanje.

**Računalniški sistemi** : 

- odprti računalniški sistemi - računalnik,

- komunikacijski sistemi - router,

- vgrajeni sistemi - projektor.

Za izvajanje forenzične preiskave ni dovolj znanje, ampak se zahteva certificiranost osebja, organizacije, laboratorija, ...

**Izmmenjava dokaza** :

- Prstni odtisi, e-pošta in zabeležke, zabeležke o obiskovanih straneh, komunikacijske sledi, ...
- Izmenjava dokaznega gradiva med žrtvijo in storilcem (ali prizoriščem) - Locardov princip izmenjave

### Dokazi

Dokazi imajo skupne lastnosti (vsi programi te vrste) in posebne lastnosti (konkretne nastavitve)

Da je digitalni dokaz sprejemljiv na sodišču:

- mora biti pravilno obdelan (zajet)

- mora biti hranjen na forenzično pravilen način

Zato je potrebno beležiti vse akcije na prizorišču

Zagotavljanje avtentičnosti:

- vsebina mora biti nespremenjena

- vsebina mora izvirati s prizorišča (beleženje vrstnega reda posedovanja dokaza - dokazna veriga)

- dodatne informacije o rokovanju z dokazi

#### Celovitost dokaza

sprejeta oblika zagotavljanja cleovitosti dokaza je pospisovanje z razpršilno funkcijo MD-5, SHA

#### Ravnanje z dokazi

**Objektivnost dokaza**- vsebuje interpretacijo in predstavitev dokaza

**Ponovljivost analize dokaza**

### Izzivi rokovanja z digitalnimi dokazi

Ostanki ali rekonstrukcija ni isto kot celotno gradivo:

- rekonstruirana datoteka ki ej bila izbrisana ni isto kot delčni le-te

- ostanki poslane e-pošte ni isto kot celotna e-pošta

Povezava med (digitalnim) dokazom in storilcem ni vedno očitna

Podatki niso večni:

- podatki o prometu na omrežju

Dokazi niso nujno brez napak:

- administrator je že poskušal rešiti pobrisano datoteko

- sistemski administrator je sremenil vsebino, da bi zavaroval sistem

- prišlo je do napake pri zajemu podatkov (nestandnardni postopek)

- pri zajemu podatkov je bil uporabljen okužen medij

- medij se je poškodoval, ...

## Razvoj jezika raziskave računalniških zločinov

Na začetku ni bilo računalnikov in zakon je ščitil samo materialne dokaze

Digitalni dokazi vsebujejo:

- Računalniška forenzika

- omrežna forensika

- mobilna forenzika

- slabogramje (malware) forenzika

Pomembna razlika med preiskovanjem in analizo podatkov:

- preiskovanje vključuje zaje, ogranizacijo, ...

- analiza predstavlja dejansko obravnavo dokazov

### Vloga računalnika

1. predmet (objekt) zločina -> kraja računalnika ali uničenje

2. osebek (subjekt) zločina -> zločin je bil narejen nad računalnikom

3. orodje za pripravo in/ali izvedbo zločina(instrument) -> kopiranje dokumentov

4. uporaba po svojih lastnostih v sločinu (symbol) -> ponujanje storitev ali zmožnosti storitev : dobitki na borzi, ...

5. Vir podatkov -> ostanki datotek, e-pošte, ...

### Vloga računalnika -> US Department of Justice

- strojna oprema kot predmet ali rezultat zločina

- strojna oprema kot inštrument

- strojan oprema kot dokaz

- informacija kot predmet ali rezultat zločina

- informacija kot instrument

- informacija kot dokaz

### Naloge izvedenca

- predstavitev dokaznega gradiva:
  
  - ne podleči vplivom
  
  - odklanjati prezgodaj postavljene teorije
  
  - raba znanstvene resnice za potrebe pravnega procesa

- ACM code of ethics

- IEEE code of ethics

### Sprejemljivost gradiva

Pet osnovnih pravil:

1. relevantnost gradiva za primer

2. avtentičnost grradiva (zajem, sledljivost)

3. niso govorice (heresay)

4. najboljši možen dokaz

5. dokazno gradivo brez potrebe ne napeljuje na zaključke

Nalog za preiskavo

### Stopnje zanesljivosti

(1) skoraj zagotovo, (2) zelo vrjetno, (3) vrjetno, (4) zelo možno, (5) možno

### Računalniška zakonodaja

Zakonodaja ZDA:

- 50 zakonodaj

- zakonodaja Washington DC

- zvezna zakonodaja

Zakonodaja ES (EU)

- Irska (in Velika Britanija) ločen sistem - common law

- preostale države - civil law

Skupna zakonodaja:

- parlament EU

- Konvencija o računalniških zločinih (Convention on Cybercrime), 1. julik 2004
  
  - nista ratificirali Irska in VB

- Protokol o dejanjih rasizma in ksenofobije, 1. marec 2006

- GDPR, 2019

### Zločini nad intergriteto račuinalnika

Dostop do računalnika ni dovoljen, če nam tega ne dovoli lastnik

Primeri:

- Hekerji

- Kraja podatkov

- Prestrezanje podatkov

- Vplivanje na podatke in/ali sistem (DOS / virusi)

- "napačna" ali nenamenska uporaba enote/naprave

### Zločini s pomočjo računalnika

- Ponarejanje

- Goljufija

- Zloraba

### Zločini povezani z vsebino podatkov

Zločini, ki zadevajo vsebino podatkov:

- otroška pornografija

- spletno zapeljevanje

- rasizem in ksenofobija

### Ostali zločini

- Kršenje avtorskih pravic

- Računalniško izsiljevanje, ...

# Računalnik in OS MS Windows

### Zagon računalnika

Koraki b zagonu računalnika:

- Ob zagonu se sproži BIOS (Basic Input Output System)
  
  - Open Firmware (Mac PowerPc), EFI (Mac Intel), Open Boot PROM (Sun), ...

- Ta naredi POST (Power-On Self Test) - Battery protected, CMOS baterija

- Podatki o delovanju so shranjeni v xROM

- Včasih geslo ščiti podatke - dobiti geslo od uporabnika

### Format datoteke

Datoteke imajo na začetku posebne podpise

- jpg: FF D8 FF E0 ali FF D8 FF E3

- gif: 47 49 46 38 37 61 ali 47 49 46 38 39 61

- doc: D0 CF 11 E0 A1 B1 1A E1

Datoteka je lahko gnezdena v drugi datoteki - preučimo vsebino kopirane datoteke

- poiščemo datoteko

- jo lahko označimo in prepišemo (copy-paste)

- ali uporabimo orodje **dd** 

Temu postopku rečemo obrezovanje / klesanje (carving)

Druga orodja:

- scalpel, DataLifter

- EnCase, FTK (Forensic ToolKit), X-Ways

Disk:

- V mapi na disku:
  
  - Seznam vnosov
  
  - Vsakemu vnosu pripada metainformacija:
    
    - ime
    
    - datum
    
    - ...

- Podatki so shranjeni drugje

### Izrezovanje

Na koncu dobimo samo vsebino in ne meta-podatkov iz imenika

Drugi problem je, da so lahko podatki razmetani po disku:

- rešitev: Adroit

### Shramba podatkov in skrivanje

V/I enote so priključene na računalnik preko:

- vodila (IDE, ATA, SATA, SCSI, firewire)

- vmesnika (controller)

Vmesniki so lahko tudi pametni:

- SMART (Self-Monitoring, Analisys and Reporting Technology)

- hrani statistike dostopov in ostale podobne podatke

- običajno niso pomembni za forenzično raziskavo

Kako je organiziran disk?

- Plošče, sledi (cilindri), sektorji, gruče

Na prvi sledi, prvem sektorju so nadzorni podatki (MBR - master boot record)

- Velikost (geometrija), slabi bloki, particije,...

Pri SSD:

- Informacije na poziciji 0

- zelo dobro definiran format

- opis preostalega dela diska

Poenostavljena organiziranost diska  z datotečnim sistemom FAT:

- disk je bločni niz, razdeljen v particije
  
  - Lahko skrijemo podatke v bločni niz, ki ni uporabljen v nobeni particiji

- particija ima strukturo
  
  - lahko podatke skrijemo v particijo, ki je ne uporablja bločni niz

Particija, volume, snopič/del

- V njej datotečni sistem

- lahko tudi brez datotečnega sistema

##### Načini skrivanja podatkov

Skrivanje podatkov zaradi notranje in zunanje fragmentacije:

- Skrivanje znotraj sektorja (bloka) - težko in neobičajno

- Skrivanje znotraj gruče

- skrivanje znotraj particije (particije se običajno začnejo na začetku sledi)

- skrivanje particije

Kriptiranje particije

Servisni podatki: DCO (Drive/device configuration overlay) in HPA (Host7hidden protected area)

##### Shramba podatkov

Ko je datoteka izbrisana, podatki ne izginejo

Tudi, ko formatiramo disk, podatki ne izginejo - lahko pogledamo z orodjem **fdisk**

Rezultat obeh operacij jepravilen datotečni sistem in polica praznih blokov

Orodja: **sleuthkit**, Norton DiskEdit

Lahko rekonstruramo datoteke na sveže formatiranem disku z uporabo EnCase

##### Skrivanje

Skrivanje particij

- Orodje Test Disk

Na ravni datotek:

- Skrivanje datotek: npr. MS Windows: *attrib +H in dir/AH*

- parlament.jpg -> test.exe

- sliko v predstavitev (ppt)

### Gesla in kriptiranje

Orodja za razbijanje in iskanje gesel:

- Password recovery tool - PRTK in Distributed Network Attack - DNA

- John the Ripper

- Cain in Abel

- Advanced Archive password Recovery

### OS Windows

2 osnovna datotečna sistema: FAT (File Allocation Table) in NTFS (New Technology File System)

##### FAT:

- Razvit najprej za gibke diske (diskete)

- FAT12, FAT16, FAT32

- FATxx je povezan seznam indeksov gruč, v katerih je shranjena posamezna datoteka

- xx pomeni število bitov uporablenih za indeks

- O datotekah hrani čas tvorjenja in zadnje spremembe, a le datum zadnjega dostopa

##### NTFS

- Sodobnejši datotečni sistem:
  
  - Vse je v datotekah
  
  - podatke o datotekah hrani v sistemski datoteki \$MFT
  
  - imenik je samo datoteka (B drevesna struktura)
  
  - je dnevniški datotečni sistem (journal) in hrani transakcije nad datoteko v sistemski datoteki \$logfile

- Podpira več funkcionalnosti glede datotek
  
  - pravica dostopa (ACL - Access Control List)

- bolje varovan, saj hrani kopije podatkov o datotečnem sistemu na večih mestih (\$MFTMirr)

###### NTFS - \$MFT

Zapis v \$MFT:

- Zapis sestoji iz prilastkov (attributes)

- zapis je velik 1kB

- če je datoteka majhna, se hrani kar v zapisu

- pri brisanju samo zastavica in potem se zapis ponovno uporabi

###### NTFS - iskanje podatkov

Pri datoteki obstaja pojem fizične velikosti (gruče), logične velikosti (zapis v imeniku - dejanska velikost) in pojem konca datoteke (EOF)

V imeniku lahko obstajajo datoteke z enakimi imeni

###### NTFS - sledi datotek

- Različne operacije različno vplivajo na zabeležene čase v imeniku (tvorjenje - TV, zadnji dostop - ZD, zadnja sprememba - ZS, zapis spremenjen - VS):
  
  - premik datoteke v snopiču: ne vpliva nič
  
  - premik datoteke v drugi snopič: TV, ZD, VS
  
  - kopiranje datoteke (cilja datoteka): TV, ZD, VS
  
  - odreži in prilepi: ZD
  
  - primi in potegni: ZD
  
  - izbriši: ZD, VS

- posebnosti:
  
  - datoteka na palčki, lahko preko scp/...: TV > ZS
  
  - pri brisanju imenika, se podatki o datotekah ne spreminjajo

- Vsebina pisarniških datotek vsebuje metapodatke iz imenika
  
  - Shrani kot: če na isto datoteko, gre dejansko za prepis in ne za tvorjenje nove datoteke v imenik, ne pa v datoteki

- Tiskanje naprej prepiše datoteko v poseben imenik ter jo še nato natisne
  
  - C:\Windows\Spool\Printers, C:\WinNT\System32\Spool\Printers
  
  - tudi, ko tiskamo spletno vsebino

### Kodiranje časa pri datotekah

FAT: 1.1.1980 + LLLLLLLM MMMDDDDD hhhhhmmm mmmsssss - 4 bajte velikosti

FILETIME: 

- 64 bitni zapis - 8 bajtni

- vrednost = 1.1.1600 + število * 100ns

### Reševanje podatkov

za reševanje izbrisanih datotek obstajajo različna orodja, ki jih lahko poganjamo na MS Windows:

- orodje SleuthKit v kombinaciji z Autopsy Browser omoggoča celo pregledovanje preko brskalnika

Iskanje izgubljenih datotek iz velike neoblikovane gmote rešujemo enako kot pri obrezovanju datotek:

- Orodje DataLifter: iščemo izgubljeno datoteko iz dveh gmot praznega prostora in enega preostalega datotečnega sistema

Če majhna datoteka prepiše veliko, lahko večino velike datoteke rekonstruiramo:

- EnCase: primer nakupovalnega vozička v CD Universe, ki se je znašel v preostanku datotečnega prostora

### Zabeležke (log files)

- Operacijski sistem (odvisno od nastavitev) beleži marsikaj:
  
  - dostopi do virov
  
  - pojavljanje in brisanje vnosov
  
  - napake itd.

- Shranjene na %systemroot%\system32\config (c:\winnt\ ...)
  
  - različne zabeležke v različnih datotekah: Appevent.evt, Secevent.evt, Sysevent.evt

### Register

- V OS Windows so spremenljivke okolja procesa definirane v registru

- dejansko so podatki shranjeni v datotekah (hives) v sistemskem imeniku %systemroot%\system32\config
  
  - ntuser.dat za vsakega uporabnika svoja datoteka

- datoteke lahko pregledujemo z Windows orodjem regedit32 (EnCase, FTK)

### Omrežne sledi

- nekaj tudi iz sistemskega okolja
  
  - ob vzpostavitvi povezave, ...

- Večina izvira neposredno iz aplikacij
  
  - brskalniki, pošni agenti, ...

###### Brskalniki

- Zgodovina:
  
  - firefox-3 je hranil zgodovino v sqlite podatkovni bazi
  
  - internet explorer hrani zgodovino v index.dat
  
  - orodja so na voljo za iskanje po teh bazah: Oddesa

- lokalni predpomnilnik

- piškoti

###### E-pošta

- sledi so odvisne od poštnega agenta, ki ga uporabljamo
  
  - poslana in prejeta pošta
  
  - povzeti IMAP nabiralnikov

- vsebina, ki je zanimiva:
  
  - samo besedilo pošte
  
  - priponke - MIME format

###### Drugi programi

- Različni programi puščajo različne sledi

- Omrežno programiranje:
  
  - Dostop do drugih sistemov
  
  - dostop drugih sistemov do našega sistema

- Sistemski registri puščajo sledi v registru

# Datotečni sistemi na operacijskih sistemih Unix

### Operacijski sistem unix

Razvoj skozi zgodovino: System V, HP-UX, BSD, ...

kasneje so se pojavile odprtokodne različice:

- Linux: RedHat, SUSE, Ubuntu

- BSD: FreeBSD, OpenBSD, NetBSD

### Standardna datotečna hierarhija

Filesystem Hierarchy Standard - FHS

delo prevzela Linux Foundation

večinoma formalizacija BSD datotečnega sistema

### Korenski imenik

- /boot: statične datoteke za boot loader

- /dev: datoteke naprav

- /etc: sistemska konfiguracija specifična za gostitelja
  
  - /etc/opt: konfiguracija za /opt
  
  - /etc/X11: konfiguracija za X windows sistem
  
  - /etc/sgml: konfiguracija za SGML
  
  - /etc/xml: konfiguracija za XML

- /bin: bistvene uporabniške ukazne datoteke - za uporabo v shell

- /sbin: sistemske datoteke

- /lib: bistvene skupne knjižice in jedrni moduli

- /lib\<qual\>:: alternativni format bistvenih skupnih knjižnic

- /home: uporabnikov domači imenik

- /root: Home imenik root uporabnika

- /media: namestitvena točna (mounting point) za  odstranljive naprave

- **/mnt**: namestitvena točka za začasno nameščen datotečni sistem

- /opt: dodatni paketi za aplikacije

- /srv: podatki o storitvenih aplikacijah (services)

- /tmp: začasne datoteke

- /usr, /var: ločene hierarhije

##### /usr imenik

- bsebuje datoteke, ki so namenjene samo branju

- jih uporabljajo hkrati različni sistemi

- v njem naj ne bi bilo datotek, ki so sprecifične za določen sistem

- izjema: /usr/local, ki je lokalni imenik določenega sistema

##### /var imenik

- vsebuje datoteke, ki se spreminjajo skozi čas:
  
  - poštne in tiskalniške vrste
  
  - beležke (logs)
  
  - podatkovja (podatkovne baze, ...)
  
  - začasne datoteke

### Sistemske datoteke

Operacijski sistem je zasnovan tako, da sos sistemske datoteke človeku prijazne -> navadne besedilne datoteke:

- konfiguracijske datoteke: hosts, syslog.conf
  
  - običajno v imenku etc (/etc, /usr/local/etc, /opt/etc, ...)

- beležke: mail, cups, ...
  
  - običajno v imeniku log (/var/log, /usr/local/var/log, /op/var/log)

### Beležke

V beležkah so pionavadi zapisi po RFC formatu:

- when where who: what

### Datotečni sistemi

- imamo imenike in indeksna vozlišča (inode)

- inode ima podobno funkcijo kot FAT in MFT hkrati

- imenik je samo posebna oblika datoteke
  
  - Imamo še posebne datoteke: povezave (links), cevovode (pipe), vtič (socket)

- Najstarejši: Unix File System - UFS

- mlajša in uporabljena v sistemih linux: ext2 in ext3
  
  - obstaja tudi ext in ext4

- obstaja še vrsta drugih datotečnih sistemov
  
  - reiserFS, XFS, gfs, afs, ext4, HSM

### Čas v operacijskem sistemu Unix

- čas se meri v sekundah

- hrani se kot število, ki ima začetek 1. 1. 1970 (Unix time)
  
  - Če je čas je shranjen kot 32- bitno število bo prišlo do preliva 19.12.2038 - Y2K38 problem

- UTC - Coordinated Universal Time: usklajena definicija časa, ki upošteva prestopna leta, prestopne sekunde, ...
  
  - zadnja prestopna sekunda se je zgodila 31. 6. 2016
  
  - usklajen čas med večimi atomskimi urami
  
  - eden od naslednikov GMT

### Datotečni sistem UFS

- Definiran in uveden v BSD4.2

- Uporabljen v *BDS sistemih

- Kasneje uporabljen v Solaris OS

- Število inodov je enako številu možnih datotek

- Inodi so kreirani ob kreaciji datotečnega sistema

###### Imeniška datoteka

- posebna datoteka, ki sestoji iz delov imenika

- System V je imelo predoločeno velikost imenika

- korenski imenik je opisan v inode 2

- vsak imenik ima poseben vnos, ki pove kje je starš

###### Nadblok

- Nadblok (superblock) hrani opis konfiguracije skupine cilindrov

- raztreseno po disku - na začetku vsake skupine cilindrov
  
  - da se ohrani konfiguracija, če se en zapis izgubi

- orodje **dumpfs**

### Datotečni sistem ext2

- Osnovna struktura podobna kot pri UFS

- Namesto skupin cilindrov, govorimo o skupinah blokov

- imeniki in indeksna vozlišča - kot pri UFS

- orodje za pregledovanje disk: Linux Disk Editor

###### imeniška datoteka

- posebna datoteka, ki sestoji iz delov imenika

- System V je imel predoločeno velikost imenika

- korenski imenik je opisan v inode2

- vsak imenik ima poseben vnos, ki povej, kje je starš

###### Nadblok (superblock)

- hrani opis konfiguracije skupine blokov

- raztreseno po disku -  na začetku vsake skupine blokov
  
  - da se ohrani konfiguracija, če se en zapis zgubi

- orodje **dumpfs**

### Datotečni sistem ext3

- Avtor Stephen Tweedie 1999 / 2000 / 2001

- Osnovna struktura enaka kot pri datotečnem sistemu ext2:
  
  - razdelitev na skupine blokov vključno z nadblokom (superblock)
  
  - imeniki in indeksna vozlišča
  
  - vodenje evidence o disku

- dodana je možnost hranjenja dnevniške strukture

- osnovni datotečni sistem OS Linux

###### Dnevniki (logs)

- V dnevnikih se hranijo zapisi o vseh spremembah v datotečnem sistemu

- Dnevniška struktura omogoča tri vrste vodenja dnevnika:
  
  - celovit dnevnik (journal): hrani se vse; tako metapodatke kot vsebino - najbolj varno
  
  - zaporedno (ordered): hranijo se samo metapodatki vendar se shranijo po uspešno opravljeni operaciji - srednje varno
  
  - zapiši (writeback): podobno kot zaporedni, le da se shranjujejo dnevniški zapisi hkrati z dejanskimi zapisi

- dnevnik je zaporedna datoteka

- zapisi so shranjeni pred prvo skupino blokov

- dnevniška skupina je sestavljena podobno kot bločna skupina
  
  - dnevniški nadblok
  
  - opisi transakcij

- opis transakcij vsebuje tri vrste blokov:
  
  - opisni blok (descriptor block): začetek transakcije
  
  - metapodatkovni bloki : opisi transakcije
  
  - zaključni blok (commit block): zaključek transakcije
  
  - preklicni blok (revoke block): če pride do napake in vsebuje seznam blokov v datotečnem sistemu, jih je potrebno ponovno namestiti (restavrirati)

- vsi (tudi nadblok) se prično z magično številko:
  
  - JFS_DESCRIPTOR_BLOCK 1
  
  - JFS_COMMIT_BLOCK 2
  
  - JFS_SUPERBLOCK_V1 3
  
  - JFS_SUPERBLOCK_V2 4
  
  - JFS_REVOKE_BLOCK 5

### Forenzični viri

- za analizo slike diska uporabljamo samostoječe operacijske sisteme

- uporabljamo SleuthKit z Autopsy Forensic Browser

# Osnove računalniških omrežij za potrebe forenzike

Iz zgodovine: ARPANET -> DoD- Department of Defense

TCP/IP: 1973/74

FDDI: lan network preko optike - Fiber

### Koncept omrežnih slojev

- vsak sloj je neodvisen od ostalih

- nudi storitve drugim slojem in uporablja storitve drugih slojev

### Referenčni modeli

Sloji referenčnega modela OSI: fizični, povezavni, mrežni, transportni, sejni, predstavitveni, aplikacijski

##### Referenčni model - TCP/IP

- je osnova interneta in *de facto* standard

- nima prezentacijskega in sejnega sloja

- fizični in linijski sloj je združen v t.i. "host to network layer"

- povezavna plast razdeljena na MAC in LLC (IEEE 802)

- Protokoli na slojih:
  
  - Aplikacijski sloj - TELNET, FTP, SMNP, SMTP, HTTP
  
  - Transportni sloj - TCP, UDP, ICMP
  
  - Mrežni sloj - IP
  
  - Fizični in povezavni sloj - ARPANET, paketni radio, LAN

- Vsebniki enkapsulirajo en protokol v drugega

###### Fizični in povezavni sloj:

- fizični: prenos signalov

- povezavni:
  
  - najpogostejši IEEE 802.11
  
  - združuje različne tehnologije  - IEEE 802.3, 11, 15, 16, ...
  
  - razdeljen na MAC in LLC
    
    - MAC - *media access control*: različen med tehnologijami
    
    - LLC - *Link Layer control*: enak za vse tehnologije

###### Mrežni sloj

- IP (internet protocol - medmrežni protokol) skrbi za transparentno pošiljanje podatkov med mrežami

- dostava ni zagotovljena niti vrstni red dostave

- osnova je skupni naslovni prostor (IPv4, IPv6)

- povezava s povezavnim slojem je protokol ARP (orodje arp)

###### Prenosni sloj

- prenosni ali transportni sloj

- TCP in UDP osnovna protokola: povezavni in brezpovezavni način delovanja

- TCP predstavlja tok podatkov med procesoma na različnih računalnikih

###### Aplikacijski sloj

- standardne aplikacije: pošta, splet, novičke, IRC, ...

- nestandardne aplikacije: definira uporabnik

### Nekaj osnovnih orodij

- Windows:
  
  - arp - za gledanje arp tabele (lahko za specifičen IP ali za vse)
  
  - netstat - Prikaže aktivne TCP povezave, statistike etherneta, IP usmerjevalna tabela, IPv4 statistike (skupaj z IP, ICMP, TCP in UDP protokoli), isto za IPv6

- - sockstat - pokaže odprte vtiče
  
  - netstat tudi obstaja na linux
  
  - ifconfig - prikaže trenutno konfiguracijo omrežnega vtičnika
  
  - tcpdump / pcap - prikaže TCP/IUP pakete, ki se pošiljajo po omrežju., pcap je wireshark

### Nekaj smernic

1. Podatki so volatilni

2. Komunikacija:
   
   - Glave
   
   - komunikacija se zgodi
   
   - lažno predstavljanje
   
   - s kom se pogovarjamo

### Profesionalna in druga orodja

- Niksun forenzična orodja

- Protokoli za upravljanje z omrežji: snmp, rmon

###### Protokol SNMP

- snmp v2 in v3

- nepovezavni način prenosa podatkov: UDP

- dve vrsti ukazov:
  
  - prenos podatkov na zahtevo
  
  - prenos ob dogodku

- podatki o stanju omrežja se hranijo v MDB in dnevniških zapisih

###### Vse je v številkah

- FQN(Fully Qualified Name) = www.fri.uni-lj.si => DNS => 212.235.188.25 = IP => se preslika v MAC prek ARP tabele

- storitev DNS preslikuje med črkovnim nizom in številko
  
  - namesto DNS storitve lahko uporabimo preslikovalno tabelo v datoteki /etc/hosts

- strežnik DNS storitve sprašuje druge strežnike DNS, če česa ne ve
  
  - datoteka /etc/namedb/named.root

- orodji *dig* in *nslookup*

- DNs storitev uporablja vrata 53

- nimamo storitve, ki bi preslikovala med imenom DNS in 53
  
  - imamo preslikovalno tabelo v datoteki /etc/services

- sistem poveže aplikacijo s procesom (programom) ob zagonu

###### In od kje pridejo številke

- svetovni dogovor o številkah

- številke hrani IANA - The Internes Assigned Numbers Authority
  
  - korenski DNS strežniki
  
  - vrata
  
  - protokoli

### Storitev WHOIS

- potrebujemo strežnik storitve whois

- pove, kdo je lastnik domene

- Ve tudi informacije o lastniku domene, ter naslov, email, državo ipd.

# Mobilne naprave

### Celični (mobilni) telefoni

- različne tehnologije prenosa podatkov

- včasih predvsem telefoni, danes predvsem računalniki

- bogat vir osebnih podatkov:
  
  - Kot telefon - komunikator:
    
    - zgodovina klicev (prihodnih, odhodnih, zgrešenih)
    
    - zgodovina sporočil SMS in MMS (prihodnih in odhodnih)
  
  - Kot računalnik:
    
    - zgodovina podatkov o mestu nahajanja
    
    - slike, dnevniki, koledarji, ...
    
    - dostopi do spletnih omrežij - skratka takorekoč vsi podatki, ki se nahajo tudi na običajnih račinalnikih

#### Podatki na celičnem telefonu

- Primer (POCKET-DIAL M FOR MURDER):
  
  - *Storilec je imel v žepu telefon, ki je poklical ženin med tem, ko je moril žrtev. Na ženini strani se je sprožila zapisovalna naprava (tajnica), ki je vse skupaj posnela.*

- telefoni postajajo sodobnejši, ker vsebujejo več V/I naprav
  
  - merilci temperature
  
  - pospeškometri
  
  - bralniki kreditnih kartic
  
  - ...
  
  - uporaba V/I enot je neizmerna; npr. pri določeni temperaturi se sproži akcija

- Telefoni so postali celoviti vgrajeni sistemi

- viri informacij so porazdeljeni povsod

### Forenzika mobilnih naprav

- naprave imaojo sposobnejše operacijske sisteme:
  
  - Android
  
  - iPhone
  
  - Blackberry
  
  - Windows Mobile

- in starejše operacijske sisteme (SYMBIAN, ...)

- naprave so po definiciji omrežne naprave
  
  - GPRS, CDMA, UMTS, ...
  
  - IEEE 802.11
  
  - IEEE 802.15 (Bluetooth)
  
  - infrardeča komunikacija
  
  - ...

- dostop do naprave lahko uniči ali spremeni dokazno gradivo

- Podatki so običajno hranjeni v pomnilniških medijih
  
  - ki jih ni moč brisati, ampak prepisati
  
  - zaradi omejenega števila zapisovanj zapisovalni algoritmi razpršijo podatke po mediju
  
  - zato lahko pridobimo precej podatkov, za katere izgleda, kot da so izbrisani

- Zajem podatkov iz naprav:
  
  - običajno preko podatkovnega kabla
    
    - potrebno poznavanje protokola
  
  - včasih je potreben neposreden zajem iz pomnilniškega medija
    
    - neposredno branje iz čipa

- Naprave sestoje iz dveh delov:
  
  - naprave kot takšne
  
  - SIM kartice

- naprava ima enoličen identifikator IMEI(International Mobile Equipment Identity)

- Sim kartice so računalniki:
  
  - CPU, ROM, RAM

- Vsebujejo ICC-ID(Integrated circuit Card Identifier)
  
  - MCC (Mobile country code)
  
  - MNC (Mobile network code)
  
  - serijsko številko kartice

### Podatki o in na napravi

- Na napravi - odvisno od tipa naprave:
  
  - osnovni telefon
  
  - pametni telefon

- kje se še nahajajo podatki
  
  - uporabnikov računalnik
  
  - operater
  
  - SIM kartica

- na napravi so lahko shranjeni vsaj
  
  - naslovi
  
  - prejeti, oddani in zgrešeni klici
  
  - prejeti in oddani SMS

### SMS kot dokazno gradivo

- Celovita informacija: kdaj poslano / prejeto od koga in vsebina

- ni podatka, kdaj je prvič prebrano

- vpogled možen z orodjem BitPim

### Slikovno gradivo

- Pametni telefoni imajo kamero

- slikovno gradivo v EXIF zapisu (običajno)
  
  - Podatki o napravi, resoluciji, času posnetka, napravi, **geolokaciji**

### Dostop do medmrežnih storitev

- mobilne naprave omogočajo dostop do spleta
  
  - pogosto uporabnik na njih hrani gesla
  
  - obstaja zgodovina dostopov
  
  - zebeležke zadnjih dostopov
  
  - ...

- mobilne naprave omogočajo branje pošte
  
  - gesla za dostop do nabiralnikov
  
  - zadnje prejete / poslane pošiljke
  
  - ...

- druge aplikacije in njihovi podatki

- Na iPhonu so podatki shranjeni v SQLite bazi.

### Geografski podatki

- hrani se zgodovina prehodov med baznimi postajami

- GPS naprave lahko hranijo natančne koordinate

- Slike lahko hranijo podatke o tem kdaj in kje so bile posnete - EXIF format

##### Drugi podatki

- koledar, zapiski, ...

### Napadi na mobilne naprave

- napadalec naloži svojo kodo na napravo
  
  - preko omrežja
  
  - uporabnik naloži aplikacijo, ki sicer izgleda uporabna in prijazna

- aplikacija pobira gesla, ...
  
  - omogoči dostop napadalcu do bančnih računov
  
  - glej MobileSpy

### Misli širše

- dodatni podatki:
  
  - uporabnikov računalnik
  
  - operater: klicni center in bazne postaje

- naprave, o katerih uporabnik nekaj ve (tranzitivnost)

### Rokovanje z napravo

- naprava se lahko brezžično poveže s svetom

- napravo je treba onemogočiti:
  
  - umakniti napajanje
  
  - drugi načini

![](C:\Users\Pajer\Documents\GitHub\zapiski-2022-23-letni\Digitalna%20Forenzika\slike\mobile_shutdown.jpg)

- Umakniti pomnilniške module
  
  - pomnilniški moduli so vedno manjši

- običajno FAT datotečni sistem
  
  - iPhone: APFS, Android: Linux zasnova

- sicer običajni postopki (podpis, dnevnik, ...)

### Pridobivanje podatkov

- različni načini dostopa pri različnih modelih
  
  - nima vsaka naprava USB vodila

- primeri:
  
  - preko uporabniškega vmesnika
  
  - preko komunikacijskih vrat
  
  - notranjega vodila (Nokia F-BUS, Flash BUS)
  
  - preko JTAG (Joint Test Action Group) vmesnika
  
  - preko neposrednega dostopa do čipa

- Nekatere naprave omogočajo agentni dostop
  
  - ko se naprava zažene, se naloži naš agent, ki prevzame nadzor nad napravo (iPhone)

- včasih lahko prekinemo nalaganje programja in vsilimo našo kodo kot nadaljnje nalaganje

- proizvajalci nudijo programje za arhiviranje podatkov, ki omogoča tudi dostop do izbrisanih in ostalih podatkov

- Naprava, ki je delno uničena, morda še vedno dovolj deluje

### Orodja za mobilne naprave

- katerokoli orodje omogoča predvsem dostop do pomnilnika naprave

- pri disku je dostop relativno varen, kar sam po sebi ne more spreminjati vsebine

- pri mobilni napravi to ni nujno res

- posebej pri tujih aplikacijah

- XRY, Cellebrite UFED, Logicube CellDEK, 

- Programska oprema za analizo: iXAMMOBILedit!, Forensic, Twister Flasher

### Preiskava - datotečni sistem

- odvisno od naprave
  
  - posebni
  
  - vgrajeni v sisteme Qualcomm (BREW - Binary Runtime Environment for Wireless)
  
  - FAT, ext2, ext3, HSFX, APFS, ...

- Na voljo različna orodja: BitPim, Forensic Toolkit - iPhone

#### Neceloviti podatki

- četudi nimamo vseh podatkov, lahko iz logičnih podatkov rekonstruiramo delno izbrisane podatke

- če je običajen datotečni sistem (FAT, ext2, ext3, APFS, ...) že znana orodja
  
  - EnCase

- V primeru sestavljenih datotek (MMS, docx, ...) lahko najdemo dele podatkov

- skladiščni medij je SSD

- podatki, ki so v shrambi a niso strukturirani
  
  - delno zbrisani podatki
  
  - podatki v zbrisanih blokih, ki so razpršeni po enoti

###### Oblika datoteke SMIL

- Synchronised Multimedia Integration Language
  
  - del w3c standarda
  
  - različice 1, 2 in 3

- vključuje SVG predmete

- omogoča:
  
  - animacijo, vključevanje drugih slik, modularizacijo,...

### Preiskava - ostali podatki

- vleiko pametnih telefonov hrani svoje podatke v podatkovni bazi
  
  - SQLite - Android, iPhone, Palm, ...
  
  - cemail.vol - Windows Mobile

### Preiskava - format podatkov

- večinoma standardni formati

- SMS sporočila:
  
  - 7-bitni standatd; GSM 03.38: 160 znakov
  
  - 16-bitni UCS-2 (Universal Character Set, UTF-16): 70 znakov

- Debeli in tanki konec - odvisno od procesorja
  
  - Motorola - debeli konec

- debeli in tanki košček (nibble)
  
  - številka 12036452774 se shrani kot 2130462577F4 (F je polnilo)

### Preiskava - SIM kartica

- SIM (Subscriber Identity Module)

- naprava je last uporabnika, SIM kartica je last operaterja
  
  - ki dovoli uporabniku shranjevanje določenih podatkov nanjo

- podrobna definicija v: ETSI(European Telecommunications Standards Institute) : GSM, Global mobile Communications, GSM 11.11, 1995

##### SIM kartica

- preprosta notranja struktura

- sestoji iz datotek, od katerih ima vsaka svojo dvo-bajtno identifikacijsko kodo

- prvi bajt označuje tip datoteke:
  
  - 3F - glavna datoteka (Master File), MF
  
  - 7F - namenska datoteka (Dedicated File), DF 
  
  - 2F - delna datoteka MF
  
  - 6F - delna datoteka DF

- nekatere datoteke so definirane v standardu
  
  - 3F00:7F10 (DFTELECOM, dedicated file: zapisi o uporabi storitev (npr. poslana SMS sporočila, klicane številke)
  
  - 3F00:2FE2 (EFICCID, elementary file): hrani ICC-ID (integrated Circuid Card ID)
  
  - 3F00:7F20:6F07 EFIMSI: hrani IMSI (International Mobile Subscriber Identity)
  
  - 7F20:6F7E (EFLOCI): kako se je kartica premikala med operaterji
  
  - 7F20:6F53 (EFLOCIGPRS): GPRS usmerjevalno področje

- Orodja za pregledovanje SIM kartic:
  
  - TULP2G: Nethernalds Forensic Institute
  
  - orodje ni posodabljano, a za branje SIM kartic je vredu

###### SIM kartica in varnost

- Kartica je zaščitena s PIN (personal Identification number) kodo

- če se prevečkrat zmotimo (ni možno pregledovanje), se kartica zaklene

- za odklepanje potrebujemo PUK (PIN unlock key) kodo
  
  - pogosto jo ima operater

# Izvajanje digitalne preiskave

- (digitalna) preiskava se izvaja po točno določenih korakih

- koraki so definirani v priročnikih, navodilih

### Koraki v digitalni preiskavi

1. *priprava*: priprava načrta preiskave

2. *pregled/identifikacija*: kaj je potrebno zajeti in kako

3. *shranjevanje*: forenzična korektnost zajetega gradiva

4. *raziskava (examination)*: in *analiza*: zajeto gradivo se ustrezno pripravi za analizo, ki temelji na ustreznih znanstvenih metodah

5. *predstavitev gradiva*: izsledke preiskave se ustrezno namenu predstavi (sodišče, v podjetju, vojska, ...)

Poznamo več vrst zaporedij kriminalnih preiskav: Casey 2004, DFRWS 2001, NIJ 2001, NIJ 2004, Cohen 2009

### Procesni modeli preiskave - fizični model

- Klasičen pristop (Carrier, 2003)
  
  1. Zavarovanje kraja zločina - Zavarujemo vhode in izhode in preprečimo fizične spremembe na dokazih
  
  2. Raziskava kraja zločina - Ob sprehodu skozi kraj identificiramo očitne in  krhke fizične dokaze
  
  3. Dokumentacija kraja zločina - Fotografije, skeči, zemlejvidi dokazov in kraja zločina
  
  4. Pregled kraja zločina in zbiranje - poglobljeno iskanje fizičnih dokazov
  
  5. Rekonstrukcija kraja zločina -  Razvijemo teorije glede na analizi dokazov in testiranja dokazov

- Digitalni pristop (Carrier, 2003):
  
  1. Zavarovanje kraja zločina -Preprečimo spreminjanje morebitnih digitalnih dokazov, vključno z izoliranjem omrežja, zbiranjem volatilnih dokazov in kopiranjem digitalnega okolja
  
  2. Raziskava kraja zločina - Identifikacija očitnih dokazov z raziskovanjem digitalnih dokazov (ponavadi v laboratoriju)
  
  3. Dokumentacija kraja zločina - Fotografije digitalnih naprav in posamezni opisi digitalnih naprav
  
  4. Pregled kraja zločina in zbiranje - Analiza sistema za neočitne digitalne naprave
  
  5. Rekonstrukcija kraja zločina - Razvijemo teorije glede na analizi dokazov in testiranja dokazov

### Procesni modeli preiskave - stopničasti model

- Casey in Palmer 2004

- odvetniki in preiskovalci delujejo skupaj

- ni enosmeren tok, ampak se lahko vračamo na prejšnje faze

![](C:\Users\Pajer\Documents\GitHub\zapiski-2022-23-letni\Digitalna%20Forenzika\slike\Stopnicast.jpg)

### Procesni modeli preisakve - model toka podatkov

- O Cairdhuain, 2004

- celovit proces od zavarovanja do sodišča

- celotna veriga dogodkov

![](C:\Users\Pajer\Documents\GitHub\zapiski-2022-23-letni\Digitalna%20Forenzika\slike\Tok_podatkov.jpg)

### Procesni modeli preiskave - (pod)fazni model

- Beebe in Clark, 2005

- proces je razdeljen na faze, od katerih ima vsaka točno določene cilje / namen

- osnovne faze so (prim. nazaj):
  
  1. priprava
  
  2. odziv na prijavo
  
  3. zbiranje gradiva
  
  4. analiza gradiva (podatkov)
  
  5. predstavitev izsledkov
  
  6. zaključek primera

- primer: cilji analize datotečnega sistema
  
  1. zmanjšanje količine podatkov za analizo
  
  2. ocena znanja osumljenca
  
  3. pridobitev izbrisanih datotek
  
  4. iskanje relevantnih skritih podatkov
  
  5. ugotovitev zaporedja dejavnosti z datoteko
  
  6. pridobitev relevantnih ASCII podatkov
  
  7. pridobitev relevantnih ne-ASCII podatkov
  
  8. ocena spletne (e-pošta, brskanje) dejavnosti
  
  9. pridobitev relevantne e-pošte s priponkami
  
  10. pridobitev relevantnih drugih podatkov (koledar, adresar, zaznamki, ...)
  
  11. iskanje natisnjenih podatkov
  
  12. identifikacija relevantnega programja
  
  13. iskanje dokazil o neavtoriziranih dostopih (malware)
  
  14. rekonstrukcija omrežnih dogodkov

### Procesni modeli preiskave - model vlog in odgovornosti

- leong, 2006

- FORZA - vsak udečeženec ima določeno vlogo v procesu

![](C:\Users\Pajer\Documents\GitHub\zapiski-2022-23-letni\Digitalna%20Forenzika\slike\FORZA.jpg)

### Zbiranje podatkov

- začetna točka je obtožba ali bovestilo o dogodku

- sledi avtorizacija za izvedbo preiskave
  
  - avtorizacija na podlagi napotila
  
  - (sodni) nalog za preiskavo

- triaža primera - odločitev ali so dokazi zadovoljivi

- prenašanje in delo z dokaznim gradivom - dnevniški zapisi

- preverjanje zaseženega gradiva

- vodenje primera - vključuje ostale udeležence

### Metodologija dela v digitalni preiskavi

- delo mora sloneti na znanstvenih metodah
  
  - oblikovanje in preverjanje hipotez

- koraki:
  
  - priprava na digitalno preiskavo
  
  - pregled mesta zločina
  
  - shranjevanje podatkov
  
  - raziskovanje podatkov
  
  - analiza
  
  - poročanje in pričanje

## Znanstveni pristop

1. opazovanje (*brskalnik se je sesul in takoj za tem se je pognal antivirusni program*)

2. oblikovanje hipotez

3. predpostavka, kje so dokazi za potrditev hipotez

4. preverjanje hipotez

5. zaključek

Primer: zaposleni je obtožen kraje podatkov ob tem, ko je zapustil službo

#### Priprava na digitalno preiskavo

1. *opazovanje*: število sistemov, kakšni so sistemi, ...

2. *oblikovanje hipotez*: sistemi uporabljajo ATA in SATA diskovna vodila

3. *preverjanje hipotez*: pregledovanje računalnikov

4. *zaključek*: načrt kako natančno zajeti podatke vključno s potrebno opremo in postopki
- Šele po po zaključku lahko pričnemo z zbiranjem samega gradiva - *ad hoc* postopki niso zaželjeni

#### Pregled mesta zločina

1. *opazovanje*: pregled mesta zločina

2. *oblikovanje hipotez*: nenavadnosti - zakaj nekaj manjka ali je nekaj prisotno; omejevanmje količine gradiva

3. *predpostavka, kje so dokazi za potrditev hipotez*: hipoteza o pomembnosti podatka in nato predpostavka, kje se nahajajo dokazi

4. *preverjanje hipotez*: preverjanje hipoteze o relevantnosti podatka in njegovem mestu nahanja

5. *zaključek*: zbiranje dokaznega gradiva se izvede

#### Shranjevanje podatkov

- odvisno od oblike podatkov
  
  - primer: e-pošta je shranjena na strežniku vključno s 30 dnevnim arhivom

- spet po znanstvenem pristopu

#### Raziskovanje podatkov

- običanje faze:
  
  - pregled in triaža podatkov
  
  - predhodno raziskovanje
  
  - temeljito raziskovanje

- faze se seveda lahko ponovijo na istih podatkih

- vključuje: pripravo na raziskavo, ogled, forenzično raziskavo, pridobivanje podatkov, izločanje zanimivih podatkov, temeljita raziskava

- Primer:
  
  1. *opazovanje*: trdi disk vsebuje obilico dokumentov, ki so zanimivi za raziskavo
  
  2. *oblikovanje hipotez*: dokumenti so v .doc obliki
  
  3. *predpostavka, kje so dokazi za potrditev hipotez*: če pridobimo vse .doc datoteke, bomo pridobili vse gradivo
  
  4. *preverjanje hipotez*: pridobimo sicer vse .doc datoteke, a najdemo še .pdf in .tiff
  
  5. *zaključek*: ko pridobivamo vse dokumente smo naredili zadovoljivo in celovito raziskavo

#### Analiza

- dejansko znanstveno utemeljen odgovor na vprašanja $(k^5z^1)$

: kdo, kaj, kje, kdaj, kako, zakaj

- upoštevamo, da imajo podatki vsebinsko in kontekstualno vrednost
1. *opazovanje*: osumljenec je bil zabeležen na kameri pri dvigu gotovine na avtomatu v bližini mesta zločina neposredno po zločinu. Zločinec je kmalu po zločinu dvignil denar z žrtvinega računa.

2. *oblikovanje hipotez:*

3. *predpostavka za potrditev hipotez:*

4. *preverjanje hipotez:*

5. *zaključek:*

### Poročanje in pričanje

- sodišče običajno ni izkušeno o strokovni materiji

- poročanje mora biti natančno in verodostojno ter transparentno
  
  - pri opisu postopkov
  
  - pri posredovanju zaključkov

## Delo na mestu digitalnega zločina

- digitani so dokazi, zločin je lahko povsem fizičen

- obstajajo priročniki, ki opisujejo postopke za delo na mestu zločina (ali za prikrito opazovanje)

#### Osnovni princip

1. z nobenim dejanjem se naj ne spreminjajo ali neposredno dostopa do podatkov na napravi

2. če že dostopamo, potem moramo biti sposobni razumeti in predvideti posledice le-tega

3. obstajati mora zapis o vseh dejavnostih, ki jih mora biti tretja stran sposobna preveriti

4. vodja preiskave je odgovoren, da se zakon in ta pravila spoštujejo
- primer: vključevanje naprave, ...

#### Avtorizacija za preiskavo

- raziskavo delamo po navodilu ali naročanju
  
  - sodišče, tožilstvo, vodja oddelka, ...

- navodilo ali naročilo mora natančno opredeljevati, kaj raziskujemo in katere podatke smemo zbrati

- primer:
  
  - preverite, ali je oseba A poslala e-pošto osebi B
  
  - to navodilo dovoljuje samo zbiranje podatkov o poslani pošti in ne zbiranje vsebine te pošte
  
  - podobno pri klicih (telefonskih, VoIP, ...)

- sodišče (naredvodejalec) mora / naj bi skrbel za to, da se pri zbiranju podatkov ščiti zasebnost

- osumljenec ni kriv, dokler ni pravnomočno obsojen
  
  - in še tedaj se mora spoštovati njegova zasebnost

#### Priprava na delo na mestu digitalnega zločina

- pripravimo načrt dela na mestu zločina

- priprava je izredno pomembna, saj le ustrezna priprava lahko **zaščiti dokazno gradivo**

- **ACPO priporočila**
  
  - upoštevanje tehničnega znanja osumljenca
  
  - vključevanje ustreznih orodij in metod
  
  - upoštevanje ranljivosti podatkov: brezžične in omrežne naprave, delujoče naprave (računalniki), ...

#### Ogled mesta digitalnega zločina

- digitalni dokazi se lahko najdejo an različnih mestih - pomembna sistematičnost ogleda

- V/I enote, priročniki za strojno in programsko opremo, ...

- izklop naprav

- zapis o izklopu naprave

- natančen popis naprav in njihova vloga

- gesla za dostop in enkripcijo

- zapisovanje posegov v skladu z načrtom

#### Zavarovanje mesta digitalnega zločina

- nadzor dostopov na mesto zločina:
  
  - videokamere ipd: ugasniti sistem, da se ohranijo podatki
  
  - (brezžična) omrežna: ugasniti oziroma odklopiti, da ne pride do nehotenega ali drugega dostopa

- zamrznitev mesta zločina
  
  - dokaze prepišemo z ustreznimi napravami ter jih podpišemo in shranimo
  
  - zavarovanje oddaljenih podatkov
  
  - zavarovanje nedigitalnih dokazov (prstni ali drugi biološki dokazi)

- priprava **načrta** za zavarovanje podatkov

- oddaljeno zavarovanje

Kaj pa pri delujočih napravah?

- običajno težko ohranimo vsebino glavnega pomnilnika (RAM)

- vendar:
  
  - trenutno izvajajoči procesi povedo kaj  o vdoru v sistem
  
  - zakriptirani datotečni sistem je priklopljen in gelo vnešeno
  
  - odklenjeni dostopi do oddaljenih mest oz. storitev
  
  - ...

- na delujočih napravah uporabimo običajna forenzična orodja (FTK)

- drugo načelo ACPO!!

Zaustavitev sistema:

- odklop elektrike - kje?

- odstranitev ohišja in ogled notranjosti
  
  - manjkajoči deli, ...

- odklop napajanja na diskih

- pri vseh posegih se zavedajmo sestaljenosti položaja:
  
  - odklop računalnika lahko sproži eksploziv

- **VEDNO OCENIMO TEHNIČNE SPOSOBNOSTI STORILCA**

![](C:\Users\Pajer\Documents\GitHub\zapiski-2022-23-letni\Digitalna%20Forenzika\slike\turn_off_machine.jpg)
