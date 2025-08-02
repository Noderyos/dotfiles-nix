{ pkgs, ... }:
{
  home.file.wallpaper = {
    source = ./wallpaper.png;
    target = ".wallpaper";
  };
}
