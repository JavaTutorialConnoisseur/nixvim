{pkgs, ...}: {
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

  rootOpts.plugins.transparent.settings.extra_groups = ["VimtexMsg"];
  rootOpts.extraPackages = [pkgs.texlivePackages.latexmk];

  rootOpts.autoCmd = let
    action = texcmd: ''"<cmd>lua vim.cmd [[execute 'normal <Plug>(${texcmd})']]<cr>"'';
  in [
    {
      callback.__raw = ''
        function()
          local wk = require('which-key')
          wk.add({
            { "<leader>x", group = "LaTeX", icon = " ",
              mode = { "x", "n", "o" }
            },

            { "<F6>", "<plug>(vimtex-env-surround-visual)",
              desc = "Surround visual selection w/ env", mode = "x"
            },

            {
              mode = { "x", "o" },
              {
                { "ac", "<plug>(vimtex-ac)" },
                { "ic", "<plug>(vimtex-ic)" },
                { "ad", "<plug>(vimtex-ad)" },
                { "id", "<plug>(vimtex-id)" },
                { "ae", "<plug>(vimtex-ae)" },
                { "ie", "<plug>(vimtex-ie)" },
                { "a$", "<plug>(vimtex-a$)" },
                { "i$", "<plug>(vimtex-i$)" },
                { "aP", "<plug>(vimtex-aP)" },
                { "iP", "<plug>(vimtex-iP)" },
                { "am", "<plug>(vimtex-am)" },
                { "im", "<plug>(vimtex-im)" }
              }
            },

            {
              mode = { "n", "x", "o" },
              {
                { "%", "<plug>(vimtex-%)" },
                { "]]", "<plug>(vimtex-]])" },
                { "][", "<plug>(vimtex-][)" },
                { "[]", "<plug>(vimtex-[])" },
                { "[[", "<plug>(vimtex-[[)" },
                { "]m", "<plug>(vimtex-]m)" },
                { "]M", "<plug>(vimtex-]M)" },
                { "[m", "<plug>(vimtex-[m)" },
                { "[M", "<plug>(vimtex-[M)" },
                { "]n", "<plug>(vimtex-]n)" },
                { "]N", "<plug>(vimtex-]N)" },
                { "[n", "<plug>(vimtex-[n)" },
                { "[N", "<plug>(vimtex-[N)" }
              }
            },

            {
              mode = "n",

              { "dse", "<plug>(vimtex-env-delete)" },
              { "dsc", "<plug>(vimtex-cmd-delete)" },
              { "ds$", "<plug>(vimtex-env-delete-math)" },
              { "dsd", "<plug>(vimtex-delim-delete)" },
              { "cse", "<plug>(vimtex-env-change)" },
              { "csc", "<plug>(vimtex-cmd-change)" },
              { "cs$", "<plug>(vimtex-env-change-math)" },
              { "csd", "<plug>(vimtex-delim-change-math)" },
              { "tsf", "<plug>(vimtex-cmd-toggle-frac)" },
              { "tsc", "<plug>(vimtex-cmd-toggle-star)" },
              { "tse", "<plug>(vimtex-env-toggle-star)" },
              { "ts$", "<plug>(vimtex-env-toggle-math)" },
              { "tsb", "<plug>(vimtex-env-toggle-break)" },

              { "<leader>xD", "<plug>(vimtex-doc-package)",
                desc = "Show documentation"
              },

              { "<F6>", "<plug>(vimtex-env-surround-line)",
                desc = "Surround line with \\begin-\\end"
              },

              { "<leader>xb", ${
          action "vimtex-env-change"
        }, desc = "Change surrounding begin{} - end{}" },
              { "<leader>xk", ${
          action "vimtex-stop"
        }, desc = "Stop current *tex compilation" },
              { "<leader>xK", ${
          action "vimtex-stop-all"
        }, desc = "Stop all *tex compilation" },
              { "<leader>xl", ${
          action "vimtex-compile"
        }, desc = "Start *tex project compilation" },
              { "<leader>xL", ${
          action "vimtex-compile-selected"
        }, desc = "Start *tex (selected) compilation" },
              { "<leader>xv", ${
          action "vimtex-view"
        }, desc = "View project .pdf without compiling" },
              { "<leader>xm", ${
          action "vimtex-imaps-list"
        }, desc = "List insert-mode *tex mappings" }
            }
          })
        end
      '';

      event = ["FileType"];
      pattern = ["tex"];
      desc = "Add which-key group name and keybinds for tex";
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

      event = ["FileType"];
      pattern = ["tex"];
      desc = "Add table-of-contents binding";
    }
  ];
}
