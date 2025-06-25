{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    initContent = ''
      eval "$(starship init zsh)"
    '';

    shellAliases = {
      # File operations
      ll = "eza -la";
      ls = "eza";
      cat = "bat";
      
      # System
      sysinfo = "inxi -Fxz";
      nrs = "sudo nixos-rebuild switch --flake ~/nix-lab#laptop";
      hms = "home-manager switch --flake ~/nixos#bangyosh@laptop";
      hibernate = "systemctl hibernate";
      suspend = "systemctl suspend";
    };
  };
}
