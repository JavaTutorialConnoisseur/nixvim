{pkgs, ...}: {
  rootOpts.plugins = {
    lsp.servers.pylsp = {
      enable = true;
      settings.plugins = {
        # code style guide
        flake8.enabled = true;

        pylsp_mypy = {
          # type safety (kinda bad)
          enabled = true;
          dmypy = true;
        };

        black = {
          # code formatting
          enabled = true;
          line_length = 79;
        };
      };
    };

    dap = {
      configurations = {
        python = [
          {
            name = "Run filename script";
            type = "python";
            request = "launch";
            module = "\${fileBasenameNoExtension}";
          }
        ];
      };
    };

    neotest.adapters.python = {
      enable = true;
      settings = {
        dap = {
          justMyCode = false;
          console = "integratedTerminal";
        };

        args = ["--log-level" "DEBUG" "--quiet"];
        runner = "pytest";
      };
    };
  };

  # rootOpts.autoCmd = [
  #   {
  #     callback.__raw = ''
  #       function()
  #         vim.api.nvim_create_autocmd("BufWritePre", {
  #           pattern = "*.py",
  #           callback = function(args)
  #             require("conform").format({ bufnr = args.buf })
  #           end,
  #         })
  #       end
  #     '';
  #     event = ["FileType"];
  #     pattern = ["python"];
  #     desc = "Set automatic formatting for python files.";
  #   }
  # ];

  rootOpts.plugins.dap-python.enable = true;
  rootOpts.extraPackages = [pkgs.python312Packages.pytest];
}
