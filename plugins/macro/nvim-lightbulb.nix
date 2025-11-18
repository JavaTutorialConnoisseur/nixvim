_: {
  opts = {
    enable = true;
    settings = {
      autocmd = {
        enabled = true;
        updatetime = 10;
      };

      float = {
        enabled = false;
        hl = "LightBulbFloatWin";
        text = " 💡 ";
        win_opts.border = "rounded";
      };

      line.enabled = false;
      number.enabled = false;

      sign = {
        enabled = false;
        hl = "LightBulbSign";
        text = "💡";
        lens_text = "🔎";
      };

      status_text = {
        enabled = false;
        text = " 💡 ";
      };

      virtual_text = {
        enabled = true;
        text = "💡";
        pos = "eol";
        hl = "LightBulbVirtualText";
        # hl_mode = "combine";
      };
    };
  };

  rootOpts.autoCmd = [
    {
      desc = "Set virtualtext bg highlight for lightbulb to 'none'.";
      callback.__raw = ''
        function()
          vim.cmd('hi LightBulbVirtualText guibg=none')
        end
      '';
      event = ["BufEnter" "BufWritePre"];
    }
  ];

  rootOpts.plugins.transparent.settings.extraGroups = [
    "LightBulbSign"
    "LightBulbVirtualText"
    "LightBulbFloatWin"
  ];
}
