_:

# FIXME: check why this doesn't show catppuccin colors
{
  rootOpts.colorschemes.catppuccin.settings.integrations.indent_blankline =
    true;

  opts = {
    enable = true;

    settings = {
      indent.char = "▏";

      scope = {
        enabled = true;
        show_start = true;
        show_end = false;
      };

      exclude.filetypes = [
        "alpha"
        "dashboard"
        "lazy"
        "mason"
        "neo-tree"
        "NvimTree"
        "neogitstatus"
        "notify"
        "startify"
        "toggleterm"
        "Trouble"
      ];
    };
  };
}
