{
  description = "Le meilleur flake de tous les temps";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      #---------------------------#
      username = "jujupx"; # <------------- Changez cette ligne avec votre nom d'utilisateur
      #---------------------------#
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
          specialArgs = { inherit username; };
        };
      };
      homeConfigurations = {
        jujupx = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
          ./home.nix 
          ];
          extraSpecialArgs = { inherit inputs username; };
        };
      };
    };
}
