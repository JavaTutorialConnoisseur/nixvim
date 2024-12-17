_:

{
  opts = {
    enable = true;
    settings = {
      max_time = 1500;
      max_count = 3;

      # I don't use it anyway, and when I do it's for terminal scroll which I want enabled
      disable_mouse = false;
      disabled_filetypes = [
        "Navbuddy"
        "dbui"
        "neo-tree"
        "vimtex-toc"
        "qf"
        "netrw"
        "NvimTree"
        "lazy"
        "mason"
      ];
      hint = false;
    };
  };

  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>ht";
    action = "<Cmd>Hardtime toggle<CR>";
    options.desc = "Toggle Hardtime";
  }];
}
