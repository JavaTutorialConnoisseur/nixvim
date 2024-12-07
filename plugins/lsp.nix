_:

{
  opts = {
    enable = true;
    keymaps = {
      diagnostic = {
        "<leader>d[" = "goto_prev";
        "<leader>d]" = "goto_next";
        "<leader>do" = "open_float";
        "<leader>dq" = "setloclist";
      };

      lspBuf = {
        K = "hover";
        "<leader>f" = "format";
        # TODO: see if this works with inc-rename
        "<leader>rn" = "rename";
        "<leader>cD" = "declaration";
        "<leader>cd" = "definition";
        "<leader>ci" = "implementation";
        "<leader>ct" = "type_definition";
      };

      extra = [
        {
          action = { __raw = "require('telescope.builtin').lsp_references"; };
          key = "<leader>cr";
        }

        {
          action = {
            __raw = "require('telescope.builtin').lsp_document_symbols";
          };
          key = "<leader>gt";
        }
      ];
    };
  };

  rootOpts = {
    colorschemes.catppuccin.settings.integrations.native_lsp.enabled = true;
  };
}
