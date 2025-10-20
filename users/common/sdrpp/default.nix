{ pkgs, ... }:

let
  radiosondePatched = pkgs.callPackage ./radiosonde {};

  radiosonde_decoder = true;

  baseSdrpp = pkgs.sdrpp.override {
    airspy_source = true;
    airspyhf_source = true;
    bladerf_source = true;
    file_source = true;
    hackrf_source = true;
    limesdr_source = true;
    perseus_source = false;
    plutosdr_source = true;
    rfspace_source = true;
    rtl_sdr_source = true;
    rtl_tcp_source = true;
    sdrplay_source = false; # Unfree software
    soapy_source = true;
    spyserver_source = true;
    usrp_source = true;

    audio_sink = true;
    network_sink = true;
    portaudio_sink = false;

    falcon9_decoder = false;
    m17_decoder = true;
    meteor_demodulator = true;
    radio = true;
    weather_sat_decoder = false; # missing some dsp/pll.h

    discord_presence = true;
    frequency_manager = true;
    recorder = true;
    rigctl_server = true;
    scanner = true;

  };

  mySdrpp = baseSdrpp.overrideAttrs (prev: rec {
    git_hash = "f67fa0c66c9e24b822e6f66e2fd840cda92445ad";
    git_date = "2025-07-20";
    version = "1.2.1-unstable-${git_date}";

    src = pkgs.fetchFromGitHub {
      owner = "AlexandreRouma";
      repo = "SDRPlusPlus";
      rev = git_hash;
      hash = "sha256-fwOCH6CPtEzBIDmbSq9s2NbwxBq73Fka7USAghkytR4=";
    };

    buildInputs = (prev.buildInputs or []) ++ [
      pkgs.rtaudio
    ];

    patches = (prev.patches or []) ++ [
      ./patches/add-radiosonde.patch
    ];

    postPatch = (prev.postPatch or "") + ''
      mkdir -p decoder_modules/sdrpp_radiosonde
      cp -rv ${radiosondePatched}/* decoder_modules/sdrpp_radiosonde/
      chmod -R u+rw decoder_modules/sdrpp_radiosonde
      substituteInPlace core/src/version.h --replace "1.2.1" "$version"
    '';

    cmakeFlags = prev.cmakeFlags ++ [
      (pkgs.lib.cmakeFeature "CMAKE_POLICY_VERSION_MINIMUM" "3.5")
      (pkgs.lib.cmakeBool "OPT_BUILD_RADIOSONDE_DECODER" radiosonde_decoder)
    ];
  });
in
{
  home.packages = [ mySdrpp ];
}

