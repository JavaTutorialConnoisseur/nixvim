{ lib, ... }@args:

let
  withLSP = args.withLSP or true;

  disabled_files = [ "haskell.nix" "scala.nix" ];
  filterDisabled = dir:
    lib.filterAttrs (filename: _: !(lib.elem filename disabled_files)) dir;

  definitions = lib.attrNames (filterDisabled (lib.filterAttrs (filename: kind:
    filename != "default.nix" && (kind == "regular" || kind == "directory")
    && (if filename == "lsp.nix" then withLSP else true))
    (builtins.readDir ./.)));
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
