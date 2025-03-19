_: {
  opts = {
    enable = true;
    settings = {
      status_formatter = null;
      signs = {
        add.text = "│";
        change.text = "│";
        changedelete.text = "~";
        delete.text = "_";
        topdelete.text = "‾";
        untracked.text = "┆";
      };

      current_line_blame = false;
      current_line_blame_opts = {
        virt_text = true;
        virt_text_pos = "eol";
      };
      current_line_blame_formatter = " <author>, <author_time:%Y-%m-%d> - <summary>";

      numhl = true;
    };
  };

  rootOpts.plugins.transparent.settings.extra_groups = ["GitSignsAdd" "GitSignsChange" "GitSignsDelete"];

  rootOpts.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>i";
      group = "Git";
      icon = {
        icon = "󰮠 ";
        color = "yellow";
      };
      mode = "n";
    }
  ];

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>iB";
      options.desc = "Toggle line blame showing";
      action = "<cmd>Gitsigns toggle_current_line_blame<cr>";
    }

    {
      mode = "n";
      key = "<leader>ib";
      options.desc = "Show current line blame";
      action = "<cmd>Gitsigns blame_line<cr>";
    }

    {
      mode = "n";
      key = "<leader>iH";
      options.desc = "Preview current hunk inline";
      action = "<cmd>Gitsigns preview_hunk_inline<cr>";
    }

    {
      mode = "n";
      key = "<leader>ih";
      options.desc = "Preview current hunk";
      action = "<cmd>Gitsigns prev_hunk<cr>";
    }

    {
      mode = "n";
      key = "<leader>ih";
      options.desc = "Show current file's diffview";
      action = "<cmd>Gitsigns diffthis<cr>";
    }
  ];
}
