#!/usr/bin/env bash

cd ~/.dotfiles

#Copies the hardware scan and sets the user as the owner
sudo cp /etc/nixos/hardware-configuration.nix .
sudo chown $USER hardware-configuration.nix
rm -rf .git

#Rebuild the system
sudo nixos-rebuild switch --flake .

#Installs home-manager and rebuilds it's config
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
home-manager switch —-flake .

#Prints the instructions for the wallpaper
printf "L'installation a été un succès !
Afin de générer les couleurs à partir du fond d'écran, il faut lancer un terminal dans Hyprland avec :
  Super+T
puis écrire la commande suivante :
  'wal-change ~/.dotfiles/wallpaper/wallpaper.png' (le chemin de l'image peut changer)"
