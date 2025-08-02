{ pkgs, ... }:
{
  home.packages = with pkgs; [ polybar ];
  home.file.polybar_config = {
    source = ./config.ini;
    target = ".config/polybar/config.ini";
  };
}
