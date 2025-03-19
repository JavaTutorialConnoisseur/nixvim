_: {
  opts = {
    enable = true;
    lsp.autoAttach = true;
    window.size = {
      height = 35;
      width = 100;
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
