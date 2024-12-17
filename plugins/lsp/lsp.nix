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
        "<leader>rl" = "rename";
        "<leader>cD" = "declaration";
        "<leader>cd" = "definition";
        "<leader>ci" = "implementation";
        "<leader>ct" = "type_definition";
      };

      extra = [{
        action = { __raw = "require('telescope.builtin').lsp_references"; };
        key = "<leader>cr";
        options.desc = "Find code references";
      }];
    };
  };

  rootOpts.plugins.lsp-signature.enable = true;

  rootOpts = {
    colorschemes.catppuccin.settings.integrations.native_lsp.enabled = true;
  };
}
