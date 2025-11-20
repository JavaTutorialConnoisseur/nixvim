{pkgs, ...}: {
  root.keymaps = [
    {
      mode = "n";
      key = "<leader>cC";
      action = "<cmd>GodboltCompiler telescope<cr>";
      options.desc = "Compile w/ Godbolt";
    }
  ];

  extra.plugins = [pkgs.vimPlugins.godbolt-nvim];
}
