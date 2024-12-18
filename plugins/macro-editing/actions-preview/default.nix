{ pkgs, ... }:

{
  extra.packages = [ pkgs.vimPlugins.actions-preview-nvim ];

  rootOpts.plugins.which-key.settings.spec = [{
    mode = "n";
    __unkeyed-1 = "<leader>ca";
    __unkeyed-2 = "<cmd>lua require('actions-preview').code_actions()<cr>";
    desc = "Preview code actions";
    icon = {
      icon = " ";
      color = "purple";
    };
  }];
}
