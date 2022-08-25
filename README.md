# NOTE
## This repository is a work in progress, you may experience bugs, glitches and general oddities. Should these occur please report them as issues.

## Information 

A WIP fork of pokecrystal designed to restore and localize Mobile Adapter functionality such as online battles and trades to Crystal using disassembled code from the Japanese ROM designed for use with the REON Project.

This repository is built upon a substantial amount of work done by Sudel-Matze.

A link to Matze’s repository can be found here:
https://github.com/Sudel-Matze/pokecrystal

## Setup [![Build Status][travis-badge]][travis]

An older version of RGBDS is required, we recommend 0.3.8

For more information, please see [INSTALL.md](INSTALL.md)

After setup has been completed, you can build the ROM by running this command inside the repository directory in cygwin64:

- IT Version:	`make`

If you're looking for other languages, you can find them here: (https://github.com/pokecrystal-mobile)

But please note that they still require a lot of polish.

## Using Mobile Adapter Features

To take advantage of the Mobile Adapter features, we currently recommend the GameBoy Emulator BGB:
https://bgb.bircd.org/

and libmobile-bgb:
https://github.com/REONTeam/libmobile-bgb/releases

Simply open BGB, right click the ‘screen’ and select `Link > Listen`, then accept the port it provides by clicking `OK`.
Once done, run the latest version of libmobile for your operating system (`mobile-windows.exe` or windows and `mobile-linux` for linux).
Now right click the ‘screen’ on BGB again and select `Load ROM…`, then choose the pokecrystal-mobile `.gbc` file you have built.

## To-Do

- Finish restrictions on Pokémon names in EZ Chat Menu.
-	Finish localizing and restricting zip codes for each version
- Translate any remaining English text
- Fix an issue with battles crashing
- Bringing menus up to par with vanilla

## Contributors

- Pret           : Initial disassembly
- Matze          : Mobile Restoration & Japanese Code Disassembly
- Damien         : Code
- DS             : GFX & Code
- Ryuzac         : Code & Japanese Translation
- Zumilsawhat?   : Code (Large amounts of work on the EZ Chat system)
- Arves          : Italian Mobile Translation
- Federx         : Italian Mobile Translation
- FerozElMejor   : Spanish Mobile Translation
- FrenchOrange   : French Mobile Translation
- Lesserkuma     : German Mobile Translation
- Muffet         : German Mobile Translation
- REON Community : Support and Assistance

[travis]: https://travis-ci.org/pret/pokecrystal
[travis-badge]: https://travis-ci.org/pret/pokecrystal.svg?branch=master
