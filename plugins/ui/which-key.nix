_: {
  opts = {
    enable = true;
    settings = {
      win.border = "rounded";
      icons.rules = false;

      keys = {
        scroll_down = "<M-[>";
        scroll_up = "<M-]>";
      };

      sort = ["group" "alphanum"];
      disable.ft = ["TelescopePrompt" "neo-tree" "neo-tree-popup"];

      # col: azure, blue, cyan, green, grey, purple, red, orange, yellow
      spec = [
        {
          __unkeyed-1 = "<leader>?";
          __unkeyed-2 = "<cmd>WhichKey<cr>";
          desc = "Show keymaps";
          icon = {
            icon = "󰌓 ";
            color = "gray";
          };
          mode = "n";
        }

        {
          __unkeyed-1 = "<leader>p";
          group = "Pretty-printing";
          icon = {
            icon = "󰸭 ";
            color = "orange";
          };
          mode = ["n" "x"];
        }

        {
          __unkeyed-1 = "<leader>l";
          group = "Learning";
          icon = {
            icon = "󰑴 ";
            color = "orange";
          };
        }

        {
          __unkeyed-1 = "<leader>h";
          group = "Special windows";
          icon = {
            icon = " ";
            color = "gray";
          };
        }

        {
          __unkeyed-1 = "<leader>b";
          group = "Buffers";
          icon = {
            icon = "󰓩 ";
            color = "purple";
          };
        }

        {
          __unkeyed-1 = "<leader>bo";
          group = "Ordering";
          icon = {
            icon = "󰈍 ";
            color = "cyan";
          };
        }

        {
          __unkeyed-1 = "<leader>q";
          group = "Exiting";
          icon = {
            icon = "󰈆 ";
            color = "red";
          };
        }
      ];
    };
  };

  rootOpts.autoCmd = [
    {
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
      event = ["FileType"];
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
    }
  ];

  rootOpts.colorschemes.catppuccin.settings.integrations.which_key = true;
}
