{
  pkgs,
}:

pkgs.pkgs.stdenv.mkDerivation rec {
  pname = "sdrpp_radiosonde";
  git_date = "2025-08-15";
  version = "0.10";

  src = pkgs.fetchFromGitHub {
    owner = "dbdexter-dev";
    repo = "sdrpp_radiosonde";
    rev = "8317ba854d1a5d8903c00268121cf2115f1cbc32";
    hash = "sha256-m3/RF2Zx772KjPl2v95Ohrr9CptAPnIaOVxrUFLZhkY=";  
    fetchSubmodules = true;
  };

  patches = [ patches/radiosonde.patch ];

  installPhase = ''
    mkdir -p $out
    cp -r . $out/
  '';
  dontStrip = true;
  meta = with pkgs.lib; {
    description = "SDR++ radiosonde module";
    homepage = "https://github.com/dbdexter-dev/sdrpp_radiosonde";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
  };
}
