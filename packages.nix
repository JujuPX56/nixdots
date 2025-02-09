{ config, pkgs, inputs, ... }:
  {
  environment.systemPackages = with pkgs; [
    neovim 
    wget
    git
    hyprland
    ghostty
    wofi
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
    avalonia-ilspy
    xwaylandvideobridge
    youtube-music
    protontricks
    python313Packages.waitress
    python313Full
    scanmem
    pyright
    r2modman
    xclip
    copyq
    parabolic
    ollama
  ];
  nixpkgs = { 
    overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
    ];
  };
  }
