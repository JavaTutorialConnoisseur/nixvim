{themeColors, ...}: let
  colors = {
    base = themeColors.normal;
    darker = themeColors.replace;
    gray = "373643";
  };
in {
  opts = {
    enable = true;

    settings = {
      animation = true;
      highlight_alternate = true;
      auto_hide = 1;

      icons = {
        filetype = {
          custom_colors = true;
          enabled = true;
        };

        separator.left = "";
        separator.right = "";

        alternate = {
          separator.left = "";
          separator.right = "";
        };
        inactive = {
          separator.left = "";
          separator.right = "";
        };
        visible = {
          separator.left = "";
          separator.right = "";
        };
        separator_at_end = false;
      };
    };
  };

  rootOpts.autoCmd = [
    {
      desc = "Set all tab bar highlights";
      callback.__raw = ''
        function()
          local function hi(group, guifg, guibg)
              vim.cmd(string.format('hi %s guifg=%s guibg=%s',
                group, guifg, guibg))
          end

          local function fg(group, color)
              vim.cmd(string.format('hi %s guifg=%s', group, color))
          end

          local c1 = "#${colors.gray}"
          local c2 = "#${colors.base}"
          local c3 = "#${colors.darker}"

          hi("BufferCurrent", c1, c2)
          hi("BufferCurrentIcon", c1, c2)
          hi("BufferCurrentMod", c1, c2)

          hi("BufferCurrentSign", c2, "none")
          hi("BufferCurrentSignRight", c2, "none")

          hi("BufferAlternate", c2, "none")
          hi("BufferInactive", "#A4ABC4", "none")
          hi("BufferDefaultVisible", c2, "none")
          hi("BufferVisible", c2, "none")
        end
      '';
      event = ["BufEnter" "BufWritePre"];
    }
  ];
}
