{
  lib,
  args,
  pluginDir,
  configDir,
  disabledFiles,
  ...
}: let
  inherit (lib) pipe;
  inherit (builtins) baseNameOf elem;

  getNixFiles = dir:
    lib.fileset.fileFilter ({
      name,
      type,
      hasExt,
      ...
    }:
      hasExt "nix" && type == "regular" && (! elem name disabledFiles))
    dir;

  importWithName = pluginPath: {
    plugin = import pluginPath args;
    name = pipe pluginPath [
      baseNameOf
      (lib.removeSuffix ".nix")
    ];
  };

  modifyPluginAttrset = {
    plugin,
    name,
  }: let
    inherit (lib) recursiveUpdate optionalAttrs pipe;

    pluginExtras = optionalAttrs (plugin ? extra) {
      extraConfigLua = plugin.extra.lua or "";
      extraConfigLuaPre = plugin.extra.luaPre or "";
      extraConfigVim = plugin.extra.vim or "";
      extraPlugins = plugin.extra.packages; # TODO: rename to extra.plugins
    };

    pluginOptions = optionalAttrs (plugin ? opts) {
      plugins.${name} = plugin.opts;
    };

    # TODO: rename to plugin.root
    pluginRoot = optionalAttrs (plugin ? rootOpts) plugin.rootOpts;
  in
    pipe pluginOptions [
      (recursiveUpdate pluginExtras)
      (recursiveUpdate pluginRoot)
    ];

  pluginFiles = pipe pluginDir [
    getNixFiles
    (lib.fileset.toList)
    (map importWithName)
    (map modifyPluginAttrset)
  ];
in {
  pluginImports = pluginFiles;
  configImports = lib.fileset.toList (getNixFiles configDir);
}
