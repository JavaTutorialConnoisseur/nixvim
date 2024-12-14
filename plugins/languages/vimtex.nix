{ pkgs, ... }:

{
  opts = {
    enable = true;
    texlivePackage = pkgs.texliveFull;
    settings = {
      compiler_method = "latexmk -pdf";
      view_general_viewer = "okular";
      view_general_options = "--unique file:@pdf#src:@line@tex";
    };
  };

  rootOpts.autoCmd = [{
    callback.__raw = ''
      function()
        vim.cmd(":iunmap <silent><buffer><expr> ]]")
      end
    '';

    event = [ "FileType" ];
    pattern = [ "tex" ];
    desc = "Remove the annoying ]] binding";
  }];

  rootOpts.extraPackages = [ pkgs.texlivePackages.latexmk ];
  rootOpts.plugins.transparent.settings.extra_groups = [ "VimtexMsg" ];

  # TODO: add / label keybinds for compilation?
  #   -> maybe add a lualine feature or something?

  # Motions (link to GIF demonstrations)
  #
  #     Move between section boundaries with [[, [], ][, and ]]
  #     Move between environment boundaries with [m, [M, ]m, and ]M
  #     Move between math environment boundaries with [n, [N, ]n, and ]N
  #     Move between frame environment boundaries with [r, [R, ]r, and ]R
  #     Move between comment boundaries with [* and ]*
  #     Move between matching delimiters with %

  # Text objects (link to GIF demonstrations)
  #
  #     ic ac Commands
  #     id ad Delimiters
  #     ie ae LaTeX environments
  #     i$ a$ Math environments
  #     iP aP Sections
  #     im am Items

  # Other mappings (link to GIF demonstrations)
  #
  #     ! Delete the surrounding command, environment or delimiter with dsc/dse/ds$/dsd
  #     ! Change the surrounding command, environment or delimiter with csc/cse/cs$/csd
  #     ! Toggle starred command or environment with tsc/tse

  #     Toggle inline and displaymath with ts$
  #     | Toggle between e.g. () and \left(\right) with tsd
  #     Toggle (inline) fractions with tsf
  #     Toggle line-break macro \\ with tsb

  #     -> change to diff! Close the current environment/delimiter in insert mode with ]]
  #     -> change to diff! Insert new command with <F7>

  #     ? Convenient insert mode mappings for faster typing of e.g. maths
  #     ? Context menu on citations (e.g. \cite{...}) mapped to <cr>

}
