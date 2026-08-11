# Pywal templates for KDE Plasma
A collection of Pywal templates designed to bring dynamic, wallpaper-driven color schemes to KDE Plasma. Forked from Utterly Sweet and Utterly Round, these templates allow you to synchronize your global Plasma colors, Kvantum application style, and Konsole profiles with a single `wal` command.

## Screenshots
![Screenshot_20250317_065009](https://github.com/user-attachments/assets/8880373c-a10a-42f2-8ad9-06acd746b238)
![Screenshot_20250317_064645](https://github.com/user-attachments/assets/7dc328c4-4f35-4abb-9fdb-e23bfa9077b6)
![Screenshot_20250317_064314](https://github.com/user-attachments/assets/2a755821-1655-476f-b6ef-507cbe3ba244)

## Dependencies

* pywal16 3.8+ (AUR, GitHub)
* Kvantum Theme Manager

## How to use

### 1. Clone the repo and `cd` into it:
```bash
git clone https://github.com/areyoufeelingitnowmrkrebs/plasmawal && cd plasmawal
```


### 2. Move the templates:
```bash
mkdir -p ~/.config/wal/templates/plasma && \
mv Templates/* ~/.config/wal/templates/plasma
```
*You can safely delete your clone after this*

### 3. Set your wallpaper using *System Settings* before running `wal`

### 4. Run `wal`:
```bash
wal --cols16 -n -i /path/to/your/wallpaper
```

### 5. Create symlinks from `wal` cache to installation paths:
```bash
ln -s ~/.cache/wal/plasma/Kvantum ~/.config/Kvantum/Pywal && \
ln -s ~/.cache/wal/plasma/color-scheme.colors ~/.local/share/color-schemes/Pywal.colors && \
ln -s ~/.cache/wal/plasma/konsole.colorscheme ~/.local/share/konsole/Pywal.colorscheme
```

### 6. Open and set:
* Kvantum Theme Manager: **Pywal**
* `Konsole > Edit Profile > Appearance`: **Pywal**
* `System Settings > Colors & Themes >`
   * Colors: **Pywal**
   * Application Style: **Kvantum**

## Notes

You must repeat step 4 to generate new colors every time you change your wallpaper, and refreshing *plasmashell* never hurts:
```bash
wal --cols16 -n -i /path/to/your/wallpaper` && \
systemctl --user restart plasma-plasmashell
```

The `wal` templates are forks of Utterly Sweet and Utterly Round, so I recommend pairing them with:
* Plasma Style: Utterly Round
* Window Decorations: Utterly Round Dark

*Both will follow the color scheme created by `wal`*

