## Manual steps
**set system to correct architecture

1. Install [Nix](https://zero-to-nix.com/concepts/nix-installer)
2. Build `home-manager` using the flake found in `./home-manager`
```bash
nix run home-manager/master -- init --switch
```
3. run `home-manager switch --flake`
4. Setup a kmonad (this program is installed but you will need to set up systemd daemon and any keyboard devices)
5. Run `cs setup` and choose a JVM to set up, e.g. `cs java <jvm> --setup`
6. Run `rustup default stable` to install necessary rust tooling (cargo, clippy, etc.).

### To get `delta` hyperlinks to work on Mac

> This assumes that `kitty` is configured with `listen_on = "unix:/tmp/mykitty"`

- pull down this [repo](https://github.com/masonedmison/open-in-editor/tree/add-neovim-kitty-support)
- copy the application bundle to `~/Library/Application Support/`
- Install `duti` if not already (it should be installed in `darwin/common.nix`)
- Run `duti -s org.dandavison.OpenInEditor nvim all`


### Setup `codecompanion`
- Get API key and place at `~/tokens/anthropic-token.txt`

## TODO
- [ ] Programatically created systemd service and enable
- [x] support both mac linux laptops (64 bit darwin and x86)
- [ ] "nixify" OpenInEditor setup

## FAQ
Q: markdown preview fails with "tslib not found" error

    - A: run `npm install` at `~/.local/share/nvim/lazy/markdown-preview.nvim`

Q: `touchIdAuth` is not working when mac is plugged into docking station

    - A: Run `/usr/bin/defaults write ~/Library/Preferences/com.apple.security.authorization.plist ignoreArd -bool TRUE` and restart terminal--[source](https://discussions.apple.com/thread/255187302?sortBy=rank)

