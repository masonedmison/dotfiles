{ ... }:
{
  homebrew.brews = [
    "derailed/k9s/k9s"
    "docker-credential-helper"
  ];

  homebrew.casks =
    [
      "discord"
      "docker"
      "firefox"
      "nikitabobko/tap/aerospace"
      "postico"
      "raycast"
      "postman"
      "spotify"
    ];
}
