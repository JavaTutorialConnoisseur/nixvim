{ lib, ... }@args:

# plugins related to learning neovim or getting better at using it go here

let
  definitions = lib.attrNames (lib.filterAttrs (filename: kind:
    filename != "default.nix" && (kind == "regular" || kind == "directory"))
    (builtins.readDir ./.));
in lib.mkMerge (map (file:
  let
    pluginName = lib.elemAt (lib.splitString "." file) 0;
    plugin = import ./${file} args;
  in lib.mkMerge [
    (lib.optionalAttrs (plugin ? opts) { plugins.${pluginName} = plugin.opts; })
    (lib.optionalAttrs (plugin ? extra) {
      extraConfigLua = plugin.extra.config or "";
      extraPlugins = plugin.extra.packages;
    })
    (plugin.rootOpts or { })
  ]) definitions)
