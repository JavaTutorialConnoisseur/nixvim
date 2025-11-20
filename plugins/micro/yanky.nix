_: {
  opts = {
    enable = true;
    enableTelescope = true;
  };

  root.keymaps = [
    {
      mode = ["n" "v" "x"];
      key = "<leader>gy";
      action.__raw = ''
        function()
          TelescopeWithTheme('yank_history', { }, 'yank_history')
        end
      '';
      options.desc = "Yank selections";
    }
  ];
}
