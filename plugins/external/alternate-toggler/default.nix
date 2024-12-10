{ lib, pkgs, ... }:

{
  extra.packages = [ (import ./package.nix { inherit lib pkgs; }) ];

  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>a";
    action = "<Cmd>ToggleAlternate<CR>";
    options.desc = "Toggle alternate";
  }];
}

