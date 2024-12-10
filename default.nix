{ lib, ... }:

let
  plugin_dir = "plugins";
  plugin_imports = map (fd: ./${plugin_dir}/${fd}) plugin_folders;
  plugin_folders = lib.attrNames (lib.filterAttrs (_: kind: kind == "directory")
    (builtins.readDir ./${plugin_dir}));
in {
  imports = [ ./config ./${plugin_dir} ] ++ plugin_imports;

  config = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    viAlias = true;
    vimAlias = true;
  };
}
