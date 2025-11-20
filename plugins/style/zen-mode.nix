_: {
  opts = {
    enable = true;
    settings = {
      on_close = ''
        function()
          vim.cmd('IBLEnable')
        end
      '';
      on_open = ''
        function()
          vim.cmd('IBLDisable')
        end
      '';
      window.width = 90;
      plugins = {twilight.enabled = true;};
    };
  };

  root.plugins.transparent.settings.extra_groups = ["ZenBg"];
  root.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>z";
      icon = {
        icon = "󱅻 ";
        color = "azure";
      };
    }
  ];

  root.keymaps = [
    {
      mode = "n";
      key = "<leader>z";
      action = "<Cmd>ZenMode<CR>";
      options.desc = "Toggle zen mode";
    }
  ];
}
