_:

{
  opts = {
    enable = true;
    enableCmdlineEnter = true;
    beforeCursor = true;
    modes = [ "/" "?" ":" ];

    renderer = ''
      wilder.wildmenu_renderer(
        wilder.wildmenu_lightline_theme({
          highlights = {
            gradient = (function()
              local colors = {
                '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
                '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
                '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
                '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
              }
              local gradient = {}
              for i, fg in ipairs(colors) do
                  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {
                      { a = 1 },
                      { a = 1 },
                      { foreground = fg },
                  })
              end
              return gradient
            end)(),
            separator = 'WilderSeparator',
            default = 'WilderDefault',
          },
          highlighter = wilder.highlighter_with_gradient({
            wilder.basic_highlighter(),
          }),
          separator = ' | ',
        })
      )
    '';
  };
}
