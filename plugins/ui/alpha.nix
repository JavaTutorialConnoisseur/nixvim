_: let
  winheight-padding = {
    type = "padding";
    val.__raw = "vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }";
  };

  padding = val: {
    type = "padding";
    val = val;
  };

  header = {
    type = "text";
    opts = {
      hl = "AlphaHeader";
      position = "center";
    };
    val = [
      "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
      "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
      "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
      "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
      "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
      "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
      "... or [better nee-oh-vyhm] ┬─┬ ノ( ゜-゜ノ)"
    ];
  };

  mkButton = {
    key,
    fn,
    icon,
    dscr,
  }: {
    on_press.__raw = ''
      function()
        ${fn}
      end'';
    opts = {
      keymap = [
        "n"
        key
        "<cmd>lua ${fn}<cr>"
        {
          noremap = true;
          silent = true;
          nowait = true;
        }
      ];
      shortcut = key;
      position = "center";
      hl = "AlphaButtons";
    };
    type = "button";
    val = "  ${icon}  ${dscr}";
  };

  buttons = {
    type = "group";
    opts.spacing = 1;
    val = [
      (mkButton {
        key = "n";
        fn = "vim.api.nvim_set_current_buf(vim.api.nvim_create_buf(false, true))";
        icon = "";
        dscr = "new file";
      })

      (mkButton {
        key = "t";
        fn = "TelescopeWithTheme('live_grep', {cmd = path}, '')";
        icon = "";
        dscr = "live grep";
      })

      (mkButton {
        key = "f";
        fn = "TelescopeWithTheme('find_files', {cmd = path}, '')";
        icon = "󰥨";
        dscr = "find file";
      })

      (mkButton {
        key = "r";
        fn = "TelescopeWithTheme('oldfiles', {cmd = path}, '')";
        icon = "";
        dscr = "recent files";
      })

      (mkButton {
        key = "s";
        fn = "TelescopeWithTheme('persisted', {cmd = path}, 'persisted')";
        icon = "";
        dscr = "find sessions";
      })

      (mkButton {
        key = "q";
        fn = "vim.cmd('qa')";
        icon = "";
        dscr = "quit";
      })
    ];
  };
in {
  opts = {
    enable = true;
    layout = [winheight-padding header (padding 2) buttons (padding 4)];
  };

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>hs";
      options.desc = "Home screen";
      action.__raw = ''
        function()
          local wins = vim.api.nvim_tabpage_list_wins(0)
          if #wins > 1 and vim.bo[vim.api.nvim_win_get_buf(wins[1])].filetype == "neo-tree" then
            vim.fn.win_gotoid(wins[2])
          end
          require("alpha").start(false)
        end
      '';
    }
  ];

  rootOpts = {
    autoGroups.alpha = {};
    autoCmd = [
      {
        desc = "Disable status, tablines and cmdheight for alpha";
        event = ["User" "BufWinEnter"];
        group = "alpha";

        callback.__raw = ''
          function(event)
            if
              (
                (event.event == "User" and event.file == "AlphaReady")
                or (event.event == "BufWinEnter" and vim.bo[event.buf].filetype == "alpha")
              ) and not vim.g.before_alpha
            then
              vim.g.before_alpha = {
                showtabline = vim.opt.showtabline:get(),
                laststatus = vim.opt.laststatus:get(),
                cmdheight = vim.opt.cmdheight:get(),
              }
              vim.opt.showtabline, vim.opt.laststatus, vim.opt.cmdheight = 0, 0, 0
            elseif vim.g.before_alpha and event.event == "BufWinEnter" and vim.bo[event.buf].buftype ~= "nofile" then
              vim.opt.laststatus, vim.opt.showtabline, vim.opt.cmdheight =
                vim.g.before_alpha.laststatus, vim.g.before_alpha.showtabline, vim.g.before_alpha.cmdheight
              vim.g.before_alpha = nil
            end
          end
        '';
      }
    ];

    colorschemes.catppuccin.settings.integrations.alpha = true;
  };
}
