{ lib, pkgs, ... }:

{
  extra.packages = [ (import ./package.nix { inherit lib pkgs; }) ];

  # TODO: figure out how to make this not screw up tagbar
  rootOpts.extraConfigLua = ''
    require('ftFT').setup({
      keys = {"f", "t", "F", "T"},
      modes = {"n", "v"},
      hl_group = "ftFT",
      sight_hl_group = ""
    })
  '';
}

