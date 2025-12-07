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

  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse
  ];
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "aperture";
}
