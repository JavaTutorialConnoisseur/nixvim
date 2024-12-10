_:

{
  opts.enable = true;

  rootOpts.plugins.transparent.settings.extra_groups = [ "ZenBg" ];
  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>z";
    action = "<Cmd>ZenMode<CR>";
    options.desc = "Toggle zen mode";
  }];
}
