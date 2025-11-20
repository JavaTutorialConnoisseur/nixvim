_: {
  opts = {
    enable = true;
    settings.show_success_message = true;
  };

  root.plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>cp";
      group = "Printing (printf | var | clean)";
      icon = " ";
    }
  ];

  root.keymaps = [
    {
      mode = "n";
      key = "<leader>cpf";
      action.__raw = ''
        function()
          require('refactoring').debug.printf({below = false})
        end
      '';
      options.desc = "Print whenever this function is called";
    }

    {
      mode = ["n" "x"];
      key = "<leader>cpv";
      action.__raw = ''
        function()
          require('refactoring').debug.print_var()
        end
      '';
      options.desc = "Print variable contents";
    }

    {
      mode = "n";
      key = "<leader>cpc";
      action.__raw = ''
        function()
          require('refactoring').debug.cleanup({})
        end
      '';
      options.desc = "Clean all generated var prints";
    }

    {
      mode = ["n" "x"];
      key = "<leader>cR";
      action.__raw = ''
        function()
          local ft = vim.fn.expand("%:e")
          local refactorable = {
            ts = true, js = true, lua = true,
            c = true, cpp = true, go = true, cs = true,
            py = true, java = true,
            php = true, rb = true,
          }

          if not refactorable[ft] then
            vim.notify("Filetype <" .. ft .. "> is not refactorable...", "error")
          else
            TelescopeWithTheme("refactors", {cmd = path}, "refactoring")
          end
        end
      '';
      options.desc = "Choose refactoring";
    }
  ];

  root.extraConfigLuaPre = ''
    require("telescope").load_extension("refactoring")
  '';
}
