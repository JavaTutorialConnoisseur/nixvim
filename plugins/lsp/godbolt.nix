{pkgs, ...}: {
  root.keymaps = [
    {
      mode = "n";
      key = "<leader>cC";
      action = "<Cmd>GodboltCompiler telescope<CR>";
      options.desc = "Compile w/ Godbolt";
    }
  ];

  extra.plugins = [pkgs.vimPlugins.godbolt-nvim];
}
