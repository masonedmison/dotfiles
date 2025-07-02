{
  description = "Home Manager configuration of Mason";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl = {
      url = "github:nix-community/nixGL";
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
      mkHm = modules: userConfig: extraArgs: home-manager.lib.homeManagerConfiguration {
        inherit modules;
        pkgs =
          import nixpkgs {
            system = userConfig.architecture;
            overlays = [ inputs.nixgl.overlay ];
          };
        extraSpecialArgs = extraArgs // { inherit userConfig; };
      };

      mkDarwin = { userConfig, extraModules ? [ ], extraArgs ? { }, extraHmModules ? [ ] }: darwin.lib.darwinSystem {
        system = userConfig.architecture;
        specialArgs = { inherit self userConfig; };
        modules =
          [
            ./darwin/darwin-configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${userConfig.username} = {
                  imports = extraHmModules;
                };
                extraSpecialArgs = extraArgs // {
                  inherit userConfig;
                };
              };
            }
          ] ++ extraModules;
      };

      systems = import ./systems.nix;

    in
    {
      darwinConfigurations = {
        edmisml = mkDarwin { userConfig = systems.mbp13.userConfig; extraArgs = { inherit inputs; }; extraModules = [ ./darwin/common.nix ]; extraHmModules = [ ./home/mbp16.nix ]; };
        medmison = mkDarwin { userConfig = systems.workmac.userConfig; extraArgs = { inherit inputs; }; extraModules = [ ./darwin/common.nix ]; extraHmModules = [ ./home/mbp16M3.nix ]; };
      };
      homeConfigurations = {
        "edmisml@popos" =
          mkHm [ ./home/s76.nix ] systems.s76.userConfig { inherit inputs; };
      };
    };
}
