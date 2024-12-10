{
  description = "Trying out nixvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-formatter-pack = {
      url = "github:Gerschtli/nix-formatter-pack";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixvim, nix-formatter-pack, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in {
      formatter = forAllSystems (system:
        nix-formatter-pack.lib.mkFormatter {
          pkgs = nixpkgs.legacyPackages.${system};

          config.tools = {
            deadnix.enable = true;
            nixpkgs-fmt.enable = true;
            statix.enable = true;
          };
        });

      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };

          # filterDefinitions = lib:
          #   lib.filterAttrs (filename: kind:
          #     filename != "default.nix"
          #     && (kind == "regular" || kind == "directory"));
          #
          # getDefinitions = lib: dir:
          #   lib.attrNames ((filterDefinitions lib) (builtins.readDir dir));
          #
          # getPlugins = dir: lib: args:
          #   lib.mkMerge (map (file:
          #     let
          #       pluginName = lib.elemAt (lib.splitString "." file) 0;
          #       plugin = import ./plugins/ui/${file} args;
          #     in lib.mkMerge [
          #       (lib.optionalAttrs (plugin ? opts) {
          #         plugins.${pluginName} = plugin.opts;
          #       })
          #       (lib.optionalAttrs (plugin ? extra) {
          #         extraConfigLua = plugin.extra.config or "";
          #         extraPlugins = plugin.extra.packages;
          #       })
          #       (plugin.rootOpts or { })
          #     ]) (getDefinitions lib dir));
          #
          mkNixvim = specialArgs:
            nixvim.legacyPackages.${system}.makeNixvimWithModule {
              inherit pkgs;

              module = ./.;

              extraSpecialArgs = specialArgs // { inherit pkgs; };
            };
        in {
          default = mkNixvim { };
          lite = mkNixvim { withLSP = false; };
        });
    };
}
