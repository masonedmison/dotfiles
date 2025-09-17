{ pkgs, config, ... }: {
  imports = [ ./common.nix ];

  home = {
    packages = [
      pkgs.helmfile
      pkgs.kafkactl
      pkgs.kubectl
      pkgs.kubernetes-helm
      pkgs.jira-cli-go
    ];
    sessionVariables = {
      CLAUDE_CODE_USE_BEDROCK = 1;
      AWS_REGION = "us-east-1";
      ANTHROPIC_MODEL = "arn:aws:bedrock:us-east-1:906177868613:application-inference-profile/jqsg88qb8n4m";
      ANTHROPIC_SMALL_FAST_MODEL = "arn:aws:bedrock:us-east-1:906177868613:application-inference-profile/6v24g7357kk5";
      CLAUDE_CODE_MAX_OUTPUT_TOKENS = 8192;
      MAX_THINKING_TOKENS = 1024;
      AWS_PROFILE = "DevOpsShared";

    };
  };


  programs.fish = {
    shellAliases = {
      drb = "sudo darwin-rebuild switch --flake ~/dotfiles/#medmison";

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
