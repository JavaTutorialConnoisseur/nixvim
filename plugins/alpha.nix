_:

let
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

  mkButton = { key, fn, icon, dscr }: {
    on_press = { __raw = "function() ${fn} end"; };
    opts = {
      shortcut = key;
      position = "center";
      hl = "AlphaButtons";
    };
    type = "button";
    val = "  ${icon}  ${dscr}";
  };

  # FIXME: make this work (buttons work, keys don't trigger them)

  buttons = {
    type = "group";
    opts.spacing = 1;
    val = [
      (mkButton {
        key = "n";
        fn =
          "vim.api.nvim_set_current_buf(vim.api.nvim_create_buf(false, true))";
        icon = "";
        dscr = "new file";
      })

      (mkButton {
        key = "r";
        fn = "vim.cmd('Telescope oldfiles')";
        icon = "";
        dscr = "recent files";
      })

      (mkButton {
        key = "f";
        fn = "vim.cmd('Telescope find_files')";
        icon = "󰥨";
        dscr = "find file";
      })

      (mkButton {
        key = "t";
        fn = "vim.cmd('Telescope live_grep')";
        icon = "";
        dscr = "live grep";
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
    layout = [ winheight-padding header (padding 2) buttons (padding 4) ];
  };

  rootOpts = {
    autoGroups.alpha = { };
    autoCmd = [{
      desc = "Disable status, tablines and cmdheight for alpha";
      event = [ "User" "BufWinEnter" ];
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
    }];

    colorschemes.catppuccin.settings = { integrations.alpha = true; };

    keymaps = [{
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
    }];
  };
}
