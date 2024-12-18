_:

let c_or_cpp = "c";
in {
  rootOpts.plugins.lsp.servers.ccls.enable = true;

  rootOpts.plugins.dap = {
    adapters = {
      executables.gdb = {
        command = "gdb";
        args =
          [ "--interpreter=dap" "--eval-command" "-enable-pretty-printing" ];
      };
      executables.cc = { # BUG: not working
        command = "cc";

        args = [
          "-g"
          "-o"
          "\${fileDirname}/\${fileBasenameNoExtension}"
        ];
      };
    };

    configurations = {
      c = [
        {
          name = "Debug (gdb)";
          type = "gdb";
          program = "\${fileBasenameNoExtension}";
          request = "launch";
        }

        {
          name = "Compile (cc)";
          type = "cc";
          program = "\${file}";
          request = "launch";
        }

        {
          name = "Make (all)";
          type = "shell";
          command = "make";
          args = [ "all" ];
          cwd = "\${workspaceFolder}";
          request = "launch";
        }
      ];
    };

    # extensions.dap-???.enable = true;
    # # whatever extension is useful for C/C++/C#
  };

  rootOpts.extraConfigLua = ''
    if ${c_or_cpp} == "c" then
      vim.g.c_syntax_for_h = 1
    elseif ${c_or_cpp} == "cpp" then
      vim.g.c_syntax_for_h = 0
    end
  '';

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
