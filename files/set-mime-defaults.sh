#!/usr/bin/env bash

# NOTE: To get the correct handler name: ls /usr/share/applications/ | grep -i loupe

set_default() {
  local mime="$1" desktop="$2"
  handlr set "$mime" "$desktop"
  xdg-mime default "$desktop" "$mime"
}

# Images -> Loupe
grep '^image/' /usr/share/mime/types | awk '{print $1}' | while read -r mime; do
  set_default "$mime" org.gnome.Loupe.desktop
done

# Videos -> mpv
grep '^video/' /usr/share/mime/types | awk '{print $1}' | while read -r mime; do
  set_default "$mime" mpv.desktop
done

# Text -> nvim
grep '^text/x-' /usr/share/mime/types | awk '{print $1}' | while read -r mime; do
  set_default "$mime" nvim.desktop
done

# PDF --> Evince
handlr set application/pdf org.gnome.Evince.desktop
xdg-mime default org.gnome.Evince.desktop application/pdf

# Terminal --> Kitty
handlr set x-scheme-handler/terminal kitty.desktop
xdg-mime default kitty.desktop x-scheme-handler/terminal

# File Manager --> Thunar
xdg-mime default thunar.desktop inode/directory
handlr set inode/directory thunar.desktop

# Browser --> Firefox
handlr set text/html firefox.desktop
handlr set x-scheme-handler/about firefox.desktop
handlr set x-scheme-handler/http firefox.desktop
handlr set x-scheme-handler/https firefox.desktop
handlr set x-scheme-handler/unknown firefox.desktop
xdg-mime default firefox.desktop text/html
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https

# List handlers
handlr list
