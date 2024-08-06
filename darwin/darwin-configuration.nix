{ pkgs, home-manager, ... }@inputs:
{
  imports =
    [ (home-manager.darwinModules.home-manager) ];

  services.nix-daemon.enable = true;

  # It seems like this is needed even though I don't use zsh?
  programs.zsh.enable = true;

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  home-manager = {
    userGlobalPackages = true;
    useUserPackages = true;
    # TODO take "machine" as input parameter
    users."edmisml" = import ../home/common.nix;
  };

  system.stateVersion = 4;

}
