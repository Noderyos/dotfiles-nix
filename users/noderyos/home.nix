{ config, pkgs, ... }:

{
  home.username = "noderyos";
  home.homeDirectory = "/home/noderyos";

  home.packages = with pkgs; [ ];

  imports = [
    ../common
    ./ide
    ./i3
  ];

  home.stateVersion = "25.05";
}
