_:

{
  opts = {
    enable = true;

    settings = {
      sources = [ { name = "nvim_lsp"; } { name = "luasnip"; } ];
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

    # if they break, these are the previous:
    #     ['<CR>'] = cmp.mapping.confirm {
    #         behavior = cmp.ConfirmBehavior.Replace,
    #         select = true,
    #     },

    #     ['<Tab>'] = cmp.mapping(function(fallback)
    #         if cmp.visible() then
    #             cmp.select_next_item()
    #         elseif luasnip.expand_or_jumpable() then
    #             luasnip.expand_or_jump()
    #         else
    #             fallback()
    #         end
    #     end, { 'i', 's' }),

    #     ['<S-Tab>'] = cmp.mapping(function(fallback)
    #         if cmp.visible() then
    #             cmp.select_prev_item()
    #         elseif luasnip.jumpable(-1) then
    #             luasnip.jump(-1)
    #         else
    #             fallback()
    #         end
    #     end, { 'i', 's' }),
    # }),
  };
}
