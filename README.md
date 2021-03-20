# Super Productivity as a Flatpak

## Overview

This is a simple Flatpak to run the Super Productivity application. I wanted to do this to learn how to use Flaktpaks, make Flatpaks, and publish Flatpaks. With the help of my friend @spion06, we were able to get the Electron App to run from the Flatpak, generate a few tasks, close them, and then close the app.

## Requirements

* GNU/Linux
  
  * Fedora
  
  * Ubuntu

* Flatpak

* Flatpak Builder

## Setup

Install Flatpak by following the documentation for your distribution.

* [Flatpak Setup](https://www.flatpak.org/setup/)

Then download the flatpak-builder for your distribution.

## Usage

Inside the Makefile are the commands used to perform the builds and export the `.flatpak` file.

Use in this sequence:

1. `make clean`

2. `make build`

3. `make test`

4. `make clean repo`

5. `make install`

6. `make export`

## References

* [Flatpak Homepage](https://www.flatpak.org/)

* [Flatpak Developer's Guide](https://docs.flatpak.org/en/latest/)

I also looked at a bunch of other working Flatpak repositories

* [GitHub - flathub/im.riot.Riot](https://github.com/flathub/im.riot.Riot)
