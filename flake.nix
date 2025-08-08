{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  # outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, plasma-manager, ... }@inputs: {
  outputs = { self, nixpkgs, chaotic, nixpkgs-unstable, home-manager, plasma-manager, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # {
        #   nixpkgs.overlays = [
        #     (final: prev: {
        #       unstable = import nixpkgs-unstable {
        #         inherit prev;
        #         system = prev.system;
        #         config.allowUnfree = true;
        #       };
        #     })
        #   ];
        # }
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry

        # make home-manager as a module of nixos
        # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.user = import ./home.nix;
          home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        }
      ];
    };
  };
}
