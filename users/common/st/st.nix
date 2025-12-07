{
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation (finalAttrs: {
  pname = "luke-st";
  version = "0.8.5-62ebf67";

  src = pkgs.fetchFromGitHub {
    owner = "LukeSmithxyz";
    repo = "st";
    rev = "62ebf67";
    hash = "sha256-L4FKnK4k2oImuRxlapQckydpAAyivwASeJixTj+iFrM=";
  };

  nativeBuildInputs = [
    pkgs.xorg.libX11
    pkgs.xorg.libXft
    pkgs.pkg-config
    pkgs.harfbuzz
  ];

  installPhase = ''
    install -Dm755 st $out/bin/st
    install -Dm755 st-copyout $out/bin/st-copyout
    install -Dm755 st-urlhandler $out/bin/st-urlhandler
  '';
})
