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
            vim.keymap.set({ "n", "t", "i" }, "<F7>", function()
              t:toggle()
            end, { desc = "Toggle terminal", buffer = t.bufnr })
          end
          local term_name = "ToggleTermBuf" .. tostring(t.bufnr)
          vim.cmd(t.id .. "ToggleTermSetName " .. term_name)
        end
      '';
    };
  };

  rootOpts.plugins.transparent.settings.extra_groups = [ "ToggleTerm1Normal" ];
  rootOpts.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader><leader>";
      __unkeyed-2 = "<cmd>ZshTermToggle<cr>";
      desc = "Zsh";
      icon = {
        icon = "󱆃 ";
        color = "purple";
      };
      mode = "n";
    }

    {
      __unkeyed-1 = "<leader>t";
      group = "Terminals | TODO's";
      icon = {
        icon = " ";
        color = "purple";
      };
    }
  ];

  rootOpts.keymaps = [
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
      mode = "t";
      key = "<Esc><cr>";
      action = "<esc>";
      options.desc = "Send 'escape' key";
    }

    {
      mode = [ "n" ];
      key = "<Leader>ts";
      action = "<cmd>TermSelect<cr>";
      options.desc = "Select terminal";
    }

    {
      mode = [ "n" ];
      key = "<Leader>tl";
      action = "<cmd>LazyGitTermToggle<cr>";
      options.desc = "Lazygit";
    }

    {
      mode = [ "n" ];
      key = "<Leader>tg";
      action = "<cmd>GefTermToggle<cr>";
      options.desc = "[gdb] + GEF";
    }

    {
      mode = [ "n" ];
      key = "<leader>tk";
      action = "<cmd>NixShellTermToggle<cr>";
      options.desc = "Nix-shell";
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

  rootOpts.keymapsOnEvents = {
    TermOpen = [{
      mode = [ "t" ];
      key = "<C-D>";
      action = "<cmd>wincmd h<cr>";
      options.desc = "Terminal exit keymap";
    }];
  };

  rootOpts.userCommands = let
    nixShellTermCount = "999";
    lazyGitTermCount = "998";
    zshTermCount = "997";
    gefTermCount = "996";

    createTerminal = { count, name, cmd }: ''
      local Terminal = require('toggleterm.terminal').Terminal

      local term = Terminal:new({
        display_name = "[${name}]",
        count = "${count}",
        cmd = "${cmd}",
        direction = "float",
        hidden = true,
        close_on_exit = true,
      })
    '';

    termExists = ''
      local function terminal_exists(count)
        local terminals = require("toggleterm.terminal").get_all()
        for _, term in ipairs(terminals) do
            if term.id == count then
                return term
            end
        end
        return nil
      end
    '';

    toggleTerm = { term, ... }: ''
      function()
        ${termExists}

        local termCount = ${term.count}
        local term = terminal_exists(termCount)

        if term then
          vim.cmd(term.id .. "ToggleTermSetName ${term.name}")
          term:toggle()
        else
          ${createTerminal term}
          term:toggle()
        end
      end'';
  in {
    NixShellTermToggle = {
      command.__raw = ''
        function()
          local cwd = vim.fn.getcwd()
          local shell_path = vim.fn.expand(cwd .. '/shell.nix')

          if vim.fn.filereadable(shell_path) == 1 then
            local fn = ${
              toggleTerm {
                term = {
                  name = "nix-shell";
                  cmd = "nix-shell shell.nix";
                  count = nixShellTermCount;
                };
              }
            }

            fn()
          else
            vim.notify("File «shell.nix» does not " ..
              "exist in the current directory!", "error")
          end
        end
      '';
      desc = "Toggles the Nix Shell terminal.";
    };

    LazyGitTermToggle = {
      command.__raw = ''
        function()
          local cwd = vim.fn.getcwd()
          local gitpath = vim.fn.expand(cwd .. '/.git')

          if vim.fn.isdirectory(gitpath) == 1 then
            local fn = ${
              toggleTerm {
                term = {
                  name = "lazygit";
                  cmd = "lazygit";
                  count = lazyGitTermCount;
                };
              }
            }

            fn()
          else
            vim.notify("«.git» directory does not " ..
              "exist in the current workspace!", "error")
          end
        end
      '';
      desc = "Toggles the lazygit terminal.";
    };

    GefTermToggle = {
      command.__raw = ''
        ${toggleTerm {
          term = {
            name = "gef (gdb)";
            cmd = "gef";
            count = gefTermCount;
          };
        }}
      '';
      desc = "Toggles the gef (gdb) terminal.";
    };

    ZshTermToggle = {
      command.__raw = ''
        ${toggleTerm {
          term = {
            name = "zsh";
            cmd = "zsh";
            count = zshTermCount;
          };
        }}
      '';
      desc = "Toggles the zsh terminal.";
    };
  };
}
