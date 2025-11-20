_: {
  opts = {
    enable = true;

    settings = {
      direction = "float";
      float_opts.border = "rounded";
      size = 60;
      # shading_factor = 2;
      shade_terminals = false;

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
            vim.keymap.set({ "n", "t", "i" }, "<f7>", function()
              t:toggle()
            end, { desc = "Toggle terminal", buffer = t.bufnr })
          end
          local term_name = "ToggleTermBuf" .. tostring(t.bufnr)
          vim.cmd(t.id .. "ToggleTermSetName " .. term_name)
        end
      '';
    };
  };

  root.plugins.transparent.settings.extra_groups = ["ToggleTerm1Normal"];
  root.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader><leader>";
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

  root.keymaps = [
    {
      mode = "n";
      key = "<f7>";
      action = "<cmd>execute v:count . 'ToggleTerm'<cr>";
      options.desc = "Toggle terminal";
    }

    {
      mode = "t";
      key = "<f7>";
      action = "<cmd>ToggleTerm<cr>";
      options.desc = "Toggle terminal";
    }

    {
      mode = "i";
      key = "<f7>";
      action = "<esc><cmd>ToggleTerm<cr>";
      options.desc = "Toggle terminal";
    }

    {
      mode = "t";
      key = "<esc><esc>";
      action = "<c-\\><c-n>";
      options.desc = "Switch to normal mode";
    }

    {
      mode = "t";
      key = "<esc><cr>";
      action = "<esc>";
      options.desc = "Send 'escape' key";
    }

    {
      mode = ["n"];
      key = "<leader>ts";
      action = "<cmd>TermSelect<cr>";
      options.desc = "Select terminal";
    }

    {
      mode = ["n"];
      key = "<leader><leader>";
      action = "<cmd>ZshTermToggle<cr>";
      options.desc = "Zsh";
    }

    {
      mode = ["n"];
      key = "<leader>tl";
      action = "<cmd>LazyGitTermToggle<cr>";
      options.desc = "Lazygit";
    }

    {
      mode = ["n"];
      key = "<leader>tg";
      action = "<cmd>GefTermToggle<cr>";
      options.desc = "[gdb] + GEF";
    }

    {
      mode = ["n"];
      key = "<leader>tv";
      action = "<cmd>MiniZshTermToggle<cr>";
      options.desc = "vertical split terminal";
    }

    {
      mode = ["n"];
      key = "<leader>tn";
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

  root.keymapsOnEvents = {
    TermOpen = [
      {
        mode = ["t"];
        key = "<c-d>";
        action = "<cmd>wincmd h<cr>";
        options.desc = "Terminal exit keymap";
      }
    ];
  };

  root.userCommands = let
    lazyGitTermCount = "10";
    zshTermCount = "11";
    miniZshTermCount = "12";
    gefTermCount = "13";

    createTerminal = {
      count,
      name,
      cmd,
      direction ? "float",
    }: ''
      local Terminal = require('toggleterm.terminal').Terminal

      local term = Terminal:new({
        display_name = "[${name}]",
        count = "${count}",
        cmd = "${cmd}",
        direction = "${direction}",
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

    toggleTerm = {term, ...}: ''
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

    MiniZshTermToggle = {
      command.__raw = ''
        ${toggleTerm {
          term = {
            name = "vertical";
            cmd = "SET_ZSH_MINI=true zsh";
            count = miniZshTermCount;
            direction = "vertical";
          };
        }}
      '';
      desc = "Toggles the zsh vertical terminal.";
    };
  };
}
