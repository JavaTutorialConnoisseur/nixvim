_:

{

}

# if I ever need scala, this is one way:

# -- https://github.com/scalameta/nvim-metals
# RequireEnvironment('metals', function()
#     local nvim_metals_group = vim.api.nvim_create_augroup(
#         "nvim-metals",
#         { clear = true }
#     )

#     vim.api.nvim_create_autocmd("FileType", {
#         pattern = { "scala", "sbt" },
#         callback = function()
#             require("metals").initialize_or_attach({})
#         end,
#         group = nvim_metals_group,
#     })
# end)
