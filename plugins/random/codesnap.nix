_: {
  opts = {
    enable = true;
    settings = {
      breadcrumbs_separator = "/";

      has_breadcrumbs = true;
      has_line_number = true;
      mac_window_bar = true;
      min_width = 40;

      # bg_x_padding = 20;
      # bg_y_padding = 20;
      # bg_theme = "grape";
      bg_padding = 0;

      # if this path doesn't exist, the thread panics and nvim crashes lmao
      save_path = "~/Pictures/Screenshots/";
      code_font_family = "JetBrainsMonoNL Nerd Font";
      title = "";
      watermark = "";
    };
  };

  # to do a session-temporary override for anything, do:
  # lua require('codesnap').setup({code_font_family = ...})
  # and subsequent mapping calls will respect the new setup
  rootOpts.keymaps = [
    {
      mode = "x";
      key = "<leader>pc";
      options.desc = "Pretty-print to clipboard";
      action = "<esc><cmd>CodeSnap<cr>";
    }

    {
      mode = "x";
      key = "<leader>ps";
      options.desc = "Pretty-print to ~/Pictures/Screenshots";
      action = "<esc><cmd>CodeSnapSave<cr>";
    }

    {
      mode = "x";
      key = "<leader>ph";
      options.desc = "Pretty-print highlighted to ~/Pictures/Screenshots";
      action = "<esc><cmd>CodeSnapSaveHighlight<cr>";
    }
  ];
}
