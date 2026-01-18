{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.clion
    jetbrains.idea-oss
    jetbrains.rider
    android-studio
    androidenv.androidPkgs.platform-tools
  ];
}
