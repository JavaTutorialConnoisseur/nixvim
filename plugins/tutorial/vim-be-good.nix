_: {
  opts.enable = true;

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>lv";
      options.desc = "Start vim-be-good to get good";
      action = "<cmd>VimBeGood<cr>";
    }
  ];
}
