_:

{
  opts = {
    enable = true;
    settings = { compact = 2; };
  };

  rootOpts.keymaps = [{
    key = "<leader>~";
    action = "<Cmd>TagbarToggle<CR>";
    options.desc = "Toggle tagbar";
  }];
}
