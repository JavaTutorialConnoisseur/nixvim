_:

let
  addIcon = key:
    { name, icon ? "" }: {
      __unkeyed-1 = key;
      group = name;
      icon = icon;
    };
in {
  opts = {
    enable = true;
    settings = {
      win.border = "rounded";

      keys = {
        scroll_down = "<M-[>";
        scroll_up = "<M-]>";
      };

      sort = [ "group" "alphanum" ];
      disable.ft = [ "TelescopePrompt" "neo-tree" "neo-tree-popup" ];

      # color (string): the color to use for the icon (optional) valid colors are: 
      #     azure, blue, cyan, green, grey, orange, purple, red, yellow
      spec = [
        # TODO: move these to relevant plugins maybe? idk maybe not
        #       + code analysis internals
        #       + diagnostics internals
        #       + <leader>rl
        #       + VISUAL : <l>cr, <l>gt <- probably remove these
        #       + VISUAL : <l>pl <- the 'p' part is enough

        (addIcon "<leader>i" {
          name = "Git";
          icon = "󰮠 ";
        })

        (addIcon "<leader>l" {
          name = "Learning";
          icon = {
            icon = "󰑴 ";
            color = "green";
          };
        })

        (addIcon "<leader>r" {
          name = "Rename";
          icon = {
            icon = "󰑕 ";
            color = "green";
          };
        })

        (addIcon "<leader>c" {
          name = "Code analysis";
          icon = " ";
        })

        (addIcon "<leader>t" {
          name = "Terminals | TODO's";
          icon = " ";
        })

        (addIcon "<leader>h" {
          name = "Special windows";
          icon = " ";
        })

        (addIcon "<leader>d" {
          name = "Diagnostics";
          icon = " ";
        })

        (addIcon "<leader>q" {
          name = "Exiting";
          icon = "󰈆 ";
        })

        (addIcon "<leader>p" {
          name = "Pretty-printing";
          icon = "󰸭 ";
        })

        (addIcon "<leader>n" {
          name = "Notifications";
          icon = "󰀦 ";
        })

        (addIcon "<leader>g" {
          name = "Searching";
          icon = " ";
        })

        (addIcon "<leader>~" {
          name = "Toggle tagbar";
          icon = "󰓹 ";
        })

        (addIcon "<leader>|" {
          name = "Uncomment line-commented area";
          icon = " ";
        })

        (addIcon "<leader>/" {
          name = "Toggle line comment";
          icon = " ";
        })

        (addIcon "<leader>>" {
          name = "Add end-of-line comment";
          icon = " ";
        })

        (addIcon "<leader>m" {
          name = "Toggle explorer";
          icon = " ";
        })

        (addIcon "<leader>o" {
          name = "Toggle explorer focus";
          icon = " ";
        })

        (addIcon "<leader>z" {
          name = "Toggle zen mode";
          icon = {
            icon = "󱅻 ";
            color = "azure";
          };
        })

        (addIcon "<leader>f" {
          name = "Format Code";
          icon = "󰉵 ";
        })

        (addIcon "<leader>b" {
          name = "Buffers";
          icon = "󰓩 ";
        })

        (addIcon "<leader>b#" {
          name = "Move to buffer 0-9";
          icon = "󰓩 ";
        })

        (addIcon "<leader>bo" {
          name = "Ordering";
          icon = "󰈍 ";
        })
      ];

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

      "neotest-output"
      "neotest-summary"
      "neotest-output-panel"
    ];
    desc = "Allows for closing specific filetypes w/ just 'q'";
  }];

  rootOpts.colorschemes.catppuccin.settings.integrations.which_key = true;
}
