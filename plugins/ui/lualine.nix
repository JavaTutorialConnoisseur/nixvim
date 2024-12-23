{ themeColors, ... }:

let
  colors = {
    blue = themeColors.insert;
    cyan = themeColors.visual;
    violet = themeColors.normal;
    red = themeColors.replace;

    white = "#D6D6FE";
    grey = "#303030";
    black = "#1C1C1C";
    dark = "#80807F";
    none = "None";
  };

  curr_theme = {
    normal.a.fg = colors.black;
    normal.a.bg = colors.violet;

    normal.b.fg = colors.white;
    normal.b.bg = colors.grey;

    normal.c.fg = colors.dark;
    normal.c.bg = colors.none;

    insert.a.fg = colors.black;
    insert.a.bg = colors.blue;

    visual.a.fg = colors.black;
    visual.a.bg = colors.cyan;

    replace.a.fg = colors.black;
    replace.a.bg = colors.red;

    inactive.a.fg = colors.grey;
    inactive.a.bg = colors.none;
    inactive.b.fg = colors.grey;
    inactive.b.bg = colors.none;
    inactive.c.fg = colors.none;
    inactive.c.bg = colors.none;
  };
in {
  opts = {
    enable = true;

    settings = {
      options = {
        theme = curr_theme;
        component_separators = "|";
        section_separators = {
          left = "";
          right = "";
        };
        disabled_filetypes = [
          "dapui_stacks"
          "dapui_breakpoints"
          "dapui_watches"
          "dapui_scopes"
          "neotest-output"
          "neotest-summary"
          "neotest-output-panel"
          "vimtex-toc"
          "alpha"
          "neo-tree"
        ];
      };

      sections = {
        lualine_b = [ "filename" "branch" ];
        lualine_c = [ "diff" ];
        lualine_z = [ "location" ];
        lualine_y = [ "filetype" "progress" ];
        lualine_x = [
          "lsp_progress"
          {
            __raw = ''
              function()
                  local count = vim.fn.wordcount().visual_words
                  if not count then return "" end
                  return tostring(count) .. " words selected"
              end
            '';
          }
        ];
      };

      extensions = [ "fzf" ];
    };
  };
}
