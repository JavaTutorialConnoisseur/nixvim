{ pkgs, ... }:

{
  extra.packages = [ pkgs.vimPlugins.godbolt-nvim ];
}
