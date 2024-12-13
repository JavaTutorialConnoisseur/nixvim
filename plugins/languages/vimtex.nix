{ pkgs, ... }:

{
  opts = {
    enable = true;
    settings = {
      compiler_method = "latexmk -pdf";
      view_general_viewer = "okular";
      view_general_options = "--unique file:@pdf#src:@line@tex";
    };
  };

  # TODO: add / label keybinds for compilation?

  rootOpts.extraPackages = [ pkgs.texliveBasic ];
  rootOpts.plugins.transparent.settings.extra_groups = [ "VimtexMsg" ];
}
