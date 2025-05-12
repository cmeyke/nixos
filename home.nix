{ config, pkgs, plasma-manager, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "user";
  home.homeDirectory = "/home/user";

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Carsten Meyke";
    userEmail = "carsten.meyke@gmail.com";
  };

  imports = [
    plasma-manager.homeManagerModules.plasma-manager
    ./plasma.nix
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
