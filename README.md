# Nixdots

Ma configuration NixOS + Hyprland avec NVidia

![Capture d'ecran de la configuration](https://github.com/JujuPX56/nixdots/blob/main/assets/screenshot1.png?raw=true)![Deuxieme capture d'ecran](https://github.com/JujuPX56/nixdots/blob/main/assets/screenshot2.png?raw=true)
## Installation

Pour utiliser la configuration, il suffit de cloner le repo dans un dossier (de préférence .dotfiles dans le home)

    git clone https://github.com/JujuPX56/nixdots ~/.dotfiles

> Il faut ensuite changer la variable user dans flake.nix avec le nom
> d'utilisateur que vous avez choisi l'hors de l'installation de NixOS.

Vous n'avez juste qu'a lancer le script d'installation  situé dans le dossier **scripts/** et le tour est joué !

>ATTENTION, LE SCRIPT N'A PAS ENCORE EU L'OCCASION D'ETRE TESTE DONC SI VOUS ENCONTREZ DES ERREURS N'HESITEZ PAS A OUVRIR UNE ISSUE

    ./scripts/install.sh

## Raccourcis claviers

  
|Raccourcis| Actions |
|--|--|
| <kbd>Super</kbd> + <kbd>T</kbd> | Ouvrir le terminal (ghostty) |
| <kbd>Super</kbd> + <kbd>F</kbd> | Ouvrir le navigateur (firefox) |
| <kbd>Super</kbd> + <kbd>D</kbd> | Ouvrir le lanceur d'application (rofi) |
| <kbd>Super</kbd> + <kbd>1-9</kbd> | Changer de workspaces (bureaux virtuels) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1-9</kbd> | Faire migrer un fenêtre entre plusieurs workspaces|
| <kbd>Super</kbd> + <kbd>E</kbd> | Ouvrir l'explorateur de fichiers (dolphin) |
| <kbd>Super</kbd> + <kbd>S</kbd> | Ouvrir le workspace spécial|
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd> | Faire migrer la fenêtre vers le workspace spécial|
| <kbd>Super</kbd> + <kbd>M</kbd> | Fermer la session d'Hyprland|
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Q</kbd> | Fermer la fenêtre |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd> | Recharger Hyprland |
| <kbd>Super</kbd> + <kbd>P</kbd> | Faire une capture d'écran et l'enregistrer|
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> | Faire une capture d'écran et la copier dans le presse-papiers |
| <kbd>Super</kbd> + <kbd>Clic-droit</kbd> | Redimensionner une fenêtre|
| <kbd>Super</kbd> + <kbd>Clic-gauche</kbd> | Bouger une fenêtre|
| <kbd>Super</kbd> + <kbd>V</kbd> | Passe une fenêtre en mode flottant|
| <kbd>Super</kbd> + <kbd>Entrer</kbd> | Passe une fenêtre en mode plein-écran|

