{
  description = "Yilin  Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    # emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, emacs-overlay }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.neovim
          pkgs.mkalias
          # pkgs.obsidian
          # pkgs.arc-browser
          # pkgs.raycast
          # pkgs.vscode
          # pkgs.emacs-textmate
          # pkgs.notion
          # pkgs.snipaste
          # pkgs.warp-terminal
          # pkgs.bitwarden-desktop
          # pkgs.appcleaner
          # pkgs.git
          # pkgs.tmux
          # pkgs.zsh
          # pkgs.oh-my-zsh
          # pkgs.keka
          # pkgs.termius
          # pkgs.jq
          # pkgs.htop
          # pkgs.fzf
          # pkgs.tree
          # pkgs.ffmpeg
          # pkgs.discord
        ];

      homebrew = {
        enable = true;
        brews = [
          "mas"
        ];
        casks = [
          "alt-tab"
          # "chatgpt"
          # "whatsapp"
          # "cursor"
          # "element"
          # "wechat"
          # "mac-mouse-fix"
          # "qlmarkdown"
          # "lulu"
          # "zipic"
          # "only-switch"
          # "orbstack"
        ];
        masApps = {
          # "Yoink" = 457622435;
          # "Quantumult X" = 1443988620;
          # "Things" = 904280696;
          # "Bob" = 1630034110;
        };
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      fonts.packages = [
        (pkgs.nerdfonts.override { fonts = [
          "JetBrainsMono"
          "Hack"
        ]; })
      ];

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
       };
      in
      pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
          app_name=$(basename "$src")
         echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
            '';

      system.defaults = {
        dock.autohide = true;
        dock.persistent-apps = [
          # "${pkgs.obsidian}/Applications/Obsidian.app"
          "/System/Applications/Mail.app"
          "/System/Applications/Calendar.app"
          "/Applications/Arc.app"
        ];
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.GuestEnabled = false;
        NSGlobalDomain.AppleICUForce24HourTime = true;
        # NSGlobaLDomain.AppleInterfaceStyle = "Dark";
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mac-m1" = nix-darwin.lib.darwinSystem {
      modules = [ 
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "Zephyr";
              autoMigrate = true;

              # Optional: Declarative tap management
              # taps = {
              #  "homebrew/homebrew-core" = homebrew-core;
              #  "homebrew/homebrew-cask" = homebrew-cask;
              #};
  
              # Optional: Enable fully-declarative tap management
              #
              # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
             # mutableTaps = false;
            };
          }
        ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mac-m1".pkgs;
  };
}
