{ lib, pkgs, ... }:

{
  extra.packages = [ (import ./package.nix { inherit lib pkgs; }) ];

  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>ta";
    action = "<Cmd>ToggleAlternate<CR>";
    options.desc = "Toggle alternate";
  }];
}

