{ config, pkgs, callPackage, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "wu";
  home.homeDirectory = "/Users/wu";

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

    zsh = rec {

      enable = true;
      dotDir = ".config/zsh";
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      initExtra = (builtins.readFile ~/Projects/Repositories/My/Dotfiles/zsh/zshrc.local) +
                  ''
      if [[ $TERM == dumb || $TERM == emacs || ! -o interactive ]]; then
            unsetopt zle
            unset zle_bracketed_paste
            export PS1='%m %~ $ '
        else
           . ${config.xdg.configHome}/zsh/plugins/iterm2_shell_integration
#           . ${config.xdg.configHome}/zsh/plugins/iterm2_tmux_integration
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
        # {
        #   name = "iterm2_tmux_integration";
        #   src = pkgs.fetchurl {
        #     url = https://gist.githubusercontent.com/antifuchs/c8eca4bcb9d09a7bbbcd/raw/3ebfecdad7eece7c537a3cd4fa0510f25d02611b/iterm2_zsh_init.zsh;
        #     sha256 = "1v1b6yz0lihxbbg26nvz85c1hngapiv7zmk4mdl5jp0fsj6c9s8c";
        #     # date = 2020-01-07T15:59:13-0800;
        #   };
        # }
      ];

      prezto = {
        enable = true;
        editor = {
          keymap = "emacs";
        };
        prompt.theme = "minimal";
      };

    };
    neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        yankring
        vim-nix
        { plugin = vim-startify;
          config = "let g:startify_change_to_vcs_root = 0";
        }
      ];

    };
  };

  services.emacs.package = pkgs.emacsGcc;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    }))
  ];
}
