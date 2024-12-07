_:

# FIXME: this is entirely wrong

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
          local term_name = rndname()
          vim.cmd(t.id .. "ToggleTermSetName " .. term_name)
        end
      '';
    };
  };

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader><leader>";
      action = "<Cmd>ToggleTerm direction=float<CR>";
      options.desc = "Open floating terminal";
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
      mode = [ "n" "t" ];
      key = "<Leader>tn";
      action.__raw = ''
        function()
          local curterm = require("toggleterm.terminal").get_focused_id()
          if curterm ~= nil then
            vim.cmd(curterm .. "ToggleTermSetName")
          end
        end
      '';
      options.desc = "Rename current terminal";
    }

    {
      mode = [ "n" "t" ];
      key = "<Leader>tl";
      action = "<cmd>TermSelect<cr>";
      options.desc = "List terminals";
    }
  ];

  extraConfigLua = ''
    local Terminal = require('toggleterm.terminal').Terminal

    local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true,
    })

    local gef = Terminal:new({
        cmd = "gef",
        direction = "float",
        hidden = true,
    })

    local zsh = Terminal:new({
        cmd = "zsh",
        direction = "float",
        hidden = true,
    })

    local shell = Terminal:new({
        cmd = "nix-shell shell.nix",
        direction = "float",
    })

    function LazyTermToggle() lazygit:toggle() end
    function GefTermToggle() gef:toggle() end
    function ZshTermToggle() zsh:toggle() end
    function ShellTermToggle()
        local cwd = vim.fn.getcwd()
        local shell_path = vim.fn.expand(cwd .. '/shell.nix')
        if vim.fn.filereadable(shell_path) == 1 then
            shell:toggle()
        else
            ErrorUser("File «shell.nix» does not " ..
                "exist in the current directory!", 2500)
        end
    end
  '';
}

# -- Set the keymaps for whenever a terminal is opened
# Autocmd("TermOpen", "float_term", function()
#     vim.cmd("lua set_terminal_keymaps()")
# end)

# function _G.set_terminal_keymaps()
#     require("which-key").add({
#         mode = { "t" },
#         { "<C-D>", "<Cmd>wincmd h<CR>", desc = "Terminal exit kemap" }
#     })
# end

