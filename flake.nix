{
  description = "My NixOS configuration with i3wm and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    username = "bangyosh";
    hostname = "laptop";
  in
  {
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem{
        inherit system;
        specialArgs = {
          inherit inputs username hostname;
        };
        modules = [
          ./hosts/${hostname}/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
	      backupFileExtension = "backup";
              extraSpecialArgs = { inherit inputs username; };
              users.${username} = import ./users/${username}/home.nix;
            };
          }
        ];
      };
    };
  };
}
