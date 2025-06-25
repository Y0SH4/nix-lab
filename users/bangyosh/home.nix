{ config, pkgs, inputs, username, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/programs
    ./modules/fonts.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}

