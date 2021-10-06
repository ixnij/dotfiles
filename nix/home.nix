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
            pkgs.guile
            pkgs.cloc
            pkgs.bat
            pkgs.emacs
            pkgs.zoxide
    ];

    programs.fzf.enable = true;
    programs.fzf.enableZshIntegration = true;

    programs.zoxide.enable = true;
    programs.zoxide.enableZshIntegration = true;

    programs.broot.enable = true;
    programs.broot.enableZshIntegration = true;
    programs.broot.modal = true;
}