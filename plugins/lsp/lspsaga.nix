_: {
  opts = {
    # https://github.com/nix-community/nixd/blob/main/nixd/docs/editors/nvim-lsp.nix
    enable = true;
    settings = {
      outline = {
        auto_preview = false;
        win_width = 50;
      };

      rename.keys.quit = "<esc>";
      lightbulb.enable = false;
    };
  };

  root.plugins.transparent.settings.extra_groups = ["WinBar" "WinBarNC"];

  root.keymaps = [
    {
      key = "<leader>rn";
      action = "<cmd>Lspsaga rename mode=i<cr>";
      options.desc = "Rename symbol under cursor";
    }

    {
      key = "<leader>cr";
      action = "<cmd>Lspsaga finder ref+def+imp<cr>";
      options.desc = "Find code references";
    }

    {
      key = "K";
      action = "<cmd>Lspsaga hover_doc<cr>";
      options.desc = "Inspect item below cursor";
    }

    {
      key = "<leader>K";
      action = "<cmd>Lspsaga hover_doc ++keep<cr>";
      options.desc = "Inspect item below cursor w/ pin";
    }

    {
      key = "<leader>cd";
      action = "<cmd>Lspsaga peek_definition<cr>";
      options.desc = "Go to symbol definition";
    }

    # with project-wide, 'x' selects, '<cr>' approves
    {
      key = "<leader>rN";
      action = "<cmd>Lspsaga rename mode=i ++project<cr>";
      options.desc = "Rename symbol under cursor for whole project";
    }

    {
      key = "<leader>d[";
      action = "<cmd>Lspsaga diagnostic_jump_prev<cr>";
      options.desc = "Jump to previous diagnostic";
    }

    {
      key = "<leader>d]";
      action = "<cmd>Lspsaga diagnostic_jump_next<cr>";
      options.desc = "Jump to next diagnostic";
    }

    {
      key = "<leader>ca";
      action = "<cmd>Lspsaga code_action<cr>";
      options.desc = "Preview code actions";
    }

    {
      key = "<leader>~";
      action = "<cmd>Lspsaga outline<cr>";
      options.desc = "Get tag set";
    }
  ];
}
