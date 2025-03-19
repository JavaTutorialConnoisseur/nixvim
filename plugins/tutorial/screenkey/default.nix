{
  lib,
  pkgs,
  ...
}: {
  extra.packages = [(import ./package.nix {inherit lib pkgs;})];

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>hk";
      action = "<Cmd>Screenkey toggle<CR>";
      options.desc = "Screenkey";
    }
  ];
}
