_:

# TODO: Customize section names
# registrations = {
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
# };

{
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

  opts = {
    enable = true;
    settings = {
      win.border = "single";
      disable.ft = [ "TelescopePrompt" "neo-tree" "neo-tree-popup" ];
    };
  };

  rootOpts.colorschemes.catppuccin.settings.integrations.which_key = true;
}
