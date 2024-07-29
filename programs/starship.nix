{ ... }: {

  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      c = {};

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      directory = {
        truncation_length = 6;
        truncation_symbol = ".../";
      };

      git_branch = {};

      git_commit = {};

      rust = {}; 
      
      scala = {};
    };
  };
}