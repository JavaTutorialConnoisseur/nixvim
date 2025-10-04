_: {
  opts = {
    enable = true;
    enableTelescope = true;
    settings = {
      use_git_branch = false;
      follow_cwd = false;
      autostart = false;
      autoload = false;
    };
  };

  rootOpts.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>S";
      group = "Sessions";
      icon = {
        icon = " ";
        color = "purple";
      };
    }
  ];

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>Ss";
      options.desc = "Toggle session";
      action = "<cmd>SessionToggle<cr>";
    }

    {
      mode = "n";
      key = "<leader>SS";
      options.desc = "Save session";
      action = "<cmd>SessionSave<cr>";
    }

    {
      mode = "n";
      key = "<leader>Sl";
      options.desc = "Load last session";
      action = "<cmd>SessionLoadLast<cr>";
    }

    {
      mode = "n";
      key = "<leader>Sd";
      options.desc = "Delete current session";
      action = "<cmd>SessionDelete<cr>";
    }

    {
      mode = "n";
      key = "<leader>gs";
      options.desc = "Sessions";
      action = "<cmd>Telescope persisted<cr>";
    }
  ];

  rootOpts.extraConfigLua = ''
    vim.opt.sessionoptions:append 'globals'
    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'PersistedSavePre',
      group = vim.api.nvim_create_augroup('PersistedHooks', {}),
      callback = function()
        vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
      end,
    })
  '';
}
