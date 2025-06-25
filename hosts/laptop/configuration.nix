{ config, pkgs, inputs, username, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/desktop-lightweight.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.grub = {
		enable = true;
		device = "/dev/sda";
  };


  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    home-manager
    htop
    lshw
    inxi
  ];

#  fonts.packages = with pkgs; [
#    (nerd-fonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
#    fira-code
#    fira-code-symbols
#  ];

  services.xserver.videoDrivers = [ "radeon" "intel" ];

  hardware.graphics = {
   enable = true;
   enable32Bit = true;

   extraPackages = with pkgs; [
    intel-media-driver
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
   ];
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNON_ON_AC = "performance";
      CPU_SCALING_GOVERNON_ON_BAT = "powersave";
      START_CHARGER_THRESH_AC0 = 20;
      START_CHARGER_THRESH_BAT0 = 80;
      AHCI_RUNTIME_PM_ON_AC="auto";
      AHCI_RUNTIME_PM_ON_BAT="auto";
    };
  };

  services.thermald.enable = true;
  services.acpid.enable = true;

  system.stateVersion = "23.11";
}
