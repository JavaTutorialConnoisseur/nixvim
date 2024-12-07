_:

{
  opts = let
    colors = {
      blue = "#80a0ff";
      cyan = "#79dac8";
      none = "None";
      white = "#D6D6FE";
      red = "#ff5189";
      violet = "#AF87FF";
      grey = "#303030";
      black = "#1C1C1C";
      dark = "#80807F";
    };

    # TODO: [later] make this auto-attach to selected `theme`
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
    enable = true;

    # # (if need be, TRANSPARENT can be used for theme-ing)
    # rootOpts = let
    #   allLineElems = [ "a" "b" "c" "x" "y" "z" ];
    #   allGitMods = [ "added" "modified" "removed" ];
    #   allModes = [
    #     "command"
    #     "inactive"
    #     "active"
    #     "insert"
    #     "normal"
    #     "replace"
    #     "terminal"
    #     "visual"
    #   ];
    # in {
    #   plugins.transparent.settings.extra_groups =
    #     (map (el: "lualine_${el}_inactive") allLineElems)
    #     ++ (map (el: "lualine_c_${el}") allModes)
    #     ++ (map (el: "lualine_x_${el}") allModes) ++ builtins.concatLists
    #     (map (m: map (g: "lualine_c_diff_${g}_${m}") allGitMods) allModes);
    # };

    settings = {
      options = {
        theme = curr_theme;
        component_separators = "|";
        section_separators = {
          left = "";
          right = "";
        };
      };

      sections = {
        lualine_b = [ "filename" "branch" ];
        lualine_c = [ "diff" ];
        lualine_z = [ "location" ];
        lualine_y = [ "filetype" "progress" ];
        lualine_x = [
          "lsp_progress"
          {
            # WARN: if cursor blinks, this could be the reason
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
