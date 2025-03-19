{pkgs, ...}: {
  opts = {
    enable = true;

    signs = {
      dapBreakpoint.text = "●";
      dapBreakpoint.texthl = "DapBreakpoint";

      dapBreakpointCondition.text = "●";
      dapBreakpointCondition.texthl = "DapBreakpointCondition";

      dapLogPoint.text = "◆";
      dapLogPoint.texthl = "DapLogPoint";
    };
  };

  rootOpts.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>cc";
      group = "Debugging functions";
      icon = " ";
    }
  ];

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>ccb";
      action = "<cmd>DapToggleBreakpoint<cr>";
      options.desc = "Toggle debug breakpoint";
    }

    {
      mode = "n";
      key = "<leader>ccc";
      action = "<cmd>DapContinue<cr>";
      options = {
        silent = true;
        desc = "Continue debugging";
      };
    }

    {
      mode = "n";
      key = "<leader>ccC";
      action = "<cmd>lua require('dap').run_to_cursor()<cr>";
      options = {
        silent = true;
        desc = "Run to cursor";
      };
    }

    {
      mode = "n";
      key = "<leader>cci";
      action = "<cmd>DapStepInto<cr>";
      options = {
        silent = true;
        desc = "Step into";
      };
    }

    {
      mode = "n";
      key = "<leader>cco";
      action = "<cmd>DapStepOut<cr>";
      options = {
        silent = true;
        desc = "Step Out";
      };
    }

    {
      mode = "n";
      key = "<leader>ccO";
      action = "<cmd>DapStepOver<cr>";
      options = {
        silent = true;
        desc = "Step Over";
      };
    }

    {
      mode = "n";
      key = "<leader>cck";
      action = "<cmd>DapTerminate<cr>";
      options = {
        silent = true;
        desc = "Terminate";
      };
    }

    {
      mode = "n";
      key = "<leader>ccf";
      action.__raw = ''
        function()
          require('dap.ext.vscode').load_launchjs()
          TelescopeWithTheme('configurations', { }, 'dap')
        end
      '';
      options.desc = "Debug Configurations";
    }

    {
      mode = "n";
      key = "<leader>ccG";
      action.__raw = ''
        function()
          require('dapui').float_element('repl', {
            width = 26,
            height = 2,
            position = 'center',
            title = 'options'
          })
        end
      '';
      options.desc = "Show DAP ui glyphs";
    }

    {
      mode = "n";
      key = "<leader>ccg";
      action.__raw = ''
        function()
          require('dapui').float_element('repl', { width = 110,
            height = 28, position = 'center', title = 'REPL' })
        end
      '';
      options.desc = "Show DAP repl";
    }
  ];

  rootOpts.extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  '';

  rootOpts.plugins.dap-virtual-text.enable = true;
  rootOpts.plugins.dap-ui = {
    enable = true;

    settings = {
      floating.mappings.close = ["<ESC>" "q"];

      layouts = let
        section = items: pos: size: {
          elements =
            map (id: {
              id = id;
              size = 0.5;
            })
            items;
          position = pos;
          size = size;
        };
      in [
        (section ["scopes" "watches"] "left" 30)
        (section ["breakpoints" "stacks"] "right" 30)
      ];
    };
  };
  rootOpts.extraPlugins = [(pkgs.vimPlugins.telescope-dap-nvim)];
}
