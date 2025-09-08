{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "aperture";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  i18n.defaultLocale = "en_US.UTF-8";

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [];
    };
  };

  services.pipewire.enable = false;
  services.pulseaudio.enable = true;

  programs.zsh.enable = true;

  hardware = {
      rtl-sdr.enable = true;
      hackrf.enable = true;
  };

  users.users.noderyos = {
   isNormalUser = true;
    extraGroups = [ "wheel" "plugdev" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    wget neovim git
  ];

  system.stateVersion = "25.05";
}

