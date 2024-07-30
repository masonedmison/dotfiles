{ ... }: {
  programs.firefox = {
    enable = true;
    profiles."edmisml" = {
        id = 0;
        name = "default";
        settings = {
          "browser.startup.homepage" = "https://google.com";     
          "browser.urlbar.placeholderName" ="Google";
          "browser.shell.checkDefaultBrowser" = false;
        };
    };
  };
}
