{ config, pkgs, callPackage, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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

  home.packages = [
    pkgs.htop
    pkgs.fortune
    pkgs.ripgrep
    pkgs.fd
    pkgs.sbcl
    pkgs.less
    pkgs.neofetch
    pkgs.guile
    pkgs.cloc
    pkgs.exa
    pkgs.emacs
    pkgs.zoxide
  ];

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.fzf.defaultCommand = "fd --type f";
  programs.fzf.defaultOptions =
    [ "--height 50%" "--border" "--layout=reverse" "--info=inline" ];

  programs.fzf.changeDirWidgetOptions = [
    "--preview 'bat --style=numbers --color=always --theme=gruvbox-dark --line-range :500 {}'"
  ];

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  programs.broot.enable = true;
  programs.broot.enableZshIntegration = true;
  programs.broot.modal = true;

  programs.bat.enable = true;

  programs.bat.config = {
    theme = "TwoDark";
    pager = "less -FR";
  };

  programs.neovim.enable = true;

  programs.neovim.plugins = with pkgs.vimPlugins; [
    vim-nix
    {
      plugin = vim-startify;
      config = "let g:startify_change_to_vcs_root = 0";
    }
  ];

  programs.zsh.prezto.enable = true;

  programs.zsh.prezto.autosuggestions.color = "fg=blue";

  programs.zsh.prezto.caseSensitive = true;

  programs.zsh.prezto.editor.dotExpansion = true;

  programs.zsh.prezto.editor.keymap = "emacs";

  programs.zsh.prezto.editor.promptContext = true;

  programs.zsh.prezto.gnuUtility.prefix = "g";
  programs.zsh.prezto.historySubstring.foundColor = "fg=blue";

  programs.zsh.prezto.prompt.theme = "random";
  programs.zsh.prezto.python.virtualenvAutoSwitch = true;

  programs.zsh.dotDir = "~/.config/zsh";

  programs.zsh.enable = true;

  programs.zsh.enableAutosuggestions = true;

  programs.zsh.enableCompletion = true;
  programs.zsh.enableSyntaxHighlighting = true;

  programs.zsh.cdpath = [ "~/Projects/Repositories" ];

  programs.zsh.defaultKeymap = "emacs";
  programs.zsh.history.path = "~/.config/zsh/history";
  programs.zsh.history.save = 50000;
  programs.zsh.shellAliases = {
    l = "ls -lha";
    gt = "git status";
    ls = "exa -lha";
  };

  programs.zsh.sessionVariables = rec { EDITOR = "nvim"; };
}
