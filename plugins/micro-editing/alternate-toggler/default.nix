{ lib, pkgs, ... }:

{
  extra.packages = [ (import ./package.nix { inherit lib pkgs; }) ];

  rootOpts.plugins.which-key.settings.spec = [{
    __unkeyed-1 = "<leader>a";
    icon = {
      icon = " ";
      color = "purple";
    };
  }];

  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>a";
    action = "<Cmd>ToggleAlternate<CR>";
    options.desc = "Toggle alternate";
  }];
}

