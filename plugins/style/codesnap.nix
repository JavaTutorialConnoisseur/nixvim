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

      save_path = "~/Pictures/Screenshots/";
      title = "";
      watermark = "";
    };
  };

  rootOpts.keymaps = [
    # TODO: maybe add map for saving w/ specified FONT, or settings otherwise?
    # cmd would be: 
    # lua local x = require('codesnap'); x.setup(...); x.copy_into_clipboard();
    {
      mode = "x";
      key = "<leader>pc";
      options.desc = "Pretty-print to clipboard";
      action = "<cmd>CodeSnap<cr>";
    }

    {
      mode = "x";
      key = "<leader>ps";
      options.desc = "Pretty-print to ~/Pictures/Screenshots";
      action = "<cmd>CodeSnapSave<cr>";
    }

    {
      mode = "x";
      key = "<leader>ph";
      options.desc = "Pretty-print highlighted to ~/Pictures/Screenshots";
      action = "<cmd>CodeSnapSaveHighlight<cr>";
    }
  ];
}
