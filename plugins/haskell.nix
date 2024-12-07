_:

{
  rootOpts.plugins.lsp.servers.hls.enabled = true;

  rootOpts.autoCmd = [{
    command.__raw = ''
      vim.cmd [[
        setlocal tabstop=2
        setlocal shiftwidth=2
      ]]
    '';
    event = [ "FileType" ];
    pattern = [ "haskell" ];
    desc = "Set tab and indent length for Haskell files to 2";
  }];
}

# NOTE: if I ever need haskell, this is one way:

# -- https://github.com/MrcJkb/haskell-tools.nvim
# RequireEnvironment({ 'haskell-tools', 'which-key' }, function()
#     local keys = require('which-key')
#     local ht = require('haskell-tools')

#     local bufnr = vim.api.nvim_get_current_buf()
#     local haskell_group = vim.api.nvim_create_augroup(
#         "haskell_group",
#         { clear = true, }
#     )

#     vim.api.nvim_create_autocmd("FileType", {
#         pattern = { "haskell" },
#         callback = function()
#             keys.add({
#                 buffer = bufnr,
#                 { "<leader>H",  group = "Haskell commands" },
#                 { "<leader>Hc", vim.lsp.codelens.run,      desc = "Run codelens action" },
#                 { "<leader>He", ht.lsp.buf_eval_all,       desc = "Evaluate whole file" },
#                 { "<leader>Hr", ht.repl.toggle,            desc = "Toggle the ghc repl" },
#                 {
#                     "<leader>Hf",
#                     function()
#                         ht.repl.toggle(vim.api.nvim_buf_get_name(0))
#                     end,
#                     desc = "Toggle the ghc repl, loading current file"
#                 },
#                 { "<leader>Hq", ht.repl.quit, desc = "Quit the ghc repl" },
#             })
#         end,
#         group = haskell_group
#     })
# end)
