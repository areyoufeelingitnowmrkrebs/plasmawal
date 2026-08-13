# Pywal Wrapper for KDE Plasma
A comprehensive `pywal` integration for KDE Plasma using templates forked from [Utterly Sweet](https://github.com/HimDek/Utterly-Sweet-Plasma) and [Utterly Round](https://github.com/HimDek/Utterly-Round-Plasma-Style).

Recolor your entire Plasma desktop with a single command.

## Screenshots
![Screenshot_20250317_065009](https://github.com/user-attachments/assets/8880373c-a10a-42f2-8ad9-06acd746b238)
![Screenshot_20250317_064645](https://github.com/user-attachments/assets/7dc328c4-4f35-4abb-9fdb-e23bfa9077b6)
![Screenshot_20250317_064314](https://github.com/user-attachments/assets/2a755821-1655-476f-b6ef-507cbe3ba244)

## Dependencies
* [pywal16](https://github.com/eylles/pywal16) (3.8+)

* [Kvantum Theme Manager](https://github.com/tsujan/Kvantum)

On Arch, install with:
```bash
sudo pacman -S kvantum && yay -S python-pywal16
```

## Installation
Copy and paste this whole block:
```bash
git clone https://github.com/areyoufeelingitnowmrkrebs/plasmawal && \
chmod +x plasmawal/install.sh && ./plasmawal/install.sh
```
*`install.sh` cleans up after itself, so it does not matter where you clone to.*

## Usage
To update your wallpaper and color scheme:
```bash
plasmawal /path/to/new/image
```
*`install.sh` puts `plasmawal` in `~/.local/bin`, so add it to your path or do `~/.local/bin/plasmawal /path/to/new/image` instead.*
