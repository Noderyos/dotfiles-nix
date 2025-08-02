{ pkgs, ... }:
{
  home.packages = with pkgs; [ fastfetch ];
  home.file = {
    ffetch_small_config = {
      source = ./small.jsonc;
      target = ".config/fastfetch/small.jsonc";
    };
    ffetch_defl_config = {
      source = ./config.jsonc;
      target = ".config/fastfetch/config.jsonc";
    };
  };
}
