# Pywal Templates for KDE Plasma
A collection of pywal templates designed to bring dynamic, wallpaper-driven color schemes to KDE Plasma. Forked from [Utterly Sweet](https://github.com/HimDek/Utterly-Sweet-Plasma), these templates allow you to synchronize your global Plasma colors, Kvantum application style, and Konsole profiles with a single `wal` command.

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

## How to use
Make sure you set a good wallpaper before starting, and remember where you saved it, because you'll need the file's path for step 2.

### A. Install Script
I'll put this together soon.

### B. Manual Install

#### 1. Clone the repo and move the templates:
```bash
git clone https://github.com/areyoufeelingitnowmrkrebs/plasmawal && \
mkdir -p ~/.config/wal/templates/plasma && \
mv plasmawal/Templates/* ~/.config/wal/templates/plasma && \
rm -rf plasmawal
```

#### 2. Run `wal`:
*Don't forget to use the **actual** path to your wallpaper.*
```bash
wal --cols16 -n -i /path/to/your/wallpaper
```

#### 3. Create symlinks from `wal` cache to installation paths:
```bash
ln -s ~/.cache/wal/plasma/Kvantum ~/.config/Kvantum/Pywal && \
ln -s ~/.cache/wal/plasma/color-scheme.colors ~/.local/share/color-schemes/Pywal.colors && \
ln -s ~/.cache/wal/plasma/konsole.colorscheme ~/.local/share/konsole/Pywal.colorscheme
```

#### 4. Open and set:
* Kvantum Theme Manager: **Pywal**
* Konsole > Edit Profile > Appearance: **Pywal**
* System Settings > Colors & Themes >
   * Colors: **Pywal**
   * Application Style: **Kvantum**

## Notes
You must repeat step 2 to generate new colors every time you change your wallpaper, and refreshing `plasmashell` never hurts:
```bash
wal --cols16 -n -i /path/to/your/wallpaper && \
systemctl --user restart plasma-plasmashell
```
The `wal` templates are forks of [Utterly Sweet](https://github.com/HimDek/Utterly-Sweet-Plasma), so I recommend pairing them with:

System Settings > Colors & Themes >
* Plasma Style: [Utterly Round](https://store.kde.org/p/1901768)
* Window Decorations: [Utterly Round Dark](https://store.kde.org/p/2132512)

*Both will follow the color schemes created by `wal`.*
