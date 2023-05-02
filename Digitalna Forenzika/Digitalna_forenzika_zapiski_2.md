### Peter pregleduje disk, na katerem je datotečni sistem ext3. kot priden forenzik je najprej izračunal varnostno vsoto dd if=/dev/sdb1 | md5sum, nato je disk priklopil mount -o ro /dev/sdb1. Varnostni vsoti sta si različni! 1. Zakaj 2. Kaj pomeni stikalo -o ro 3. kaj bi moral storiti, da bi disk pregledal, ne da ga pokvari?

###### 1.

Podatki so različni, ker o se metapodatki diska spremenili. Spremenila se je vsaj informacija o zadnji vklopitvi diska.

###### 2.

stikalo -o ro, pomeni, da bo visk vklopljen v načinu read only.

###### 3.

Moral bi disk prekopirati brez da ga vklopi. md5sum -> dd/cat -> preverit md5sum kopije.

### Kaj pri datotečnem sistemu NTFS pomeni angleška kratica VDL? Kako lahko z uporabo VDL skrivamo podatke?

VDL ali Valid data length nam pove, do kje so podatki na disku pravilni, in od kje naprej so nepravilni. To lahko uporabljamo za skrivanje podatkov tako, da spremenimo VDL na manj in v skrite dele skrijemo podatke.

### Izrezovanje (carving) je edn postopkov iskanja podatkov v drugih podatkih (npr. datoteki). Recimo da smo slišali, da so podatki, ki jih ne moremo izrezati, program napisan v lupini *bash* ali slika v formatu .jpg. 1. zapišite hipotezo, ki jo boste preverjali. 2. Kako boste hipotezo preverili?

###### 1.

Hipoteza se glasi: Sklpamo, da so skriti podatki v formatu slike .jpg

###### 2.

Preverili jo bomo tako, da bomo iskali sledove podpisa .jpg datoteke. Če opazimo, te sledove v datoteki, pogledamo ali je na tem mestu jpg datoteka in jo preberemo, drugače pa gledamo naprej. Če pridemo do konca datoteke, lčahko predvidevamo da v datoteki ni skrita .jpg datoteka.

### Peter je v roke dobil Cefizljev računalnik. Sedaj bi rad ugotovil, ali se je Cefizelj priklapljal na butalsko lokalno mrežo. 1. Ali lahko iz usmerjevalne in AR tabele na računalniku ugotovi, če je bil računalnik na bulatski mreži? Če ja zakaj ja, če ne zakaj ne? 2. Kje bi Peter še lahko iskal podatek o tem, ali je bil ta računalnik prisoten na omrežju? 3. Kako bi brez dostopa do strežnikov pretentali Petra, da bi mislil,d aje bil Cefizljev računalnik na omrežju, čeprav je v resnici lo za računalnik nekoga drugega.

###### 1.

Da lahko bi pogledal, če MAC naslov kakšne naprave ustreza napravi v MAC tabeli. To nebi še 100% dokazalo, da se je povezal v to omrežje, razen, če ima v ARP tabeli MAC usmerjevalnika.

###### 2.

Peter bi lahko gledal v ARP tabelo usmerjevalnika, če je imel nastavljen dinamično dodeljevanje IP naslovov, je moral MAC Cefizljevega računalnika podati v svojo ARP tabelo.

###### 3.

Zamenjali bi MAC naslov računalnika na Cefizljev računalnik in se prijavili v omrežje.

### Petru na enem od računalnikov ne deluje mreža - računalnik ne dobi IP naslova. Ostali računalniki delujejo normalno, problematični računlanik pa na drugih mržah deluje normalno. Peter sumi, da je problem v strežniku DHCP. katere datoteke na strežniku naj pregleda. Naštejte vsaj 3 in zakaj?

Pregleda naj:

- /etc/dhcp/dhcpd.conf: datoteka vsebuje glavno konfiguracijo DHCP strežnika, kot so obseg IP naslovov, veljavnost zakupa (leases) IP naslovov in posebne opcije ki se pošiljajo nekaterim strankam.

- /var/lib/dhcpd/dhcpd.leases: datoteka vsebuje vse lease, ki jih je DHCP server naslovil. Te vključujejo IP naslov, MAC naslov in čas zakupa. Peter lahko pregleda, če se server pravilno obnaša

- syslog: To je sistemska datoteka, v kateri se hranijo zapiski o dogodkih v sistemu, vključno z DHCP dogodki. Peter lahko pogleda, če vsebuje kaj errorjev vezanih na DHCP.

### Preiskovalec je našel na osumljenčevem domačem računalniku slike z otroško pornografijo. Kaj lahko predpostavlja?

###### a) nekdo je iz interneta uspel neavtorizirano naožiti slike na računalnik

###### b) od domačih je z USB palčke ali s spleta naložil slike na računalnik

###### c) nekdo od domačih ima slike na svojem telefonu in jih je zložil na računalnik

###### d) nič od naštetega

d). Preiskovalec ne sme nič predpostavljati, lahko samo poda hipšotezo in jo poskuša potrdidi ali zavrči.

### V Butalah imajo tudi policista. Že dolgo je sumil cefizlja kraje recepta butalske soli. Tako se je odločil narediti pri njem preiskavo in je v preiskavi zasegel Cefizljev prenosni računalnik. Ker se mu je zeloudilo, ga je spravil v kovinski kovček in odnesel domov. Zveče, ko so vsi  spali je iz računalnika vzeldisk,ga priklpl v svoj računalnik, n atere poganja Ubuntu, i ga je prepoznal kot 2. SAT disk. Disk e pregledal in našel likoprootipa pve butalske pomornice.po krajšmiskanju je našl še nčrtepomornice terseznam delov, iz katerih ej sestavljena. Takoj je z ukazom *md5sum /dev/sdb1 > checksum.txt* izračunal varnostno vsoto, disk odklopil in postavil na polico v predsobi. Zjutraj je disk pobral in odnesel v službo, kjer ga je spravil v varen sef. Kaj vse je storil narobe?

Če je dobil vsa ustrezna dvoljenja za odvzem računalnika je storil sledeče napake:

- Ni dal računalnik v ustrezno embalažo, ter ni bil skrben pri pakiranju.

- Ni vzpostavil verige dokazov.

- Raziskave ni delal v laboratoriju

- Ni najprej naredil kopije diska in nato analiziral, zato je kontaminiral disk

- Ni ga dobro zaščitil čez noč

- prepozno ga je odnesel v slubo.

### Peter je napisal naslednji program:

```c
void foo() {
long int* f;
f = &f + 1;
printf("\%lx\n", *f);
}
int main() {
foo();
}
```

\1. kaj izpisana vrednost predstavlja? 2. Zakaj se vrednost ob vsakem zagonu spremeni? 3. narišite shemo naslovnega procesa tipičnega progarma, in označite, kje je izpisana vrednost. Shema naj vključuje, kje približno je program, kje podatki, in kje sklad.

###### 1.

Izpisana vrednost predstavlja vrednost naslednjega naslovnega prostora od inicializacije f naprej. To naj bi predstavljalo izhodno vrednost main() funkcije.

###### 2.

Vrednost se ob vsakem zagonu spremeni, ker ta prostor ni rezerviran in lahko vanj računalnik piše, kazalec se vsakič drugje inicializira.

###### 3.

![kernelspace.png](./slike/kernelspace.png)

Izpisana vrednost se zapiše v OS kernel space.
