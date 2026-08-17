{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, home-manager, nixpkgs, nixpkgs-unstable, ... }:
    let
      system = "x86_64-linux";
      # The one username line to change if this isn't your machine.
      # bootstrap.sh offers to rewrite this for you if your Linux username differs.
      user = "marcos";
      unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit user unstable; };
        modules = [
          ./home.nix
        ];
      };
    };
}
