_: {
  opts = {
    enable = true;
    settings = {
      max_time = 1500;
      max_count = 3;
      restriction_mode = "hint";

      # I don't use it anyway, and when I do it's for terminal scroll which I
      # want enabled
      disable_mouse = false;
      disabled_filetypes = [
        "neotest-output"
        "neotest-summary"
        "neotest-output-panel"
        "dapui_stacks"
        "dapui_breakpoints"
        "dapui_watches"
        "dapui_scopes"
        "Navbuddy"
        "dbui"

        "neo-tree"
        "neo-tree-popup"
        "neo-tree-preview"

        "vimtex-toc"
        "qf"
        "netrw"
        "lazy"
        "mason"
      ];
      hint = false;
    };
  };

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>ht";
      action = "<Cmd>Hardtime toggle<CR>";
      options.desc = "Hardtime";
    }
  ];
}
