_: {
  opts = {
    enable = true;
    settings = {
      lsp.auto_attach = true;
      window.size = {
        height = 20;
        width = 90;
      };
    };

    # mappings: <leader>g? inside window
  };

  root.extraConfigLua = ''
    vim.g.navbuddy_taransparent = true
  '';

  root.keymaps = [
    {
      mode = "n";
      key = "<leader>gt";
      action = "<cmd>Navbuddy<cr>";
    }
  ];
}
