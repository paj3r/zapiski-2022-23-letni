# Vaje 1

CHS adressing -> C - Cylinder(0-1023), H - head(0-254), S - sector(1-63) 8 GB max size

headov je max 14 v najnovejših trdih diskih, zaradi tega implementiran čip, da prevede nekaj bitov iz head v sector.

Sector adressing(0 - n) adresira se samo sektorje.

SATA - sektorsko adresiranje, le da se komunikacija ne izvaja paralelno ampak serialno.

First sector - Master Boot Record - Boot loader (446B) - program ,ki zagoni OS, Parttion table(64B), last 2 Bytes - magic number, checksum - total 512B 

### Particije

particijske sheme:

- GPT -> 128B

- APPLE - Partition table

- BSD - Disk label

Particijska shema definira, kje se začenjajo particije, možno je imeti 4 particije.

### RAID

Redundant Array of Independent discs.

0 -> full capacity, full speed

1 -> duplicate the data, doubles read performance, half capacity

10 -> at least 4 drives, 2 drives each in raid 0, doubles in raid 1

5 -> at least 3 drives, sektoji na dveh diskih se zapišejo v checksum na tretjem -> 95% možnosti ne izgube podatkov

6 -> podobno kot 5, le da ima 2 checksuma -> 99%

# Vaje 4

#### settings linux vs windows

- windows  up ti 3.1: .ini files for each program

- Windows since: Registry - central repository for ini files.
  
  - Something that you interact with using OS programmes - edit the registry using regedit.exe
  
  - Pros: Consistent
  
  - Cons: If it breaks there is a huge problem, Gets slower if large
  
  - Stored in hives - settings are bees, we can have multiple hives per registry, at
    C:\WIN\System32\Config\
    C:\Users\Luka\NTUSER.DAT - user specific registry
  
  - Access via linux via **libhivex**

- Good to check registry keys fo when the document was last opened.

- kaitai.io -> check how the registry is structured

Windows XP passwords stored at NTLM HASH -> use OPHCRACK:

- The passwords are only hashes, not salted up to Vista.

- Passwords are salted from Windows 7 upwards.

- Stored in C:\WIN\System32\Config\Security
