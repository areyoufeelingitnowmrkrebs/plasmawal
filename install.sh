#!/bin/bash

set -e

echo ""
echo "Where is your wallpaper saved?"
read -p "> " wallpaper
echo ""

wallpaper="${wallpaper/#\~/$HOME}"
wallpaper="$(realpath "$wallpaper" 2>/dev/null || echo "$wallpaper")"

if [ ! -f "$wallpaper" ]; then
    echo "Error: '$wallpaper' not found."
    exit 1
fi

echo "Fetching assets..."
echo ""
git clone https://github.com/HimDek/Utterly-Round-Plasma-Style

echo ""
echo "Validating installation paths..."
mkdir -p $HOME/.local/share/plasma/desktoptheme \
         $HOME/.config/wal/templates/plasma \
         $HOME/.local/share/aurorae/themes \
         $HOME/.local/share/color-schemes \
         $HOME/.local/share/konsole \
         $HOME/.config/Kvantum \
         $HOME/.local/bin

echo ""
echo "Installing..."
mv Utterly-Round-Plasma-Style/aurorae/dark/translucent $HOME/.local/share/aurorae/themes/Utterly-Round-Dark
mv Utterly-Round-Plasma-Style/desktoptheme/translucent $HOME/.local/share/plasma/desktoptheme/Utterly-Round
mv plasmawal/Templates/* $HOME/.config/wal/templates/plasma
mv plasmawal/plasmawal $HOME/.local/bin
chmod +x $HOME/.local/bin/plasmawal

echo ""
echo "Generating theme..."
echo ""
wal --cols16 -n -i "$wallpaper"

ln -sf $HOME/.cache/wal/plasma/color-scheme.colors $HOME/.local/share/color-schemes/Pywal.colors
ln -sf $HOME/.cache/wal/plasma/konsole.colorscheme $HOME/.local/share/konsole/Pywal.colorscheme
ln -sf $HOME/.cache/wal/plasma/Kvantum $HOME/.config/Kvantum/Pywal

echo ""
echo "Applying themes..."
touch $HOME/.local/share/konsole/Pywal.profile \
      $HOME/.config/Kvantum/kvantum.kvconfig \
      $HOME/.config/konsolerc

plasma-apply-wallpaperimage "$wallpaper"
plasma-apply-lookandfeel -a org.kde.breezedark.desktop
plasma-apply-desktoptheme Utterly-Round
plasma-apply-colorscheme Pywal

kvantummanager --set Pywal
kwriteconfig6 --file kdeglobals --group KDE --key widgetStyle kvantum

kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key library org.kde.kwin.aurorae.v2
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key theme __aurorae__svg__Utterly-Round-Dark
qdbus6 org.kde.KWin /KWin reconfigure

kwriteconfig6 --file $HOME/.local/share/konsole/Pywal.profile --group General --key Name Pywal
kwriteconfig6 --file $HOME/.local/share/konsole/Pywal.profile --group Appearance --key ColorScheme Pywal
kwriteconfig6 --file $HOME/.config/konsolerc --group "Desktop Entry" --key DefaultProfile Pywal.profile

echo ""
echo "Cleaning up..."
rm -rf Utterly-Round-Plasma-Style
rm -rf plasmawal

systemctl --user restart plasma-plasmashell

echo ""
echo "Success! 😎"
echo ""
echo -e "Update wallpaper and colors with: \033[1mplasmawal /path/to/new/image\033[0m"
echo -e "If \033[1m~/.local/bin\033[0m is not in your \033[1mPATH\033[0m, add it or do: \033[1m~/.local/bin/plasmawal /path/to/new/image\033[0m"
echo ""
echo "Cheers. 🍻"
echo ""
