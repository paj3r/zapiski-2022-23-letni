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


