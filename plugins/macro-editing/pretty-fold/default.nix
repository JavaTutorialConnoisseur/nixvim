{
  pkgs,
  lib,
  themeColors,
  ...
}: {
  extra.packages = [(import ./package.nix {inherit lib pkgs;})];

  rootOpts.extraConfigLua = ''
    require('pretty-fold').setup({
      keep_indentation = false,
      fill_char = '━',
      sections = {
        left = {
           '━ ', function()
              return string.rep('*', vim.v.foldlevel)
           end, ' ━┫', 'content', '┣'
        },
        right = {
           '┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
        }
      },
    })
  '';

  rootOpts.plugins.which-key.settings.spec = [
    # {
    #   mode = "n";
    #   __unkeyed-1 = "<leader>ca";
    #   __unkeyed-2 = "<cmd>lua require('actions-preview').code_actions()<cr>";
    #   desc = "Preview code actions";
    #   icon = {
    #     icon = " ";
    #     color = "purple";
    #   };
    # }
  ];
}
