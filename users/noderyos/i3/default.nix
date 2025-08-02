{ pkgs, ... }:
{
  home.packages = with pkgs; [ feh ];
  home.file.i3_config = {
    source = ./config;
    target = ".config/i3/config";
  };
}
