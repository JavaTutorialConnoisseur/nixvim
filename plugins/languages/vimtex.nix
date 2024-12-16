{ pkgs, ... }:

{
  opts = {
    enable = true;
    texlivePackage = pkgs.texliveFull;

    settings = {
      compiler_method = "latexmk";

      view_general_viewer = "okular";
      view_general_options = "--unique file:@pdf#src:@line@tex";

      mappings_enabled = false;
    };
  };

  rootOpts.autoCmd = [
    {
      callback.__raw = ''
        function()
          require('which-key').add({{ "<leader>x", group = "LaTeX", icon = " " }})
        end
      '';

      event = [ "FileType" ];
      pattern = [ "tex" ];
      desc = "Add which-key group name for tex";
    }

    {
      callback.__raw = ''
        function()
          vim.cmd [[
            let g:custom_toc1 = vimtex#toc#new({
                \ 'layers' : ['include', 'todo', 'content'],
                \ 'show_help' : 0,
                \})
            nnoremap <silent> <leader>xt :call g:custom_toc1.toggle()<cr>
            nnoremap <silent> <leader>xT :call g:custom_toc1.add()<cr>
          ]]
        end
      '';

      event = [ "FileType" ];
      pattern = [ "tex" ];
      desc = "Add table-of-contents binding";
    }
  ];

  rootOpts.plugins.transparent.settings.extra_groups = [ "VimtexMsg" ];
  rootOpts.extraPackages = [ pkgs.texlivePackages.latexmk ];

  rootOpts.keymaps = let
    plugMap = { plugCmd, newKey, dsc }: {
      mode = "n";
      action = '':lua vim.cmd [[execute "normal \<Plug>(${plugCmd})"]]<cr>'';
      key = newKey;
      options.desc = dsc;
    };

    describeMap = { key, dsc }: {
      mode = "n";
      key = key;
      action = key;
      options.desc = dsc;
    };
  in [
    (plugMap {
      plugCmd = "vimtex-env-change";
      newKey = "<leader>xb";
      dsc = "Change surrounding begin{} - end{}";
    })

    (plugMap {
      plugCmd = "vimtex-stop";
      newKey = "<leader>xk";
      dsc = "Stop current *tex compilation";
    })

    (plugMap {
      plugCmd = "vimtex-stop-all";
      newKey = "<leader>xK";
      dsc = "Stop all *tex compilation";
    })

    (plugMap {
      plugCmd = "vimtex-compile";
      newKey = "<leader>xl";
      dsc = "Start *tex project compilation";
    })

    (plugMap {
      plugCmd = "vimtex-compile-selected";
      newKey = "<leader>xL";
      dsc = "Start *tex (selected) compilation";
    })

    (plugMap {
      plugCmd = "vimtex-view";
      newKey = "<leader>xv";
      dsc = "View project .pdf without compiling";
    })

    (plugMap {
      plugCmd = "vimtex-imaps-list";
      newKey = "<leader>xm";
      dsc = "List insert-mode *tex mappings";
    })

    (describeMap {
      key = "cse";
      dsc = "Change surrounding begin{} - end{}";
    })
  ];
}

# TODO: add / label keybinds:
# TODO: add latex TEMPLATE -> mb add flk keybind for it?

# dse              |<plug>(vimtex-env-delete)|                     `n`
# dsc              |<plug>(vimtex-cmd-delete)|                     `n`
# ds$              |<plug>(vimtex-env-delete-math)|                `n`
# dsd              |<plug>(vimtex-delim-delete)|                   `n`

# cse              |<plug>(vimtex-env-change)|                     `n`
# csc              |<plug>(vimtex-cmd-change)|                     `n`
# cs$              |<plug>(vimtex-env-change-math)|                `n`
# csd              |<plug>(vimtex-delim-change-math)|              `n`

# tsf              |<plug>(vimtex-cmd-toggle-frac)|                `nx`
# tsc              |<plug>(vimtex-cmd-toggle-star)|                `n`
# tse              |<plug>(vimtex-env-toggle-star)|                `n`
# ts$              |<plug>(vimtex-env-toggle-math)|                `n`
# tsb              |<plug>(vimtex-env-toggle-break)|               `n`

