{
  lib,
  themeColors,
  ...
}: let
  definitions = lib.attrNames (lib.filterAttrs (filename: kind:
    filename != "default.nix" && (kind == "regular" || kind == "directory"))
  (builtins.readDir ./.));

  imports = map (file: let
    done = import ./${file};
  in
    if builtins.isFunction done
    then done {inherit themeColors;}
    else done)
  definitions;
in
  lib.mkMerge imports
