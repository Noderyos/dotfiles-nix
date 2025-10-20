{ config, lib, pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "noderyos" ];

  powerManagement.cpuFreqGovernor = "conservative";
  
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "aperture";
}

