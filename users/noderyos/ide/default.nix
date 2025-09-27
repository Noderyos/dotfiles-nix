{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.clion jetbrains.idea-community
    android-studio androidenv.androidPkgs.platform-tools
  ];
}
