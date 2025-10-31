_: {
  opts = {
    enable = true;
    settings = {
      lsp.auto_attach = true;
      window.size = {
        height = 35;
        width = 120;
      };
    };

    # mappings: <leader>g? inside window
  };

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>gt";
      action = "<cmd>Navbuddy<cr>";
    }
  ];
}
