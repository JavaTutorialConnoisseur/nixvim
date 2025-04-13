{
  lib,
  dir,
  args,
  ignore ? [],
}: let
  shouldRemain = x: !(builtins.elem x ignore);

  definitions = lib.filter shouldRemain (lib.attrNames
    (lib.filterAttrs (filename: kind:
      filename
      != "default.nix"
      && (kind == "regular" || kind == "directory"))
    (builtins.readDir dir)));
in
  lib.mkMerge (map (file: let
    pluginName = lib.elemAt (lib.splitString "." file) 0;
    plugin = import (dir + "/${file}") args;
  in
    lib.mkMerge [
      (lib.optionalAttrs (plugin ? opts) {
        plugins.${pluginName} = plugin.opts;
      })
      (lib.optionalAttrs (plugin ? extra) {
        extraConfigLua = plugin.extra.config or "";
        extraPlugins = plugin.extra.packages;
      })
      (plugin.rootOpts or {})
    ])
  definitions)
