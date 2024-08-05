{
  description = "Home Manager configuration of Mason";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixGL = {
      url = "github:nix-community/nixGL/310f8e49a149e4c9ea52f1adf70cdc768ec53f8a";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = { 
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      mkHm = modules: system: extraArgs: home-manager.lib.homeManagerConfiguration {
         inherit modules;
         pkgs = nixpkgs.legacyPackages.${system};
         extraSpecialArgs = extraArgs;
      };

    in {
      homeConfigurations = {
        "edmisml@popos" = 
          mkHm [./home.nix] "x86_64-linux" {inherit inputs; };
        "edmisml@mbp16" = 
          mkHm [./home.nix] "aarch_64-darwin" {inherit inputs; };
      };
    };
}
