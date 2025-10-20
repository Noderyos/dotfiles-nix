{ pkgs, ... }:
{
  home.packages = with pkgs; [ picom ];
  home.file.picom_config = {
    source = ./picom.conf;
    target = ".config/picom/picom.conf";
  };
}
