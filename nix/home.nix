{ config, pkgs, callPackage, ... }:

let home = builtins.getEnv "HOME";

in {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "wu";
  home.homeDirectory = home;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
  home.packages = pkgs.callPackage ./packages.nix {};

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    skim = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    # Atuin has't support aarch64-darwin yet.
    #atuin = {
    #  enable = true;
    #  enableZshIntegration = true;
    #};

    zsh = rec {
      enable = true;
      dotDir = ".config/zsh";
      initExtra = (builtins.readFile "${home}/${dotDir}/zshrc") + (builtins.readFile "${home}/Projects/Repositories/My/Dotfiles/zsh/zshrc.local") +
                  ''
        if [[ $TERM == dumb || $TERM == emacs || ! -o interactive ]]; then
        unsetopt zle
        unset zle_bracketed_paste
        export PS1='%m %~ $ '
        else
        . ${config.xdg.configHome}/zsh/plugins/iterm2_shell_integration
        fi
      '';
      plugins = [
        {
          name = "iterm2_shell_integration";
          src = pkgs.fetchurl {
            url = https://iterm2.com/shell_integration/zsh;
            sha256 = "1h38yggxfm8pyq3815mjd2rkb411v9g1sa0li884y0bjfaxgbnd4";
            # date = 2021-05-02T18:15:26-0700;
          };
        }
      ];
    };

    neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        vim-nix
      ];
    };

#    emacs = {
#      enable = true;
#      package = (pkgs.emacsGcc.override {
#        withXwidgets = true;
#      });
#    };
  };

  services.emacs.package = pkgs.emacsUnstable;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    }))
  ];
}
