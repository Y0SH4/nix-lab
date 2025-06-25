{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Y0SH4";
    userEmail = "yosa.agung13@gmail.com";
    extraConfig = {
      core.editor = "nvim";
      pull.rebase = true;
    };
  };
}
