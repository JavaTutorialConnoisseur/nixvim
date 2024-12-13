_: {
  opts = {
    enable = true;

    signs = {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "●";
        texthl = "DapBreakpointCondition";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
      };
    };

    # TODO: [later] set these up

    extensions = {
      dap-ui = {
        enable = true;
        floating.mappings = { close = [ "<ESC>" "q" ]; };
      };
      dap-virtual-text = { enable = true; };
    };

    adapters = {
      executables.gdb = {
        command = "gdb";
        args = [ "--interpreter=dap" "--eval-command" "set print pretty on" ];
      };
    };

    configurations = {
      c = [{
        name = "Debug (cc)";
        type = "gdb";
        request = "launch";
        # somehow dynamically determine which program to run?
      }];
    };
  };
}
