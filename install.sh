#!/bin/bash

set -e 

git clone https://github.com/HimDek/Utterly-Round-Plasma-Style

echo ""
echo "What is the path to your wallpaper?"
echo ""
read -p "> " wallpaper

if [ ! -f "$wallpaper" ]; then
    echo "Error: '$wallpaper' not found."
    exit 1
fi

echo ""
echo "Perfect! Now check this out. 😎"
echo ""

mkdir -p $HOME/.local/share/plasma/desktoptheme \
         $HOME/.config/wal/templates/plasma \
         $HOME/.local/share/aurorae/themes \
         $HOME/.local/share/color-schemes \
         $HOME/.local/share/konsole \
         $HOME/.config/Kvantum

mv Utterly-Round-Plasma-Style/aurorae/dark/translucent $HOME/.local/share/aurorae/themes/Utterly-Round-Dark
mv Utterly-Round-Plasma-Style/desktoptheme/translucent $HOME/.local/share/plasma/desktoptheme/Utterly-Round
mv plasmawal/Templates/* $HOME/.config/wal/templates/plasma

wal --cols16 -n -i "$wallpaper"

ln -sf $HOME/.cache/wal/plasma/color-scheme.colors $HOME/.local/share/color-schemes/Pywal.colors
ln -sf $HOME/.cache/wal/plasma/konsole.colorscheme $HOME/.local/share/konsole/Pywal.colorscheme
ln -sf $HOME/.cache/wal/plasma/Kvantum $HOME/.config/Kvantum/Pywal

touch $HOME/.local/share/konsole/Pywal.profile \
      $HOME/.config/Kvantum/kvantum.kvconfig \
      $HOME/.config/konsolerc

plasma-apply-desktoptheme Utterly-Round
plasma-apply-colorscheme Pywal
kvantummanager --set Pywal
kwriteconfig6 --file kdeglobals --group KDE --key widgetStyle kvantum
kwriteconfig6 --file $HOME/.local/share/konsole/Pywal.profile --group Appearance --key ColorScheme Pywal
kwriteconfig6 --file $HOME/.local/share/konsole/Pywal.profile --group General --key Name Pywal
kwriteconfig6 --file $HOME/.config/konsolerc --group "Desktop Entry" --key DefaultProfile Pywal.profile
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key theme __aurorae__svg__Utterly-Round-Dark
qdbus org.kde.KWin /KWin reconfigure

rm -rf Utterly-Round-Plasma-Style
rm -rf plasmawal

systemctl --user restart plasma-plasmashell

echo ""
echo "Done. Cheers! 🍻"
echo ""
