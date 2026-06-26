{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.clion
    jetbrains.idea-oss
    android-studio
    androidenv.androidPkgs.platform-tools
  ];
}
