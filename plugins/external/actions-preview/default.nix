{ pkgs, ... }:

{
  extra.packages = [ pkgs.vimPlugins.actions-preview-nvim ];

  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>ca";
    action = "<cmd>lua require('actions-preview').code_actions()<cr>";
    options.desc = "Preview code actions";
  }];
}
