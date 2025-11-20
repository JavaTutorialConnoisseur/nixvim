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
        enabled = true;
        text = " 💡 ";
      };

      virtual_text = {
        enabled = false;
        text = "💡";
        pos = "eol";
        hl = "LightBulbVirtualText";
        # hl_mode = "combine";
      };
    };
  };

  root.plugins.transparent.settings.extraGroups = [
    "LightBulbSign"
    "LightBulbVirtualText"
    "LightBulbFloatWin"
  ];
}