# USEFUL -> surrounds w/ /begin{INPUT} /end{INPUT}
#                  |<plug>(vimtex-env-surround-operator)|          `n`
# <F6>             |<plug>(vimtex-env-surround-line)|              `n`
# <F6>             |<plug>(vimtex-env-surround-visual)|            `x`

# <F7>             |<plug>(vimtex-cmd-create)|                     `nxi`

# Command
# ac               |<plug>(vimtex-ac)|                             `xo`
# ic               |<plug>(vimtex-ic)|                             `xo`

# Delimiter
# ad               |<plug>(vimtex-ad)|                             `xo`
# id               |<plug>(vimtex-id)|                             `xo`

# Environment
# ae               |<plug>(vimtex-ae)|                             `xo`
# ie               |<plug>(vimtex-ie)|                             `xo`

# Math
# a$               |<plug>(vimtex-a$)|                             `xo`
# i$               |<plug>(vimtex-i$)|                             `xo`

# Sections
# aP               |<plug>(vimtex-aP)|                             `xo`
# iP               |<plug>(vimtex-iP)|                             `xo`

# Items
# am               |<plug>(vimtex-am)|                             `xo`
# im               |<plug>(vimtex-im)|                             `xo`

# (matching pairs)
# %                |<plug>(vimtex-%)|                              `nxo`

# next/prev end/begin-of-sec
# ]]               |<plug>(vimtex-]])|                             `nxo`
# ][               |<plug>(vimtex-][)|                             `nxo`
# []               |<plug>(vimtex-[])|                             `nxo`
# [[               |<plug>(vimtex-[[)|                             `nxo`

# next/prev \begin or \end
# ]m               |<plug>(vimtex-]m)|                             `nxo`
# ]M               |<plug>(vimtex-]M)|                             `nxo`
# [m               |<plug>(vimtex-[m)|                             `nxo`
# [M               |<plug>(vimtex-[M)|                             `nxo`

# next/prev math start or end
# ]n               |<plug>(vimtex-]n)|                             `nxo`
# ]N               |<plug>(vimtex-]N)|                             `nxo`
# [n               |<plug>(vimtex-[n)|                             `nxo`
# [N               |<plug>(vimtex-[N)|                             `nxo`

# next/prev frame start or end
# ]r               |<plug>(vimtex-]r)|                             `nxo`
# ]R               |<plug>(vimtex-]R)|                             `nxo`
# [r               |<plug>(vimtex-[r)|                             `nxo`
# [R               |<plug>(vimtex-[R)|                             `nxo`

# next/prev comment start or end
# ]/               |<plug>(vimtex-]/|                              `nxo`
# ]*               |<plug>(vimtex-]star|                           `nxo`
# [/               |<plug>(vimtex-[/|                              `nxo`
# [*               |<plug>(vimtex-[star|                           `nxo`

# USEFUL!
# K                |<plug>(vimtex-doc-package)|                    `n`

# --------------------------------------------------------------------------------|
# --------------------------------------------------------------------------------|

# unneededNBinds = map (bind: "<leader>l${bind}") [
#   "a"
#   "c"
#   "C"
#   "g"
#   "G"
#   "i"
#   "I"
#   "o"
#   "q"
#   "s"
#   "t"
#   "T"
#   "x"
#   "X"
# ];
# unneededIBinds = [ "]]" ];

# {
#   callback.__raw = ''
#     function()
#       vim.cmd(":iunmap <silent><buffer><expr> ${
#         builtins.head unneededIBinds
#       }")
#     end
#   '';
#
#   event = [ "FileType" ];
#   pattern = [ "tex" ];
#   desc = "Remove insert mode unneded vimtex bindings";
# }
#
# {
#   callback.__raw = ''
#     function()
#       ${
#         builtins.concatStringsSep "\n"
#         (map (bind: "vim.cmd('unmap <silent><buffer><expr> ${bind}')")
#           unneededNBinds)
#       }
#     end
#   '';
#
#   event = [ "FileType" ];
#   pattern = [ "tex" ];
#   desc = "Remove normal mode unneeded vimtex bindings";
# }
