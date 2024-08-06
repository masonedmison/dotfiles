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
    nixpkgs-firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }@inputs:
    let
      mkHm = modules: system: extraArgs: home-manager.lib.homeManagerConfiguration {
        inherit modules;
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = extraArgs;
      };

      mkDarwin = { extraModules ? [ ], extraArgs ? { } }: darwin.lib.darwinSystem {
        system = "aarch64-linux";
        specialArgs = { inherit self; };
        modules =
          [
            ./darwin/darwin-configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                # TODO take "machine" as input parameter
                users.edmisml = import ./home/common.nix ;
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ] ++ extraModules;
      };

    in
    {
      darwinConfigurations = {
        edmisml = mkDarwin { extraModules = [./darwin/common.nix]; };
      };

      homeConfigurations = {
        "edmisml@popos" =
          mkHm [ ./home/common.nix ] "x86_64-linux" { inherit inputs; };
      };
    };
}
