# Adapted from nixpkgs sdrpp derivation
{
  pkgs,

  # Sources
  airspy_source ? true,
  airspyhf_source ? true,
  bladerf_source ? true,
  file_source ? true,
  hackrf_source ? true,
  limesdr_source ? true,
  perseus_source ? false,
  plutosdr_source ? true,
  rfspace_source ? true,
  rtl_sdr_source ? true,
  rtl_tcp_source ? true,
  sdrplay_source ? false,
  soapy_source ? true,
  spyserver_source ? true,
  usrp_source ? false,

  # Sinks
  audio_sink ? true,
  network_sink ? true,
  portaudio_sink ? false,

  # Decoders
  falcon9_decoder ? false,
  m17_decoder ? true,
  meteor_demodulator ? true,
  radio ? true,
  weather_sat_decoder ? false,

  # Misc
  discord_presence ? true,
  frequency_manager ? true,
  recorder ? true,
  rigctl_server ? true,
  scanner ? true,
}:

pkgs.pkgs.stdenv.mkDerivation rec {
  pname = "sdrpp";

  git_hash = "f67fa0c66c9e24b822e6f66e2fd840cda92445ad";
  git_date = "2025-07-20";
  version = "1.2.1-unstable-" + git_date;

  src = pkgs.fetchFromGitHub {
    owner = "AlexandreRouma";
    repo = "SDRPlusPlus";
    rev = git_hash;
    hash = "sha256-fwOCH6CPtEzBIDmbSq9s2NbwxBq73Fka7USAghkytR4=";
  };

  patches = [ ./sdrpp.patch ];

  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace "/usr/share" "share" \
      --replace "set(CMAKE_INSTALL_PREFIX" "#set(CMAKE_INSTALL_PREFIX"
    substituteInPlace decoder_modules/m17_decoder/src/m17dsp.h \
      --replace "codec2.h" "codec2/codec2.h"
    # Since the __TIME_ and __DATE__ is canonicalized in the build,
    # use our qualified version shown in the programs window title.
    substituteInPlace core/src/version.h --replace "1.2.1" "$version"
  '';

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.pkg-config
  ];

  buildInputs = [
    pkgs.glfw
    pkgs.glew
    pkgs.fftwFloat
    pkgs.volk
    pkgs.zstd
  ]
  ++ pkgs.lib.optional pkgs.stdenv.hostPlatform.isLinux pkgs.xorg.libX11
  ++ pkgs.lib.optional airspy_source pkgs.airspy
  ++ pkgs.lib.optional airspyhf_source pkgs.airspyhf
  ++ pkgs.lib.optional bladerf_source pkgs.libbladeRF
  ++ pkgs.lib.optional hackrf_source pkgs.hackrf
  ++ pkgs.lib.optional limesdr_source pkgs.limesuite
  ++ pkgs.lib.optionals rtl_sdr_source [
    pkgs.rtl-sdr-osmocom
    pkgs.libusb1
  ]
  ++ pkgs.lib.optional sdrplay_source pkgs.sdrplay
  ++ pkgs.lib.optional soapy_source pkgs.soapysdr-with-plugins
  ++ pkgs.lib.optionals plutosdr_source [
    pkgs.libiio
    pkgs.libad9361
  ]
  ++ pkgs.lib.optionals usrp_source [
    pkgs.uhd
    pkgs.boost
  ]
  ++ pkgs.lib.optional audio_sink pkgs.rtaudio
  ++ pkgs.lib.optional portaudio_sink pkgs.portaudio
  ++ pkgs.lib.optional m17_decoder pkgs.codec2;

  cmakeFlags = [
    # Sources
    (pkgs.lib.cmakeBool "OPT_BUILD_AIRSPYHF_SOURCE" airspyhf_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_AIRSPY_SOURCE" airspy_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_BLADERF_SOURCE" bladerf_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_FILE_SOURCE" file_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_HACKRF_SOURCE" hackrf_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_LIMESDR_SOURCE" limesdr_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_PERSEUS_SOURCE" perseus_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_PLUTOSDR_SOURCE" plutosdr_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_RFSPACE_SOURCE" rfspace_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_RTL_SDR_SOURCE" rtl_sdr_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_RTL_TCP_SOURCE" rtl_tcp_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_SDRPLAY_SOURCE" sdrplay_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_SOAPY_SOURCE" soapy_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_SPYSERVER_SOURCE" spyserver_source)
    (pkgs.lib.cmakeBool "OPT_BUILD_USRP_SOURCE" usrp_source)

    # Sinks
    (pkgs.lib.cmakeBool "OPT_BUILD_AUDIO_SINK" audio_sink)
    (pkgs.lib.cmakeBool "OPT_BUILD_NETWORK_SINK" network_sink)
    (pkgs.lib.cmakeBool "OPT_BUILD_NEW_PORTAUDIO_SINK" portaudio_sink)

    # Decoders
    (pkgs.lib.cmakeBool "OPT_BUILD_FALCON9_DECODER" falcon9_decoder)
    (pkgs.lib.cmakeBool "OPT_BUILD_M17_DECODER" m17_decoder)
    (pkgs.lib.cmakeBool "OPT_BUILD_METEOR_DEMODULATOR" meteor_demodulator)
    (pkgs.lib.cmakeBool "OPT_BUILD_RADIO" radio)
    (pkgs.lib.cmakeBool "OPT_BUILD_WEATHER_SAT_DECODER" weather_sat_decoder)

    # Misc
    (pkgs.lib.cmakeBool "OPT_BUILD_DISCORD_PRESENCE" discord_presence)
    (pkgs.lib.cmakeBool "OPT_BUILD_FREQUENCY_MANAGER" frequency_manager)
    (pkgs.lib.cmakeBool "OPT_BUILD_RECORDER" recorder)
    (pkgs.lib.cmakeBool "OPT_BUILD_RIGCTL_SERVER" rigctl_server)
    (pkgs.lib.cmakeBool "OPT_BUILD_SCANNER" scanner)
  ];

  env.NIX_CFLAGS_COMPILE = "-fpermissive";

  hardeningDisable = pkgs.lib.optional pkgs.stdenv.cc.isClang "format";

  meta = with pkgs.lib; {
    description = "Cross-Platform SDR Software";
    homepage = "https://github.com/AlexandreRouma/SDRPlusPlus";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
    mainProgram = "sdrpp";
  };
}
