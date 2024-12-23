{ lib, pkgs, ... }:

let special_event_color = "#880E4F";
in {
  extra.packages = [ (import ./package.nix { inherit lib pkgs; }) ];

  rootOpts.extraConfigLua = ''
    require('ftFT').setup({
      keys = {"f", "t", "F", "T"},
      modes = {"n", "v"},
      hl_group = "ftFT",
      sight_hl_group = ""
    })
  '';

  rootOpts.autoCmd = [{
    desc = "Colorize ftFT for easier jumping";
    callback.__raw = ''
      function()
        vim.cmd('hi ftFT guibg=none guifg=${special_event_color}')
      end
    '';
    event = [ "BufEnter" "BufWritePre" ];
  }];
}
