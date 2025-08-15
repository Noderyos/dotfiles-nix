{ pkgs, ... }:
{
    programs.chromium = {
      enable = true;
      extensions = [
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
	"bhchdcejhohfmigjafbampogmaanbfkg" # User-Agent switcher
	"bgnkhhnnamicmpeenaelnjfhikgbkllg" # Adblock
	"eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark reader
      ];
    };
}
