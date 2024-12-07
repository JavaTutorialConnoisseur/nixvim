_:

# TODO: Customize section names
# settings.spec = [{
#   "<leader>b".name = "${icons.Tab} Buffers";
#   "<leader>bs".name = "${icons.Sort} Sort Buffers";
#   "<leader>d".name = "${icons.Debugger} Debugger";
#   "<leader>f".name = "${icons.Search} Find";
#   "<leader>g".name = "${icons.Git} Git";
#   "<leader>l".name = "${icons.ActiveLSP} Language Tools";
#   "<leader>m".name = " Markdown";
#   "<leader>s".name = "${icons.Session} Session";
#   "<leader>t".name = "${icons.Terminal} Terminal";
#   "<leader>u".name = "${icons.Window} UI/UX";
# }];

# local wk_icon = { icon = "", color = "green" }
# local zen_icon = { icon = "󱅻 ", color = "azure" }
# local nvimtree_icon = { icon = "", color = "red" }

# { "<leader>c",  group = "Code analysis" },
# { "<leader>r", group = "Rename", icon = { icon = "󰛔", color = "grey" } },
# { "<leader>d",        group = "Diagnostics" },
# { "<leader>b",       group = "Buffers" },
# { "<leader>bo",      group = "Ordering" },
# { "<leader>q",       group = "Exiting" },
# { "<leader>b#",      desc = "Move to buffer 0-9" },
# { "<leader>n",        group = "Notifications" },
# { "<leader>g",        group = "Searching" },

{
  opts = {
    enable = true;
    settings = {
      win.border = "rounded";

      keys = {
        scroll_down = "<M-[>";
        scroll_up = "<M-]>";
      };

      sort = [ "manual" "local" "order" "group" "alphanum" "mod" ];
      disable.ft = [ "TelescopePrompt" "neo-tree" "neo-tree-popup" ];
    };
  };

  rootOpts.autoCmd = [{
    callback.__raw = ''
      function(state)
        local buf = state.buf
        local keys = require('which-key')
        vim.bo[buf].buflisted = false

        keys.add({
          buffer = buf,
          { "q",
            "<cmd>close<cr>",
            desc = "Close q-closable buffer"
          },
        })
      end'';
    event = [ "FileType" ];
    pattern = [
      "PlenaryTestPopup"

      "checkhealth"
      "help"
      "query"
      "lspinfo"
      "man"

      "notify"
      "qf" # what is this pattern?

      # NOTE: When I decide to add neotest:
      # "neotest-output"
      # "neotest-summary"
      # "neotest-output-panel"
    ];
    desc = "Allows for closing specific filetypes w/ just 'q'";
  }];

  rootOpts.colorschemes.catppuccin.settings.integrations.which_key = true;
}
