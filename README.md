## Manual steps
**set system to correct architecture -- there is a TODO to capture both my mac and linux boxes**

1. Install [Nix](https://zero-to-nix.com/concepts/nix-installer)
2. Build `home-manager` using the flake found in `./home-manager`
```bash
nix run home-manager/master -- init --switch
```
3. run `home-manager switch --flake`
4. Setup a kmonad (this program is installed but you will need to set up systemd daemon and any keyboard devices)
5. Run `cs setup` and choose a JVM to set up, e.g. `cs java <jvm> --setup`


## TODO
[] Programatically created systemd service and enable
[] support both mac linux laptops (64 bit darwin and x86)

## FAQ
Q: markdown preview fails with "tslib not found" error
    A: run `npm install` at `~/.local/share/nvim/lazy/markdown-preview.nvim`
