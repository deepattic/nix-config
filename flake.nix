{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  # inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.disko.url = "github:nix-community/disko";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

  outputs =
    {
      nixpkgs,
      disko,
      ...
    }:
    {
      nixosConfigurations.generic = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          { nix.settings.experimental-features = ["nix-command" "flakes"]; }
          disko.nixosModules.disko
          ./configuration.nix
          ./hardware-configuration.nix
        ];
      };

};
}
