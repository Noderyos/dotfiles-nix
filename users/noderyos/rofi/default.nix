{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi ];
  home.file.rofi_config = {
    source = ./config.rasi;
    target = ".config/rofi/config.rasi";
  };
}
