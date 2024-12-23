_:

let c_or_cpp = "c";
in {
  rootOpts.plugins.lsp.servers.ccls.enable = true;

  rootOpts.plugins.dap = {
    adapters.executables.gdb = {
      command = "gdb";
      args = [ "--interpreter=dap" ''--eval-command="set print pretty on"'' ];
    };

    configurations = {
      c = [{
        name = "Launch";
        type = "gdb";
        request = "launch";
        program.__raw = ''
          function()
            return vim.fn.input('Path to executable: ',
              vim.fn.getcwd() .. '/', 'file')
          end
        '';
        args.__raw = ''
          function()
            local inp = vim.fn.input('Input arguments: ')

            local gdbArgs = {}
            for word in string.gmatch(inp, "%S+") do
              table.insert(gdbArgs, word)
            end

            return gdbArgs
          end
        '';
        cwd = "\${workspaceFolder}";
        stopAtBeginningOfMainSubprogram = true;
      }];
    };
  };

  rootOpts.extraConfigLua = ''
    if ${c_or_cpp} == "c" then
      vim.g.c_syntax_for_h = 1
    elseif ${c_or_cpp} == "cpp" then
      vim.g.c_syntax_for_h = 0
    end
  '';

  rootOpts.userCommands = {
    Make = {
      command.__raw = ''
        function()
          local result = vim.fn.system("make all")

          if vim.v.shell_error ~= 0 then
              print("Make (all) failed: " .. result)
          end
        end
      '';
      desc = "Try running 'make all'";
    };
    CC = {
      nargs = "?";
      command.__raw = ''
        function(opts)
          local filename = vim.fn.expand('%:t')
          local filepath = vim.fn.expand('%:p')

          local extension = vim.fn.fnamemodify(filename, ':e')

          local valid_extensions = { 'c', 'o', 's', 'S' }
          local is_valid = false
          for _, ext in ipairs(valid_extensions) do
              if extension == ext then
                  is_valid = true
                  break
              end
          end

          if not is_valid then
              print("Error: Invalid file extension.")
              return
          end

          local debug_flag = ""
          if opts.fargs[1] == "debug" then
              debug_flag = "-g"
          end

          local output_filepath = vim.fn.fnamemodify(filepath, ':r')
          local command = string.format("cc %s -o %s %s",
            debug_flag, output_filepath, filepath)
          local result = vim.fn.system(command)

          if vim.v.shell_error ~= 0 then
              print("Compilation failed: " .. result)
          end
        end
      '';
      desc = "Compile current file using 'cc'";
    };
  };

  rootOpts.autoCmd = [{
    callback.__raw = ''
      function()
        vim.cmd [[
          setlocal tabstop=2
          setlocal shiftwidth=2
        ]]
      end
    '';
    event = [ "FileType" ];
    pattern = [ "c" "h" ];
    desc = "Set tab and indent length for C files to 2";
  }];
}
