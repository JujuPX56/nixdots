{ config, pkgs, inputs, ... }:
  {
  environment.systemPackages = with pkgs; [
    neovim 
    wget
    git
    hyprland
    ghostty
    rofi-wayland
    vesktop
    fish
    mako
    eza
    nerd-fonts.jetbrains-mono
    nerd-fonts.code-new-roman
    starship
    zoxide
    fastfetch
    pokeget-rs
    xwayland
    kdePackages.wayland-protocols
    swww
    wl-clipboard-rs
    waybar
    nautilus
    pywal16
    imagemagick
    grim
    slurp
    libnotify
    haguichi
    logmein-hamachi
    pwvucontrol
    font-awesome
    arrpc
    gh
    lunar-client
    flatpak
    nwg-displays
    libinput
    vlc
    xwaylandvideobridge
    youtube-music
    protontricks
    python313Packages.waitress
    python313Full
    pyright
    r2modman
    xclip
    copyq
    parabolic
    heroic
    pywalfox-native
    gcc
    bluetuith
    wlogout
    cmake
    wootility
    wooting-udev-rules
  ];
  nixpkgs = { 
    overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
    ];
  };
  }
