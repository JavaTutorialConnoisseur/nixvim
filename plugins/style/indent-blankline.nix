_: let
  _catppuccin_colors = [
    ["Catppuccin1" "#c6a0f6"]
    ["Catppuccin2" "#8aadf4"]
    ["Catppuccin3" "#8bd5ca"]
    ["Catppuccin4" "#a6da95"]
    ["Catppuccin5" "#eed49f"]
    ["Catppuccin6" "#f5a97f"]
  ];
in {
  rootOpts.colorschemes.catppuccin.settings.integrations.indent_blankline =
    true;

  opts = {
    enable = true;

    settings = {
      indent = {
        highlight = ["Comment" "Type" "Constant" "Error"];
        char = "│";
      };

      scope = {
        enabled = true;
        show_start = false;
        show_end = false;
        highlight = "String";
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
