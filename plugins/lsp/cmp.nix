_:

{
  opts = {
    enable = true;

    settings = {
      sources = map (src: { name = src; }) [
        "friendly-snippets"
        "snippy"
        "luasnip"
        "nvim_lsp"
      ];

      snippet.expand =
        "function(args) require('luasnip').lsp_expand(args.body) end";

      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.close()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      };
    };
  };

  rootOpts.plugins = {
    cmp-nvim-lsp.enable = true;
    cmp-snippy.enable = true;
    friendly-snippets.enable = true;
    intellitab.enable = true;
  };

  rootOpts.keymaps = [{
    mode = "i";
    key = "<tab>";
    action = "<cmd>lua require('intellitab').indent()<cr>";
    options = {
      noremap = true;
      desc = "Tab, but slightly more intelligent on newline";
    };
  }];
}
