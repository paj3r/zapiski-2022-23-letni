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

- 
