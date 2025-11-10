{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nix-output-monitor
    obs-studio
    sublime4
    gpredict
    qbittorrent
    vesktop
    satdump
    mullvad-vpn
    thunderbird
    python3
    p7zip
    lm_sensors nload htop
  ];

  imports = [
    ./chromium
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
