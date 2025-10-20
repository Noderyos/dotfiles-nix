{ pkgs, ... }:
{
  home.packages = with pkgs; [ feh brightnessctl networkmanagerapplet flameshot xfce.thunar ];
  home.file.i3_config = {
    source = ./config;
    target = ".config/i3/config";
  };
}
