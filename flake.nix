{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, comin }@attrs: {
    nixosConfigurations.inf = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./hosts/inf/configuration.nix
        comin.nixosModules.comin
        ({...}: {
          services.comin = {
            enable = true;
            remotes = [{
              name = "origin";
              url = "https://github.com/tshelter/infra.git";
              branches.main.name = "master";
            }];
          };
        })
      ];
    };
  };
}
