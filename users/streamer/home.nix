{ config, pkgs, ... }:

{
  home.username = "streamer";
  home.homeDirectory = "/home/streamer";

  home.packages = with pkgs; [ ];

  imports = [
    ../common
    ./ide
    ./i3
  ];

  home.stateVersion = "25.05";
}
