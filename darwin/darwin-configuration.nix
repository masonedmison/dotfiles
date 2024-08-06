{ pkgs, ... }@inputs:
{
  services.nix-daemon.enable = true;

  # It seems like this is needed even though I don't use zsh?
  programs.zsh.enable = true;
  homebrew.enable = true;
  homebrew.onActivation.cleanup = "uninstall";

  nix = {
    settings.trusted-users = [ "edmisml" ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    package = pkgs.nix;

  };

  system.stateVersion = 4;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
    system = "aarch64-darwin";
  };
}
