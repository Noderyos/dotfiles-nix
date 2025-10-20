{ pkgs, ... }:
{
    programs.chromium = {
      enable = true;
      extensions = [
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
	"bhchdcejhohfmigjafbampogmaanbfkg" # User-Agent switcher
	"cjpalhdlnbpafiamejdnhcphjbkeiagm" # Adblock
	"eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark reader
      ];
    };
}
