{
  description = "Full nixvim config of Parrydog^{TM}";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixvim,
    ...
  }: let
    defaults = import ./utils/default-customize.nix;
    inherit (defaults) disabledFiles defTheme pullTheme;

    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-linux"
      "x86_64-darwin"
    ];
  in {
    nixosModules.default = {
      config,
      lib,
      ...
    }: {
      imports = [./modules.nix];
      config = with config.programs.nixvim;
        lib.mkIf enable {
          environment.systemPackages = [package];
        };
    };

    packages = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};

      mkNixvim = {
        theme,
        specialArgs,
      }:
        nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          extraSpecialArgs = specialArgs // (pullTheme theme) // {inherit pkgs;};
          module = ./utils/import.nix;
        };

      mkConfigurable = {
        theme ? defTheme,
        specialArgs ? {
          inherit disabledFiles;
          sessionVars = null;
        },
      }:
        mkNixvim {inherit theme specialArgs;};
    in {
      default = mkConfigurable {};
      configurable = mkConfigurable;
    });
  };
}
