_:

{
  opts = {
    enable = true;
    settings = {
      autocmd = {
        enabled = true;
        updatetime = 1000;
      };

      float = {
        enabled = false;
        hl = "LightBulbFloatWin";
        text = " 󰌶 ";
        win_opts = { border = "rounded"; };
      };

      line.enabled = false;
      number.enabled = false;

      sign = {
        enabled = true;
        hl = "LightBulbSign";
        text = "💡";
        lens_text = "🔎";
      };

      status_text = {
        enabled = false;
        text = " 󰌶 ";
      };
      virtual_text = {
        enabled = false;
        text = "󰌶";
      };
    };
  };

  rootOpts.plugins.transparent.settings.extraGroups = [ "LightBulbSign" ];
}
