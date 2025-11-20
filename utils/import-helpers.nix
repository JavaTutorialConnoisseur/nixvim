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
      extraPlugins = plugin.extra.plugins;
    };

    pluginOptions = optionalAttrs (plugin ? opts) {
      plugins.${name} = plugin.opts;
    };

    pluginRoot = optionalAttrs (plugin ? root) plugin.root;
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
