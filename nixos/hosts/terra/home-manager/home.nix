{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "terra";
  home.homeDirectory = "/home/terra";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = [
   # pkgs.osu-lazer
  ];

  home.file = {
  
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
