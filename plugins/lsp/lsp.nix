_: {
  opts.enable = true;

  root.colorschemes.catppuccin.settings.integrations.native_lsp.enabled = true;

  # function signature while writing
  root.plugins.lsp-signature = {
    enable = true;
    settings = {
      floating_window = false;
      hint_enable = false;

      toggle_key = "<c-k>";
    };
  };

  root.keymaps = [
    {
      key = "<leader>ci";
      action = "<cmd>lua vim.lsp.buf.implementation()<cr>";
      options.desc = "Go to symbol implementation";
    }

    {
      key = "<leader>cD";
      action = "<cmd>lua vim.lsp.buf.declaration()<cr>";
      options.desc = "Go to symbol declaration";
    }

    {
      key = "<leader>f";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options.desc = "Format code";
    }

    {
      key = "<leader>do";
      action = "<cmd>lua vim.diagnostic.open_float()<cr>";
      options.desc = "Open diagnostic details";
    }

    {
      key = "<leader>dq";
      action = "<cmd>lua vim.diagnostic.setloclist()<cr>";
      options.desc = "Open diagnostic list";
    }

    {
      key = "<leader>cT";
      action = ''
        <cmd>lua TelescopeWithTheme("lsp_references", {cmd = path}, "")<cr>'';
      options.desc = "Find code references with telescope";
    }
  ];

  root.plugins.which-key.settings.spec = [
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
}
