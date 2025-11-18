{pkgs, ...}: {
  # BUG: automatic highlighting here seems kinda broken
  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>cC";
      action = "<Cmd>GodboltCompiler telescope<CR>";
      options.desc = "Compile w/ Godbolt";
    }
  ];

  extra.packages = [pkgs.vimPlugins.godbolt-nvim];
}
