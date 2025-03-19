{ themeColors, ... }:

let special_event_color = "#${themeColors.visual}";
in {
  autoCmd = [
    {
      desc = "Set spelling and line wrapping for text-adjacent files";
      callback.__raw = ''
        function()
          vim.opt_local.wrap = true
          vim.opt_local.spell = true
        end
      '';
      event = [ "FileType" ];
      pattern = [ "text" "gitcommit" "markdown" "tex" ];
    }

    {
      desc = "Set highlights for line numbers";
      callback.__raw = ''
        function()
          vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "gray" })
          vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "gray" })
          vim.api.nvim_set_hl(0, 'LineNr', { fg = "white" })
        end
      '';
      event = [ "BufEnter" "BufWritePre" ];
    }

    {
      desc = "Set highlights for postspace";
      callback.__raw = ''
        function()
          vim.cmd('hi ExtraWhitespace guifg=${special_event_color}')
          vim.cmd('match ExtraWhitespace /\\s\\+$/')
        end
      '';
      event = [ "BufEnter" "BufWritePre" ];
    }

    {
      desc = "Highlight on yank";
      callback.__raw = ''
        function()
          vim.cmd(string.format('hi %s guifg=%s guibg=%s', 'YankHighlight', 'black', '${special_event_color}'))
          vim.highlight.on_yank({ higroup = 'YankHighlight', timeout = 150 })
        end
      '';
      event = [ "TextYankPost" ];
    }

    {
      desc = "Check if we need to reload the file when it changed";
      callback.__raw = ''
        function()
          vim.cmd("checktime")
        end'';
      event = [ "FocusGained" "TermClose" "TermLeave" ];
    }

    {
      desc = "resize splits if window got resized";
      callback.__raw = ''
        function()
          local current_tab = vim.fn.tabpagenr()
          vim.cmd("tabdo wincmd =")
          vim.cmd("tabnext " .. current_tab)
        end
      '';
      event = [ "VimResized" ];
    }
  ];

  userCommands = {
    RemoveTrailingWhitespace = {
      desc = "";
      command.__raw = ''
        function()
          if vim.bo.modifiable then
            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            local total_lines = vim.api.nvim_buf_line_count(0)

            vim.cmd([[ %s/\s\+$//e ]])
            vim.cmd([[ :noh ]])

            assert(total_lines == vim.api.nvim_buf_line_count(0),
                "line counts should not change when removing trailing whitespace...")

            vim.api.nvim_win_set_cursor(0, cursor_pos)
          end
        end
      '';
    };
  };
}
