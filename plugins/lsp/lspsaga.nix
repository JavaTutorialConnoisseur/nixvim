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

  root.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>rn";
      __unkeyed-2 = "<cmd>Lspsaga rename mode=i<cr>";
      desc = "Rename symbol under cursor";
    }

    {
      __unkeyed-1 = "<leader>cr";
      __unkeyed-2 = "<cmd>Lspsaga finder ref+def+imp<cr>";
      group = "Find code references";
    }

    {
      __unkeyed-1 = "K";
      __unkeyed-2 = "<cmd>Lspsaga hover_doc<cr>";
      group = "Inspect item below cursor";
    }

    {
      __unkeyed-1 = "<leader>K";
      __unkeyed-2 = "<cmd>Lspsaga hover_doc ++keep<cr>";
      group = "Inspect item below cursor w/ pin";
    }

    {
      __unkeyed-1 = "<leader>cd";
      __unkeyed-2 = "<cmd>Lspsaga peek_definition<cr>";
      group = "Go to symbol definition";
    }

    # with project-wide, 'x' selects, '<CR>' approves
    {
      __unkeyed-1 = "<leader>rN";
      __unkeyed-2 = "<cmd>Lspsaga rename mode=i ++project<cr>";
      desc = "Rename symbol under cursor for whole project";
    }

    {
      __unkeyed-1 = "<leader>d[";
      __unkeyed-2 = "<cmd>Lspsaga diagnostic_jump_prev<cr>";
      desc = "Jump to previous diagnostic";
    }

    {
      __unkeyed-1 = "<leader>d]";
      __unkeyed-2 = "<cmd>Lspsaga diagnostic_jump_next<cr>";
      desc = "Jump to next diagnostic";
    }

    {
      __unkeyed-1 = "<leader>ca";
      __unkeyed-2 = "<cmd>Lspsaga code_action<cr>";
      desc = "Preview code actions";
    }

    {
      __unkeyed-1 = "<leader>~";
      __unkeyed-2 = "<cmd>Lspsaga outline<cr>";
      desc = "Get tag set";
    }
  ];

  root.plugins.transparent.settings.extra_groups = ["WinBar" "WinBarNC"];
}
