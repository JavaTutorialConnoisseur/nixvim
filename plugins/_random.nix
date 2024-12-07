{ pkgs, ... }:

# TODO: [later] make a highlight-current-lines version of the prettyprint cmds

let
  silicon_fmtstr = ''
    silicon --window-title %s --background "#fff0" %s --output %s-full-%s.png'';
  silicon_line_fmtstr = ''
    silicon --window-title %s --line-offset %i --background "#fff0" %s --output %s-section-%s.png'';
in {
  rootOpts.extraPackages = [ pkgs.silicon ];

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>pa";
      options.desc = "Pretty-print full file w/ Silicon";
      action = "<cmd>PrettyPrintFile<cr>";
    }

    {
      mode = "v";
      key = "<leader>pl";
      options.desc = "Pretty-print selected lines w/ Silicon";
      action = "<cmd>PrettyPrintLines<cr>";
    }
  ];

  rootOpts.userCommands = {
    PrettyPrintFile = {
      command.__raw = ''
        function()
          local relative_path = vim.fn.expand('%:.')
          local file_name = vim.fn.expand('%:t')
          local current_time = os.date("%Y.%m.%d_%H.%M.%S")

          local pretty_print_fn = string.format(
              '${silicon_fmtstr}', file_name,
              relative_path, file_name, current_time)

          os.execute(pretty_print_fn)
        end
      '';
      desc = "Prints whole file using 'silicon'.";
    };

    PrettyPrintLines = {
      range = true;
      command.__raw = ''
        function()
          local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")

          local file_name = vim.fn.expand('%:t')
          local file_extension = vim.fn.expand('%:e')
          local current_time = os.date("%Y.%m.%d_%H.%M.%S")

          local temp_file = "/tmp/pretty_print_selection." .. file_extension
          local lines = vim.fn.getline(start_line, end_line)

          local file = io.open(temp_file, "w")
          if file then
              for _, line in ipairs(lines) do
                  file:write(line .. "\n")
              end
              file:close()
          else
              print("Error: Unable to create temporary file.")
              return
          end

          local pretty_print_fn = string.format(
              '${silicon_line_fmtstr}',
              file_name, start_line, temp_file, file_name, current_time)

          local result = os.execute(pretty_print_fn)
          os.remove(temp_file)

          if result ~= 0 then
              print(result)
          end
        end
      '';
      desc = "Prints lines from current selection using 'silicon'."
        + "Input list of indices for highlighting.";
    };
  };
}
