_: {
  opts = {
    enable = true;

    settings = {
      animation = true;
      highlight_alternate = true;

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

  # TODO: [later] un-hardcode these colors, try attaching catppuccin to this
  rootOpts.autoCmd = [{
    desc = "Set all tab bar highlights";
    callback.__raw = ''
      function()
        local function hi(group, guifg, guibg)
            vim.cmd(string.format('hi %s guifg=%s guibg=%s', group, guifg, guibg))
        end

        local function fg(group, color)
            vim.cmd(string.format('hi %s guifg=%s', group, color))
        end

        hi("BufferCurrent", "#373643", "#AF87FF")
        hi("BufferCurrentIcon", "#373643", "#AF87FF")
        hi("BufferCurrentMod", "#373643", "#AF87FF")

        hi("BufferCurrentSign", "#AF87FF", "none")
        hi("BufferCurrentSignRight", "#AF87FF", "none")

        hi("BufferInactive", "gray", "none")
        hi("BufferDefaultVisible", "#695199", "none")
      end
    '';
    event = [ "BufEnter" "BufWritePre" ];
  }];
}
