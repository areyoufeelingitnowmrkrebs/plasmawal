#!/bin/bash

set -e 

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

mkdir -p "$HOME/.config/wal/templates/plasma" \
         "$HOME/.local/share/color-schemes" \
         "$HOME/.local/share/konsole" \
         "$HOME/.config/Kvantum"

mv plasmawal/Templates/* "$HOME/.config/wal/templates/plasma"

wal --cols16 -n -i "$wallpaper"

ln -sf "$HOME/.cache/wal/plasma/color-scheme.colors" "$HOME/.local/share/color-schemes/Pywal.colors"
ln -sf "$HOME/.cache/wal/plasma/konsole.colorscheme" "$HOME/.local/share/konsole/Pywal.colorscheme"
ln -sf "$HOME/.cache/wal/plasma/Kvantum" "$HOME/.config/Kvantum/Pywal"

touch "$HOME/.local/share/konsole/Pywal.profile" \
      "$HOME/.config/Kvantum/kvantum.kvconfig" \
      "$HOME/.config/konsolerc"

plasma-apply-colorscheme Pywal
kvantummanager --set Pywal
kwriteconfig6 --file "kdeglobals" --group "KDE" --key "widgetStyle" "kvantum"
kwriteconfig6 --file "$HOME/.local/share/konsole/Pywal.profile" --group "Appearance" --key "ColorScheme" "Pywal"
kwriteconfig6 --file "$HOME/.local/share/konsole/Pywal.profile" --group "General" --key "Name" "Pywal"
kwriteconfig6 --file "$HOME/.config/konsolerc" --group "Desktop Entry" --key "DefaultProfile" "Pywal.profile"

rm -rf plasmawal

systemctl --user restart plasma-plasmashell

echo ""
echo "Done. You may need to log out and back in for all changes to show."
echo "If you change your wallpaper, just run 'wal --cols16 -n -i /path/to/wallpaper'."
echo ""
echo "Cheers! 🍻"
echo ""
