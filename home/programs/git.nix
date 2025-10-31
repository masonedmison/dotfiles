{ ... }:
{
  programs = {
    delta = {
      enable = true;
      options = {
        dark = true;
        line-numbers = true;
        side-by-side = true;
        navigate = true;
        hyperlinks = true;
        hyperlinks-file-link-format = "nvim://{path}:{line}";
      };
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "Mason Edmison";
          email = "mason.edmison@gmail.com";
        };
        aliases = {
          fp = "push --force-with-lease";
          rb = "rebase -i --autostash";
          lb = "log -n 10 --oneline";
          rbc = "rebase --continue";
          c = "commit";
          can = "commit --amend --no-edit";
          ca = "commit --amend";
          p = "push";
        };
        pull = { ff = "only"; };
        init.defaultBranch = "main";
        rerere.enabled = true;
        core.editor = "nvim";
        push.autoSetupRemote = true;
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
        "**/.vscode/"
        "notes.md"
      ];
    };
  };
}
