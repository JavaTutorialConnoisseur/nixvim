_: {
  opts = {
    enable = true;

    settings = {
      sources = map (src: {name = src;}) [
        "friendly-snippets"
        "snippy"
        "luasnip"
        "nvim_lsp"
      ];

      snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

      mapping = {
        "<c-space>" = "cmp.mapping.complete()";
        "<c-e>" = "cmp.mapping.close()";
        "<c-d>" = "cmp.mapping.scroll_docs(-4)";
        "<c-f>" = "cmp.mapping.scroll_docs(4)";
        "<cr>" = "cmp.mapping.confirm({ select = true })";
        "<tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<s-tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<c-l>" = "cmp.mapping(function() if require('luasnip').jumpable(1) then require('luasnip').jump(1) end end, { 'i', 's' })";
        "<c-h>" = "cmp.mapping(function() if require('luasnip').jumpable(-1) then require('luasnip').jump(-1) end end, { 'i', 's' })";
      };
    };
  };

  root.plugins = {
    cmp-nvim-lsp.enable = true;
    cmp-snippy.enable = true;
    friendly-snippets.enable = true;
    intellitab.enable = true;
  };

  root.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>s";
      group = "Snippets";
      icon = {
        icon = " ";
        color = "purple";
      };
    }
  ];

  root.keymaps = [
    {
      mode = "i";
      key = "<tab>";
      action = "<cmd>lua require('intellitab').indent()<cr>";
      options = {
        noremap = true;
        desc = "Tab, but slightly more intelligent on newline";
      };
    }

    {
      mode = "n";
      key = "<leader>sn";
      action = "<cmd>lua if require('luasnip').jumpable(1) then require('luasnip').jump(1) end<cr>";
      options.desc = "Jump to next snippet chunk";
    }

    {
      mode = "n";
      key = "<leader>sp";
      action = "<cmd>lua if require('luasnip').jumpable(-1) then require('luasnip').jump(-1) end<cr>";
      options.desc = "Jump to previous snippet chunk";
    }
  ];
}
