_: {
  opts = {
    enable = true;
    settings.extra.eol = "<leader>>";

    settings.toggler = {
      line = "<leader>/";
      block = "<leader>\\";
    };

    settings.opleader = {
      line = "<leader>/";
      block = "<leader>\\";
    };
  };

  rootOpts.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>|";
      group = "Uncomment custom area";
      icon = " ";
    }

    {
      __unkeyed-1 = "<leader>/";
      group = "Toggle line comment";
      icon = " ";
    }

    {
      __unkeyed-1 = "<leader>\\";
      group = "Toggle block comment";
      icon = " ";
    }

    {
      __unkeyed-1 = "<leader>>";
      group = "Add end-of-line comment";
      icon = " ";
    }
  ];

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>|";
      options.desc = "Uncomment contiguous line-comment area.";
      action.__raw = ''
        function()
          local curr = vim.api.nvim_get_current_line()
          local curr_linenr = vim.api.nvim_win_get_cursor(0)[1]
          local line_count = vim.api.nvim_buf_line_count(0)

          local ft = vim.bo.filetype
          local linewise = require('Comment.utils').ctype.linewise
          local comment_fmt, _ = require('Comment.ft').get(ft, linewise):gsub("%%s", "")
          local is_commented = require('Comment.utils').is_commented(comment_fmt, "")

          if not is_commented(curr) then
            vim.notify("The current line is not commented", vim.log.levels.WARN, {
              title = "Comment.nvim",
              timeout = 1000 })
            return
          end

          local start_line = curr_linenr
          while start_line > 1 do
              start_line = start_line - 1
              local line_above = vim.api.nvim_buf_get_lines(0, start_line - 1, start_line, false)[1]

              if not is_commented(line_above) then
                  start_line = start_line + 1
                  break
              end
          end

          local end_line = curr_linenr
          while end_line < line_count do
              end_line = end_line + 1
              local line_below = vim.api.nvim_buf_get_lines(0, end_line - 1, end_line, false)[1]

              if not is_commented(line_below) then
                  end_line = end_line - 1
                  break
              end
          end

          local win_id = vim.api.nvim_get_current_win()
          vim.api.nvim_win_set_cursor(win_id, {start_line, 0})
          vim.cmd("normal! V")
          vim.api.nvim_win_set_cursor(win_id, {end_line, 0})
          vim.api.nvim_feedkeys("gc", "v", true)

          vim.notify("Uncommented lines in the range [" .. start_line .. ", " .. end_line .. "]", vim.log.levels.INFO, {
            title = "Comment.nvim",
            timeout = 1000 })
        end
      '';
    }
  ];
}
