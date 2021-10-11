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
    home.packages = pkgs.callPackage ./packages.nix {};

    programs.fish.enable = true;
    programs.broot.enable = true;
    programs.broot.enableFishIntegration = true;
    programs.broot.enableZshIntegration = true;
    programs.skim.enable = true;
    programs.skim.enableFishIntegration = true;
    programs.skim.enableZshIntegration = true;
    programs.zoxide.enable = true;
    programs.zoxide.enableFishIntegration = true;
    programs.zoxide.enableZshIntegration = true;
    programs.nnn.enable = true;

    services.emacs.package = pkgs.emacsUnstable;

    nixpkgs.overlays = [
        (import (builtins.fetchTarball {
                 url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
                 }))
    ];

}
