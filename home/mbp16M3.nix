{ pkgs, config, ... }: {
  imports = [ ./common.nix ];

  home.packages = [
    pkgs.helmfile
    pkgs.kubectl
    pkgs.kubernetes-helm
  ];


  programs.fish = {
    functions = {
      mdmworktrees = {
        body = ''
          cd ~/mdm/metadata-manager; git worktree add -b $argv ~/mdm/worktrees/mdm/$argv origin/master
          cd ~/mdm/metadata-common; git worktree add -b $argv ~/mdm/worktrees/mdco/$argv origin/master
          cd ~/mdm/metadata-utility; git worktree add -b $argv ~/mdm/worktrees/mdu/$argv origin/master
          cd ~/mdm/metadata-catalog; git worktree add -b $argv ~/mdm/worktrees/mdca/$argv origin/master
        '';
      };
      mdmwo = {
        body = ''
          kitty @ launch --type=tab --tab-title "common - $argv" --cwd "~/mdm/worktrees/mdco/$argv" --keep-focus nvim
          kitty @ launch --type=tab --tab-title "manager - $argv" --cwd "~/mdm/worktrees/mdm/$argv" --keep-focus nvim
          kitty @ launch --type=tab --tab-title "catalog - $argv" --cwd "~/mdm/worktrees/mdca/$argv" --keep-focus nvim
          kitty @ launch --type=tab --tab-title "utility - $argv" --cwd "~/mdm/worktrees/mdu/$argv" --keep-focus nvim
        '';
      };
    };
    shellAliases = {
      # mdm git directorys
      mdm = "cd ~/mdm/metadata-manager/";
      mdc = "cd ~/mdm/metadata-common/";
      mdca = "cd ~/mdm/metadata-catalog/";

      # MDM worktrees
      mdmw = "cd ~/mdm/worktrees/";
      mdmwm = "cd ~/mdm/worktrees/mdm";
      mdmwco = "cd ~/mdm/worktrees/mdco";
      mdmwca = "cd ~/mdm/worktrees/mdca";
      mdmwu = "cd ~/mdm/worktrees/mdu";

      drb = "darwin-rebuild switch --flake ~/dotfiles/#medmison";

      qc = "q chat --trust-tools fs_write,get-library-docs,resolve-library-id";
    };
  };

  # While I'm still new to aerospace I'm going to simply symlink
  # to ~/.config/aerospace for quicker update cycles
  xdg.configFile."aerospace/aerospace.toml" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink ./aerospace/aerospace.toml;
  };
}
