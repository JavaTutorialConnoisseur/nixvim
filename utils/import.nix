{lib, ...} @ args: let
  pluginDir = ../plugins;
  configDir = ../config;

  importHelper =
    import ./import-helpers.nix
    {inherit lib args configDir pluginDir disabledFiles;};

  inherit (args) disabledFiles;
  inherit (importHelper) pluginImports configImports;

  imports = configImports ++ pluginImports;
in (
  # lib.traceValSeqNFn lib.id 10 {inherit imports;}
  {
    inherit imports;
    config.globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
  }
)
