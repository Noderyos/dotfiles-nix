{
  config,
  lib,
  pkgs,
  ...
}:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "noderyos" ];

  powerManagement.cpuFreqGovernor = "conservative";
  services.usbmuxd.enable = true;

  hardware.pulseaudio.extraConfig = "
    load-module module-bluetooth-policy auto_switch=false
  ";

  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse
  ];
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "aperture";
}
