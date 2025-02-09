{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jujupx";
  home.homeDirectory = "/home/jujupx";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

    home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jujupx/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Enable zoxide and everything else (no shell integration needed)
  programs.zoxide.enable = true;
  programs.starship.enable = true;

  programs.starship.enableTransience = true;

  programs.fastfetch.enable = true;
  home.file.".config/fastfetch/config.jsonc".source = ./configurations/fastfetch/config.jsonc;

  # Sources all the file for hyprland which means config should be done there

  home.file.".config/hypr".recursive = true;
  home.file.".config/hypr".force = true;
  home.file.".config/hypr".source = ./configurations/hypr;

  programs.fish.enable = true;
  programs.fish.shellInit = "pokeget random --hide-name | fastfetch --file-raw -";
  programs.fish.shellAliases = {
    vim = "nvim";
    ls = "eza -1 --icons=always --show-symlinks";
    la = "eza -1 --icons=always --show-symlinks --all";
    clear = "clear && pokeget random --hide-name | fastfetch --file-raw -";
    cd = "z";
  };

  home.file.".config/fish/functions/".recursive = true;
  home.file.".config/fish/functions/".force = true;
  home.file.".config/fish/functions/".source = ./configurations/fish/functions;

  # Waybar

  home.file.".config/waybar".recursive = true;
  home.file.".config/waybar".force = true;
  home.file.".config/waybar".source = ./configurations/waybar;

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  # The one-liner for the win

  services.mako.enable = true;
  services.mako.extraConfig = "background-color=#1e1e2e\ntext-color=#cdd6f4\nborder-color=#f5e0dc\nprogress-color=over #313244\n[urgency=high]\nborder-color=#fab387";

  programs.ghostty.enable = true;
  programs.ghostty.settings = {
    font-size = 14;
    font-family = "JetBrainsMono Nerd Font";

    window-decoration = false;
    theme = "ghostty";
    window-padding-balance = true;
    window-padding-y = 15;
    window-padding-x = 15;
  };

  # Pywal templates
  
  home.file.".config/wal/templates".recursive = true;
  home.file.".config/wal/templates".force = true;
  home.file.".config/wal/templates".source = ./configurations/wal/templates;

  # Git config
  programs.git.enable = true;

  programs.git.userName = "jujupx";
  programs.git.userEmail = "jujupx@jujupx.me";

  # Github Cli config

  programs.gh.enable = true;

  programs.gh.gitCredentialHelper.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nvim config
  home.file.".config/nvim".recursive = true;
  home.file.".config/nvim".force = true;
  home.file.".config/nvim".source = ./configurations/nvim;

  # Add vesktop launch options
  xdg.desktopEntries = {
    vesktop = {
      categories=["Network" "InstantMessaging" "Chat"];
      exec="vesktop -wlr";
      genericName= "Internet Messenger";
      icon= "vesktop";
      # keywords= ["discord" "vencord" "electron" "chat"];
      name= "Vesktop";
      # startupWMClass= "Vesktop";
    };
  };
}
