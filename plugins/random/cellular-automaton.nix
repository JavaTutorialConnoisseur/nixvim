{pkgs, ...}: {
  extra.packages = [pkgs.vimPlugins.cellular-automaton-nvim];

  rootOpts.plugins.which-key.settings.spec = [
    {
      mode = "n";
      __unkeyed-1 = "<leader>br";
      __unkeyed-2 = "<Cmd>CellularAutomaton make_it_rain<CR>";
      desc = "Break the code?!???!?!";
      icon = {
        icon = " ";
        color = "cyan";
      };
    }
  ];
}
