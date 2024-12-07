_:

{
  rootOpts.plugins.lsp.servers.nil_ls = {
    # make this autoformat on <leader>f
    enable = true;
  };

  # lsp.nil_ls.setup {
  #     autostart = true,
  #     capabilities = vim.tbl_deep_extend(
  #         'force',
  #         vim.lsp.protocol.make_client_capabilities(),
  #         require('cmp_nvim_lsp').default_capabilities(), {
  #             workspace = {
  #                 didChangeWatchedFiles = {
  #                     dynamicRegistration = true,
  #                 },
  #             },
  #         }
  #     ),
  #     settings = {
  #         ['nil'] = {
  #             testSetting = 42,
  #             formatting = { command = { "nixfmt" } },
  #         },
  #     },
  # }

  rootOpts.autoCmd = [{
    callback.__raw = ''
      function()
        vim.cmd [[
          setlocal tabstop=2
          setlocal shiftwidth=2
        ]]
      end
    '';
    event = [ "FileType" ];
    pattern = [ "nix" ];
    desc = "Set tab and indent length for Nix files to 2";
  }];
}
