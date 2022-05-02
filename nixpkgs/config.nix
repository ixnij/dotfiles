{
  packageOverrides = pkgs:
    with pkgs; {
      homePackages = pkgs.buildEnv {
        name = "home-packages-ixnij";
        paths = [
          aspell
          alacritty
          coreutils
          helix
          zoxide
          btop
          cmake
          ffmpeg
          skim
          gnumake
          nixfmt
          ripgrep
          mosh
          bat
        ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
}
