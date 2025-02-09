# Nixdots

Ma configuration NixOS + Hyprland avec NVidia

## Installation

Pour utiliser la configuration, il suffit de cloner le repo dans un dossier (de préférence .dotfiles dans le home)

```bash
git clone https://github.com/JujuPX56/nixdots ~/.dotfiles && cd .dotfiles && rm -rf .git
```

Il faut ensuite remplacer la configuration matérielle avec celle effectuée automatiquement lors de l’installation

```bash
sudo cp /etc/nixos/hardware-configuration.nix . && sudo chown $USER hardware-configuration.nix
```

Ensuite, c’est la partie un peu longue :
Il faut remplacer chaque mention de “jujupx” dans configuration.nix, flake.nix et home.nix avec le nom d’utilisateur que vous avez choisi lors de l’installation de l’OS.

Ensuite, il suffit de reconstruire l’OS avec la nouvelle configuration :

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

```bash
sudo nixos-rebuild switch --flake .
```

Après cela, il faut installer home-manager (le logiciel permettant la gestion du .config) et reconstruire ce dernier

```bash
nix-shell '<home-manager>' -A install && home-manager switch —-flake .
```

Finalement il faut utiliser le script wal-change afin de générer la palette de couleur pour Hyprland. Pour cela lancez une session de fish :

```bash
fish
```
Tapez ensuite la commande suivante pour utiliser le fond d’écran par défaut de la configuration :

```fish
wal-change wallpaper/wallpaper.png
```

## Vous n’avez plus qu’à redémarrer et le tour est joué !

## Todo

- Liste des raccourcis clavier
- Script d’installation ?
