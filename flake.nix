{
  description = "NIX flake config";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix"; #theme framework on Nixos

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, stylix, spicetify-nix, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hardware/configuration.nix
        inputs.lanzaboote.nixosModules.lanzaboote
      ];
    };

    homeConfigurations.gemakfy = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      modules = [
        spicetify-nix.homeManagerModules.spicetify
        inputs.nixvim.homeModules.nixvim
        stylix.homeModules.stylix
        ./home.nix
      ];
    };
  };
}
