{ pkgs, ... }:

{
  extra.packages = [ pkgs.vimPlugins.cellular-automaton-nvim ];

  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>br";
    action = "<Cmd>CellularAutomaton make_it_rain<CR>";
    options.desc = "Break the code?????!???!?!";
  }];
}
