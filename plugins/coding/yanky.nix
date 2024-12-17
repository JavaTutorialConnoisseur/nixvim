_:

{
  opts = {
    enable = true;
    enableTelescope = true;
  };

  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>gy";
    action = "<cmd>Telescope yank_history<cr>";
    options.desc = "Find YANK selections";
  }];
}
