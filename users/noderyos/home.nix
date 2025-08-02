{ config, pkgs, ... }:

{
  home.username = "noderyos";
  home.homeDirectory = "/home/noderyos";

  home.packages = with pkgs; [
    nix-output-monitor
    obs-studio
    gpredict
    qbittorrent
    vesktop
    chromium
  ];

  imports = [
    ./i3
    ./picom
    ./rofi
    ./polybar
    ./fastfetch
    ./nvim
    ./zsh
    ./wallpaper
    ./xresources
    ./st
    ./sdrpp
  ];

  home.stateVersion = "25.05";
}
