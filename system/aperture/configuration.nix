{
  config,
  lib,
  pkgs,
  ...
}:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "noderyos" ];

  services.usbmuxd.enable = true;

  powerManagement.powertop.enable = true;
  services = {
    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        STOP_CHARGE_THRESH_BAT0 = 99;
      };
    };
  };

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
