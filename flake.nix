{
  description = "Noderyos's dotfiles flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: 
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      aperture = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/aperture/configuration.nix
          ./system/common.nix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
	          useUserPackages = true;
	          users.noderyos = ./users/noderyos/home.nix;
	          users.streamer = ./users/streamer/home.nix;
	        };
	      }
        ];
      };
    };
  };
}
