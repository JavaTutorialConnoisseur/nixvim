{ pkgs, ... }:

{
  # TEST: verify that a project with __main__ is executed on DAP run
  rootOpts.plugins = {
    conform-nvim = {
      enable = true;
      settings = { formatters_by_ft.python = [ "black" ]; };
    };

    lsp.servers.pylsp = {
      enable = true;
      settings.plugins = {
        black.enabled = true;
        flake8.enabled = true;
        isort.enabled = true;
        jedi.enabled = true;
        mccabe.enabled = true;
        pycodestyle.enabled = true;
        pydocstyle.enabled = true;
        pyflakes.enabled = true;
        pylint.enabled = true;
        rope.enabled = true;
        yapf.enabled = true;
      };
    };

    dap = {
      configurations = {
        python = [{
          name = "Run filename script";
          type = "python";
          request = "launch";
          module = "\${fileBasenameNoExtension}";
        }];
      };

      extensions.dap-python.enable = true;
    };

    neotest.adapters.python = {
      enable = true;
      settings = {
        dap = {
          justMyCode = false;
          console = "integratedTerminal";
        };

        args = [ "--log-level" "DEBUG" "--quiet" ];
        runner = "pytest";
      };
    };
  };

  rootOpts.extraPackages = [ pkgs.python312Packages.pytest ];
}
