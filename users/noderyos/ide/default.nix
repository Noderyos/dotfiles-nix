{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.clion
    jetbrains.idea-community
    jetbrains.rider
    android-studio
    androidenv.androidPkgs.platform-tools
  ];
}
