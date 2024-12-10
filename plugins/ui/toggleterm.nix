_:

{
  opts = {
    enable = true;

    settings = {
      direction = "float";
      float_opts.border = "rounded";
      shading_factor = 2;
      size = 10;

      highlights = {
        Normal.link = "Normal";
        NormalNC.link = "NormalNC";
        NormalFloat.link = "NormalFloat";
        FloatBorder.link = "FloatBorder";
        StatusLine.link = "StatusLine";
        StatusLineNC.link = "StatusLineNC";
        WinBar.link = "WinBar";
        WinBarNC.link = "WinBarNC";
      };

      on_create = ''
        function(t)
          vim.opt_local.foldcolumn = "0"
          vim.opt_local.signcolumn = "no"
          if t.hidden then
            vim.keymap.set({ "n", "t", "i" }, "<F7>", function() t:toggle() end, { desc = "Toggle terminal", buffer = t.bufnr })
          end
          local term_name = "ToggleTermBuf" .. tostring(t.bufnr)
          vim.cmd(t.id .. "ToggleTermSetName " .. term_name)
        end
      '';
    };
  };

  rootOpts.plugins.transparent.settings.extra_groups = [ "ToggleTerm1Normal" ];

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader><C-D>";
      action = "<Cmd>ToggleTerm direction=float<CR>";
      options.desc = "Toggle all terminals";
    }

    {
      mode = "n";
      key = "<F7>";
      action = "<Cmd>execute v:count . 'ToggleTerm'<CR>";
      options.desc = "Toggle terminal";
    }

    {
      mode = "t";
      key = "<F7>";
      action = "<Cmd>ToggleTerm<CR>";
      options.desc = "Toggle terminal";
    }

    {
      mode = "i";
      key = "<F7>";
      action = "<Esc><Cmd>ToggleTerm<CR>";
      options.desc = "Toggle terminal";
    }

    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Switch to normal mode";
    }

    {
      mode = [ "n" ];
      key = "<Leader>ts";
      action = "<cmd>TermSelect<cr>";
      options.desc = "Select terminal";
    }

    # {
    #   mode = [ "n" ];
    #   key = "<Leader>tl";
    #   action = "<cmd>lua lazygit_term:toggle()<cr>";
    #   options.desc = "Toggle lazygit term";
    # }

    {
      mode = [ "n" ];
      key = "<Leader>tg";
      action = "<cmd>lua gef_term:toggle()<cr>";
      options.desc = "Toggle GEF GDB term";
    }

    {
      mode = [ "n" ];
      key = "<leader><leader>";
      action = "<cmd>lua zsh_term:toggle()<cr>";
      options.desc = "Toggle zsh term";
    }

    {
      mode = [ "n" ];
      key = "<leader>tk";
      action = "<cmd>NixShellTermToggle<cr>";
      options.desc = "Toggle shell term term";
    }

    {
      mode = [ "n" ];
      key = "<Leader>tn";
      action.__raw = ''
        function()
          local curterm = require("toggleterm.terminal").get_focused_id()
          if curterm ~= nil then
            vim.cmd(curterm .. "ToggleTermSetName")
          else
            vim.notify("No terminal is in focus...", "error")
          end
        end
      '';
      options.desc = "Rename current terminal";
    }
  ];

  rootOpts.userCommands = {
    NixShellTermToggle = {
      command.__raw = ''
        function()
          local cwd = vim.fn.getcwd()
          local shell_path = vim.fn.expand(cwd .. '/shell.nix')
          if vim.fn.filereadable(shell_path) == 1 then
            shell_term:toggle()
          else
            vim.notify("File «shell.nix» does not " ..
              "exist in the current directory!", "error")
          end
        end
      '';
      desc = "Prints whole file using 'silicon'.";
    };
  };

  rootOpts.keymapsOnEvents = {
    TermOpen = [{
      mode = [ "t" ];
      key = "<C-D>";
      action = "<cmd>wincmd h<cr>";
      options.desc = "Terminal exit keymap";
    }];
  };

  # FIXME: this doesn't work. Have it so these aren't global but still work somehow (w/o overriding)
  extraConfigLuaPre = ''
    local Terminal = require('toggleterm.terminal').Terminal

    lazygit_term = Terminal:new({
        display_name = "LazyGit",
        count = 999,
        cmd = "lazygit",
        direction = "float",
        hidden = true,
    })

    function LazyGitToggle()
      lazygit_term:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

    gef_term = Terminal:new({
        display_name = "GDB GEF",
        count = 998,
        cmd = "gef",
        direction = "float",
        hidden = true,
    })

    zsh_term = Terminal:new({
        display_name = "Zsh",
        count = 997,
        cmd = "zsh",
        direction = "float",
        hidden = true,
    })

    shell_term = Terminal:new({
        display_name = "nix-shell",
        count = 996,
        cmd = "nix-shell shell.nix",
        direction = "float",
        hidden = true,
    })
  '';
}
