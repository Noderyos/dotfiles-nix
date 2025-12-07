{ pkgs, ... }:

let
  radiosondePatched = pkgs.callPackage ./radiosonde { };

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
    buildInputs = (prev.buildInputs or [ ]) ++ [
      pkgs.rtaudio
    ];

    patches = (prev.patches or [ ]) ++ [
      ./add-radiosonde.patch
    ];

    postPatch = (prev.postPatch or "") + ''
      mkdir -p decoder_modules/sdrpp_radiosonde
      cp -rv ${radiosondePatched}/* decoder_modules/sdrpp_radiosonde/
      chmod -R u+rw decoder_modules/sdrpp_radiosonde
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
