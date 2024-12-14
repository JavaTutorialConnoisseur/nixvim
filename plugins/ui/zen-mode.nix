_:

{
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
      plugins = { twilight.enabled = true; };
    };
  };

  rootOpts.plugins.twilight = {
    enable = true;
    settings = {
      context = 20;
      dimming = { alpha = 0.4; };
      expand = [ "function" "method" "table" "if_statement" ];
      treesitter = true;
    };
  };

  rootOpts.plugins.transparent.settings.extra_groups = [ "ZenBg" ];
  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>z";
    action = "<Cmd>ZenMode<CR>";
    options.desc = "Toggle zen mode";
  }];
}
