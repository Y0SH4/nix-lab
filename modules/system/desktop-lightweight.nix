{ config, pkgs, ... }:

{
  # Pindahkan defaultSession ke services.displayManager (bukan services.xserver.displayManager)
  services.displayManager.defaultSession = "none+i3";

  services.xserver = {
    enable = true;

    displayManager = {
      lightdm = {
        enable = true;
        greeters.gtk = {
          enable = true;
          theme = {
            name = "Adwaita-dark";
            package = pkgs.gnome-themes-extra;
          };
        };
      };
      # defaultSession sudah dipindah ke atas
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };
    
    xkb = {
      layout = "us";
      variant = "";
    };
    
    desktopManager.xterm.enable = false;

    # Device section untuk GPU optimization
    deviceSection = ''
      Option "TearFree" "true"
      Option "AccelMethod" "glamor"
    '';
  };

  # Compositor (opsional, bisa diaktifkan jika diperlukan)
  services.picom = {
    enable = false;  # Set ke true jika ingin menggunakan compositor
    fade = true;
    fadeDelta = 5;
    shadow = false;
    backend = "xrender";
  };

  # Libinput untuk touchpad
  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      middleEmulation = true;
    };
  };
}
