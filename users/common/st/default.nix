{ pkgs, ... }:
{
  home.packages = with pkgs; [ (callPackage ./st.nix { }) ];
}
