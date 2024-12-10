{ lib, pkgs, ... }:

# BUG: figure out how to make this not screw up tagbar
# TODO: [later] un-hardcode #AF87FF
let special_event_color = "#AF86FF";
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
        vim.cmd('hi ftFT guifg=black guibg=${special_event_color}')
      end
    '';
    event = [ "BufEnter" "BufWritePre" ];
  }];
}
