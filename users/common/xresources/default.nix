{ pkgs, ... }:
{
  home.file.xresources = {
    source = ./.Xresources;
    target = ".Xresources";
  };
}
