_:

{
  opts.enable = true;

  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>td";
    options.desc = "Find TODO's";
    action = "<cmd>TodoTelescope<cr>";
  }];

  # NOTE: maybe add other todo things (there's a loclist one?)
}
