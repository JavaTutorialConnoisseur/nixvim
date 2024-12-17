_:

{
  opts = {
    enable = true;
    settings.show_success_message = true;
  };

  rootOpts.plugins.which-key.settings.spec = [{
    __unkeyed-1 = "<leader>cp";
    group = "Printing (printf | var | clean)";
    icon = "";
  }];

  rootOpts.keymaps = [
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
      mode = [ "n" "x" ];
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
  ];

  rootOpts.extraConfigLua = ''
    require("telescope").load_extension("refactoring")

    vim.keymap.set(
      {"n", "x"},
      "<leader>cR",
      function() require('telescope').extensions.refactoring.refactors() end,
      { desc = "Choose refactoring", }
    )
  '';
}
