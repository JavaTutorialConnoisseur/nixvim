{
  description = "Trying out nixvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixvim, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-linux"
        "x86_64-darwin"
        "i686-linux"
      ];
    in {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          disabledLangs = [ "scala.nix" "haskell.nix" ];

          mkNixvim = specialArgs:
            nixvim.legacyPackages.${system}.makeNixvimWithModule {
              inherit pkgs;
              extraSpecialArgs = specialArgs // { inherit pkgs; };
              module = ./.;
            };

          defaultFn = { lib, dir, args, ignore ? [ ] }:
            let
              shouldRemain = x: !(builtins.elem x ignore);
              definitions = lib.filter shouldRemain (lib.attrNames
                (lib.filterAttrs (filename: kind:
                  filename != "default.nix"
                  && (kind == "regular" || kind == "directory"))
                  (builtins.readDir dir)));
            in lib.mkMerge (map (file:
              let
                pluginName = lib.elemAt (lib.splitString "." file) 0;
                plugin = import (dir + "/${file}") args;
              in lib.mkMerge [
                (lib.optionalAttrs (plugin ? opts) {
                  plugins.${pluginName} = plugin.opts;
                })
                (lib.optionalAttrs (plugin ? extra) {
                  extraConfigLua = plugin.extra.config or "";
                  extraPlugins = plugin.extra.packages;
                })
                (plugin.rootOpts or { })
              ]) definitions);
        in {
          default = mkNixvim {
            disabledLangs = disabledLangs;
            defaultFn = defaultFn;
          };
        });
    };
}
