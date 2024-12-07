_:

{
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
      current_line_blame_formatter =
        " <author>, <author_time:%Y-%m-%d> - <summary>";

      numhl = true;
    };
  };

  # TODO: add a keybind for previewing blame (+ check out other cool gitsigns stuff)
}
