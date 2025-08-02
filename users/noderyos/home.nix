{ config, pkgs, ... }:

{
  home.username = "noderyos";
  home.homeDirectory = "/home/noderyos";

  home.packages = with pkgs; [
    nix-output-monitor
    sdrpp
    obs-studio
    gpredict
    qbittorrent
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
  ];

  home.stateVersion = "25.05";
}
