_:

{
  rootOpts.plugins = {
    lsp.servers.sqls.enable = true;

    vim-dadbod.enable = true;
    vim-dadbod-completion.enable = true;
    vim-dadbod-ui.enable = true;
    # https://github.com/tpope/vim-dadbod/ for connections.
    # :DBUIAddConnection
    # > sqlite:[sth.db]|[sth.sqlite3]
    # :DBUIToggle
  };
}
