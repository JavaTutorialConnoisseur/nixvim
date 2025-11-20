{pkgs, ...}: {
  extra.plugins = [pkgs.vimPlugins.cellular-automaton-nvim];

  root.keymaps = [
    {
      key = "<leader>br";
      action = "<cmd>CellularAutomaton make_it_rain<cr>";
    }
  ];

  root.plugins.which-key.settings.spec = [
    {
      mode = "n";
      __unkeyed-1 = "<leader>br";
      desc = "Break the code?!???!?!";
      icon = {
        icon = " ";
        color = "cyan";
      };
    }
  ];
}
