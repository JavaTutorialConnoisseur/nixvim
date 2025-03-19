_: {
  opts = {
    enable = true;
    settings.keywords = {
      FUTURE = {
        color = "hint";
        icon = "󱄅 ";
      };

      IMPL = {
        color = "info";
        icon = " ";
        alt = ["ADDME"];
      };
    };
  };

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>td";
      options.desc = "Find TODO's";
      action.__raw = ''
        function()
          TelescopeWithTheme('todo', { }, 'todo-comments')
        end
      '';
    }

    {
      mode = "n";
      key = "[t";
      action.__raw = ''
        function()
            require("todo-comments").jump_prev({
              keywords = { "TODO", "ADDME", "IMPL" }
            })
        end
      '';
    }

    {
      mode = "n";
      key = "]t";
      action.__raw = ''
        function()
            require("todo-comments").jump_next({
              keywords = { "TODO", "ADDME", "IMPL" }
            })
        end
      '';
    }
  ];

  rootOpts.plugins.transparent.settings.extra_groups = [
    "TodoSignNOTE"
    "TodoSignFIX"
    "TodoSignHACK"
    "TodoSignPERF"
    "TodoSignTEST"
    "TodoSignTODO"
    "TodoSignWARN"
  ];
}
