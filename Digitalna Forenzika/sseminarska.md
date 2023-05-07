najprej moramo diske priklopiti, narediti checksum, narediti kopijo, preveriti checksum, nato mount

To bomo naredili za vsak izmed diskov.

disk AAAA

Najprej pogledamo kje je ta naprava:

```shell
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0  120G  0 disk 
├─sda1   8:1    0  119G  0 part /
├─sda2   8:2    0    1K  0 part 
└─sda5   8:5    0  975M  0 part [SWAP]
sdb      8:16   0   20G  0 disk 
├─sdb1   8:17   0  100M  0 part 
└─sdb2   8:18   0 19.9G  0 part 
sr0     11:0    1 50.6M  0 rom  
```

Nato naredimo zaporedje ukazov:

```shell
sha512sum /dev/sdb >> AAAAhash.txt
cat /dev/sdb > AAAAcopy.img
sha512sum AAAAcopy.img >> AAAAhash.txt
cat AAAAhash.txt
```

Datoteka vsebuje naslednje besedilo:`1193fed2aada9e60fc6566b8addc678f3bf3073f5599d6594b8b7bce2580a07751b588f310a1b0f15d4723037f8cb5d68c52de3ea9f4e28f0306f47bd5044da9  /dev/sdb 1193fed2aada9e60fc6566b8addc678f3bf3073f5599d6594b8b7bce2580a07751b588f310a1b0f15d4723037f8cb5d68c52de3ea9f4e28f0306f47bd5044da9  AAAAcopy.img`

Hash vrednosti se ujemata, zato predvidevamo, da je kopiranje uspelo.

Nato naredimo nov imenik mnt/aaaa, kjer bodo lokacija za vklopitev diska in vklopimo disk z uporabo komand: 

```shell
mkdir /mnt/aaaa
mount AAAAcopy.img /mnt/aaaa
```

Ugotovimo, da disk ni pravilni dat. sistem, ker nam shell izpiše:

```shell
mount: /mnt/aaaa: wrong fs type, bad option, bad superblock on
/dev/loop0, missing codepage or helper program, or other error.
```

Pogledamo v MBR od diska. To naredimo z orodjem `randare2`. Izpis iz MBR je sledeč:

```shell
- offset -   0 1  2 3  4 5  6 7  8 9  A B  C D  E F  0123456789ABCDEF
0x00000000  33c0 8ed0 bc00 7c8e c08e d8be 007c bf00  3.....|......|..
0x00000010  06b9 0002 fcf3 a450 681c 06cb fbb9 0400  .......Ph.......
0x00000020  bdbe 0780 7e00 007c 0b0f 850e 0183 c510  ....~..|........
0x00000030  e2f1 cd18 8856 0055 c646 1105 c646 1000  .....V.U.F...F..
0x00000040  b441 bbaa 55cd 135d 720f 81fb 55aa 7509  .A..U..]r...U.u.
0x00000050  f7c1 0100 7403 fe46 1066 6080 7e10 0074  ....t..F.f`.~..t
0x00000060  2666 6800 0000 0066 ff76 0868 0000 6800  &fh....f.v.h..h.
0x00000070  7c68 0100 6810 00b4 428a 5600 8bf4 cd13  |h..h...B.V.....
0x00000080  9f83 c410 9eeb 14b8 0102 bb00 7c8a 5600  ............|.V.
0x00000090  8a76 018a 4e02 8a6e 03cd 1366 6173 1cfe  .v..N..n...fas..
0x000000a0  4e11 750c 807e 0080 0f84 8a00 b280 eb84  N.u..~..........
0x000000b0  5532 e48a 5600 cd13 5deb 9e81 3efe 7d55  U2..V...]...>.}U
0x000000c0  aa75 6eff 7600 e88d 0075 17fa b0d1 e664  .un.v....u.....d
0x000000d0  e883 00b0 dfe6 60e8 7c00 b0ff e664 e875  ......`.|....d.u
0x000000e0  00fb b800 bbcd 1a66 23c0 753b 6681 fb54  .......f#.u;f..T
0x000000f0  4350 4175 3281 f902 0172 2c66 6807 bb00  CPAu2....r,fh...
0x00000100  0066 6800 0200 0066 6808 0000 0066 5366  .fh....fh....fSf
0x00000110  5366 5566 6800 0000 0066 6800 7c00 0066  SfUfh....fh.|..f
0x00000120  6168 0000 07cd 1a5a 32f6 ea00 7c00 00cd  ah.....Z2...|...
0x00000130  18a0 b707 eb08 a0b6 07eb 03a0 b507 32e4  ..............2.
0x00000140  0500 078b f0ac 3c00 7409 bb07 00b4 0ecd  ......<.t.......
0x00000150  10eb f2f4 ebfd 2bc9 e464 eb00 2402 e0f8  ......+..d..$...
0x00000160  2402 c349 6e76 616c 6964 2070 6172 7469  $..Invalid parti
0x00000170  7469 6f6e 2074 6162 6c65 0045 7272 6f72  tion table.Error
0x00000180  206c 6f61 6469 6e67 206f 7065 7261 7469   loading operati
0x00000190  6e67 2073 7973 7465 6d00 4d69 7373 696e  ng system.Missin
0x000001a0  6720 6f70 6572 6174 696e 6720 7379 7374  g operating syst
0x000001b0  656d 0000 0063 7b9a e072 6eca 0000 8020  em...c{..rn.... 
0x000001c0  2100 07df 130c 0008 0000 0020 0300 00df  !.......... ....
0x000001d0  140c 07fe ffff 0028 0300 00d0 7c02 0000  .......(....|...
0x000001e0  0000 0000 0000 0000 0000 0000 0000 0000  ................
0x000001f0  0000 0000 0000 0000 0000 0000 0000 55aa  ..............U.
```

 Po temu so na disku zapisane same ničle.

Ugotovimo, da je z diskom nekaj narobe in da nima operacijskega sistema.

Nato z ukazom `file`, pšogledamo, kaj sistem Linux lahko pove o tej datoteki. Dobimo naslednje:
`AAAAcopy.img: DOS/MBR boot sector MS-MBR Windows 7 english at offset 0x163 "Invalid partition table" at offset 0x17b "Error loading operating system" at offset 0x19a "Missing operating system", disk signature 0xca6e72e0; partition 1 : ID=0x7, active, start-CHS (0x0,32,33), end-CHS (0xc,223,19), startsector 2048, 204800 sectors; partition 2 : ID=0x7, start-CHS (0xc,223,20), end-CHS (0x3ff,254,63), startsector 206848, 41734144 sectors`


Ugotovimo, da bil na disku prej naložen Windows 7 operacijski sistem, ki je zdaj manjkajoč.
