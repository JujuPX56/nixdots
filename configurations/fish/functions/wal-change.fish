function wal-change
  wal -i $argv[1]
  cp ~/.cache/wal/colors-discord.css ~/.config/vesktop/themes/
  cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/
  mkdir -p ~/.config/ghostty/themes
  cp ~/.cache/wal/ghostty ~/.config/ghostty/themes/
end
