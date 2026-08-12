#!/bin/bash

echo ""
echo "What is the path to your wallpaper?"
echo ""
read -p "> " wallpaper
echo ""
echo "Thanks. One moment..."

mkdir -p ~/.config/wal/templates/plasma ~/.local/share/konsole ~/.config/Kvantum ~/.local/share/color-schemes

mv plasmawal/Templates/* ~/.config/wal/templates/plasma

wal --cols16 -n -i "$wallpaper"

ln -s ~/.cache/wal/plasma/color-scheme.colors ~/.local/share/color-schemes/Pywal.colors
ln -s ~/.cache/wal/plasma/konsole.colorscheme ~/.local/share/konsole/Pywal.colorscheme
ln -s ~/.cache/wal/plasma/Kvantum ~/.config/Kvantum/Pywal


kwriteconfig6 --file ~/.local/share/konsole/Default.profile --group "Appearance" --group "ColorScheme" --key "Pywal"
kwriteconfig6 --file ~/.config/Kvantum/kvantum.kvconfig --group "General" --key "theme" "Pywal"
kwriteconfig6 --file "kdeglobals" --group "General" --key "ColorScheme" "Pywal"
kwriteconfig6 --file "kdeglobals" --group "KDE" --key "widgetStyle" "kvantum"

rm -rf plasmawal

systemctl --user restart plasma-plasmashell

echo ""
echo "Done, enjoy (:"
echo ""
