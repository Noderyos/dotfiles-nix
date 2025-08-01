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

  home.stateVersion = "25.05";
}
