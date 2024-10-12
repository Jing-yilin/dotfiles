# Install Nix
```warp-runnable-command
sh <(curl -L https://nixos.org/nix/install)
```
## Test installation
```warp-runnable-command
nix-shell -p neofetch --run neofetch

```
# Setup Flake
1. make a config directory for nix
```warp-runnable-command
mkdir ~/.config/nix
cd ~/.config/nix
```
2. setup flake\.nix config file
```warp-runnable-command
nix flake init -t nix-darwin --extra-experimental-features "nix-command flakes"
```
3. Then change the description and config name in `flake.nix`
4. 使用 nix\-darwin 在 macOS 上通过 flakes 配置来切换到一个新的系统环境或配置
```warp-runnable-command
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/.config/nix#mac-m1
```
5. check
```warp-runnable-command
which darwin-rebuild

```
# Demo \(Install Neovim\)
1. open `flake.nix` and change `pkgs.vim` to `pkgs.neovim`
2. deploy
```warp-runnable-command
darwin-rebuild switch --flake ~/.config/nix#mac-m1

```
# Demo \(Search Pkgs\)
1. search `tmux`
```warp-runnable-command
nix search nixpkgs tmux
```
    2. option 2\: you can search on the web\: [https\:\/\/search\.nixos\.org](https://search.nixos.org)
    3. option 3\: [https\:\/\/github\.com\/NixOS\/nixpkgs\/tree\/master\/pkgs](https://github.com/NixOS/nixpkgs/tree/master/pkgs)


# Install Brew App
[https\:\/\/github\.com\/zhaofengli\/nix\-homebrew](https://github.com/zhaofengli/nix-homebrew)


# How to update
1. update flake
```warp-runnable-command
cd ~/.config/nix/
```
```warp-runnable-command
nix flake update
```
2. rebuild again
```warp-runnable-command
darwin-rebuild switch --flake ~/.config/nix#mac-m1


```
# More Options
[https\:\/\/mynixos\.com\/](https://mynixos.com/)