_: {
  opts = {
    enable = true;
    enableTelescope = true;
  };

  rootOpts.keymaps = [
    {
      mode = "n";
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
