_:

{
  opts = {
    enable = true;
    keymaps = {
      diagnostic = {
        "<leader>d[" = {
          action = "goto_prev";
          desc = "Go to previous diagnostic";
        };
        "<leader>d]" = {
          action = "goto_next";
          desc = "Go to next diagnostic";
        };
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
        K = "hover";
        "<leader>f" = "format";
        "<leader>rl" = {
          action = "rename";
          desc = "Rename with LSP";
        };
        "<leader>cD" = {
          action = "declaration";
          desc = "Go to symbol declaration";
        };
        "<leader>cd" = {
          action = "definition";
          desc = "Go to symbol definition";
        };
        "<leader>ci" = {
          action = "implementation";
          desc = "Go to symbol implementation";
        };
      };

      extra = [{
        action = { __raw = "require('telescope.builtin').lsp_references"; };
        key = "<leader>cr";
        options.desc = "Find code references";
      }];
    };
  };

  rootOpts.plugins.lsp-signature.enable = true;
  rootOpts.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>f";
      group = "Format Code";
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
      mode = [ "n" "x" ];
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
