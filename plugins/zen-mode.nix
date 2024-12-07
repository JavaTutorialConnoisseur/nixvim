_:

# TODO: [later] add window bg shade diff (+ add transparency)
{
  opts.enable = true;

  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>z";
    action = "<Cmd>ZenMode<CR>";
    options.desc = "Toggle zen mode";
  }];
}
