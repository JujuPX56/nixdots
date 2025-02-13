{ inputs, pkgs, config, lib, username, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

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
      allowunfree = true;
      allowunfreepredicate = _: true;
    };
  };

    home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file.".config".recursive = true;
  home.file.".config".force = true;
  home.file.".config".source = ./configurations;
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
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  # Enable zoxide and everything else (no shell integration needed)
  programs.zoxide.enable = true;
  programs.starship.enable = true;

  programs.starship.enableTransience = true;

  programs.fish.enable = true;
  programs.fish.shellInit = "pokeget random --hide-name | fastfetch --file-raw -";
  programs.fish.shellAliases = {
    vim = "nvim";
    ls = "eza -1 --icons=always --show-symlinks";
    la = "eza -1 --icons=always --show-symlinks --all";
    clear = "clear && pokeget random --hide-name | fastfetch --file-raw -";
    cd = "z";
  };

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

    background-opacity = 0.8;
  };
  # Git config
  programs.git.enable = true;

  programs.git.userName = "${username}";
  programs.git.userEmail = "${username}@${username}.me";

  # Github Cli config

  programs.gh.enable = true;

  programs.gh.gitCredentialHelper.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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

  # Firefox config
  programs.firefox.enable = true;
  programs.firefox.profiles.default = {
    settings = {
      "sidebar.verticalTabs" = true;
      "extensions.autoDisableScopes" = 0;
      "browser.startup.page" = 3;
      "general.autoScroll" = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = false;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
    };
    extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
      ublock-origin
      pywalfox
      sponsorblock
      darkreader
      dashlane
      return-youtube-dislikes
      enhancer-for-youtube
      behind-the-overlay-revival
    ];
  };
}
