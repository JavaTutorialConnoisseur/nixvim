_: {
  opts = {
    enable = true;
    keymaps = {
      diagnostic = {
        "<leader>do" = {
          action = "open_float";
          desc = "Open diagnostic details";
        };
        "<leader>dq" = {
          action = "setloclist";
          desc = "Open diagnostic list";
        };
      };

      lspBuf = {
        "<leader>f" = {
          action = "format";
          desc = "Format code";
        };
        "<leader>cD" = {
          action = "declaration";
          desc = "Go to symbol declaration";
        };
        "<leader>ci" = {
          action = "implementation";
          desc = "Go to symbol implementation";
        };
      };
    };
  };

  # function signature while writing
  rootOpts.plugins.lsp-signature = {
    enable = true;
    settings = {
      floating_window = false;
      hint_enable = false;

      toggle_key = "<C-k>";
    };
  };

  rootOpts.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>cT";
      __unkeyed-2 = ''
        <cmd>lua TelescopeWithTheme("lsp_references", {cmd = path}, "")<cr>'';
      group = "Find code references with telescope";
    }

    {
      __unkeyed-1 = "<leader>f";
      group = "Format code";
      icon = {
        icon = "󰉵 ";
        color = "purple";
      };
    }

    {
      __unkeyed-1 = "<leader>r";
      group = "Rename";
      icon = {
        icon = "󰑕 ";
        color = "red";
      };
    }

    {
      __unkeyed-1 = "<leader>c";
      group = "Code analysis";
      icon = {
        icon = " ";
        color = "purple";
      };
      mode = ["n" "x"];
    }

    {
      __unkeyed-1 = "<leader>d";
      group = "Diagnostics";
      icon = {
        icon = " ";
        color = "red";
      };
    }
  ];

  rootOpts = {
    colorschemes.catppuccin.settings.integrations.native_lsp.enabled = true;
  };
}
