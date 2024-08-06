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
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, darwin, ... }@inputs:
    let
      mkHm = modules: system: extraArgs: home-manager.lib.homeManagerConfiguration {
        inherit modules;
        pkgs =
          let
            pkgs =
              nixpkgs.legacyPackages.${system};
          in
          if pkgs.stdenv.isDarwin then
            pkgs.extend inputs.nixpkgs-firefox-darwin.overlay
          else
            pkgs;
        extraSpecialArgs = extraArgs;
      };

    mkDarwin = { modules ? [ ], extraArgs ? { } }: darwin.lib.darwinSystem {
      system = "aarch64-linux";
      modules = [./darwin/darwin-configuration.nix] ++ modules;
      # use specialArgs to pipe through arguments to darwin-configuration
    };

    in
    {
      darwinConfigurations = {
        "edmisml@mbp16" = mkDarwin { } ;
      };

      homeConfigurations = {
        "edmisml@popos" =
          mkHm [ ./home/common.nix ] "x86_64-linux" { inherit inputs; };
        "edmisml@mbp16" =
          mkHm [ ./home/common.nix ] "aarch64-darwin" { inherit inputs; };
      };
    };
}
