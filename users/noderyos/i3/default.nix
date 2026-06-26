{ pkgs, ... }:
{
  home.packages = with pkgs; [
    feh
    brightnessctl
    pulseaudio
    networkmanagerapplet
    flameshot
    thunar
  ];
  home.file.i3_config = {
    source = ./config;
    target = ".config/i3/config";
  };
}
