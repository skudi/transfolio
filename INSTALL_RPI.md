# Compilation on RaspberyPi (Debian/Raspbian 9.13) #
- clone or unpack sources, and go into repository dir:
  ```
  git clone git@github.com:skudi/transfolio.git
  cd transfolio
  ```
- install dependencies:
  The wiringPi libraries, headers and gpio command
  ```
  sudo apt install wiringpi
  ```
- build rpfolio
  ```
  make rpfolio
  ```
- test
  ```
  ./rpfolio -l "*.*"
  ```
  
# Connection between RaspberyPi and Atari Portfolio #

| Raspbery Pi               | direction | Portfolio printer port |
----------------------------|-----|--------------------------|
| wiringClkOut GPIO07 pin 7  |  => | printer data bit 1 pin 3 |
| GND pin 9                  | == | GND pin 18-25 |
| wiringBitOut GPIO00 pin 11 | => | printer data bit 0 pin 2 |
| wiringClkIn  GPIO02 pin 13 | <= | printer status PAPEROUOT pin 12 |
| wiringBitIn  GPIO03 pin 15 | <= | printer status SELECT pin 13 |


Pinout is defined in transfolio.c ##
```
#if defined(RASPIWIRING)
//default GPIO pins
const unsigned int wiringClkOut = 7; //GPIO07 pin 7
                                   //GND    pin 9
const unsigned int wiringBitOut = 0; //GPIO00 pin 11
const unsigned int wiringClkIn  = 2; //GPIO02 pin 13
const unsigned int wiringBitIn  = 3; //GPIO03 pin 15
#endif
```
