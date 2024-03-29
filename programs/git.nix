{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Mason Edmison";
    userEmail = "mason.edmison@gmail.com";

    delta.enable = true;

    aliases = {
      fp = "push --force-with-lease";
      rb = "rebase -i --autostash";
      lb = "log -n 10 --oneline";
      rbc = "rebase --continue";
    };

    ignores = [
      "**/.metals/"
      "**/project/metals.sbt"
      "**/.idea/"
      "**/.vscode/settings.json"
      "**/.bloop/"
      "**/.bsp/"
      "**/.scala-build/"
      "**/.direnv/"
      "**/.DS_Store"
      "**/.history/"
    ];

    extraConfig = {
      pull = { ff = "only"; };
      init.defaultBranch = "main";
      rerere.enabled = true;
    };
  };

  home.packages = [ pkgs.git-crypt ];
}