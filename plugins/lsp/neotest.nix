_:

# if I need code cov:
# [coverage](https://github.com/andythigpen/nvim-coverage)
# if I need competetive stuff:
# [competitest](https://github.com/xeluxee/competitest.nvim/)

{
  opts = {
    enable = true;
    settings = {
      output = {
        enabled = true;
        open_on_run = true;
      };
      output_panel = {
        enabled = true;
        open = "botright split | resize 15";
      };
    };
  };

  rootOpts.plugins.which-key.settings.spec = [{
    __unkeyed-1 = "<leader>cn";
    group = "Testing";
    icon = "󰙨 ";
  }];

  rootOpts.keymaps = [
    {
      mode = "n";
      action = "<cmd>lua require('neotest').run.run()<cr>";
      key = "<leader>cnt";
      options.desc = "Run nearest test";
    }

    {
      mode = "n";
      action = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>";
      key = "<leader>cnT";
      options.desc = "Run current file's tests";
    }

    {
      mode = "n";
      action = "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>";
      key = "<leader>cng";
      options.desc = "Debug nearest test";
    }

    {
      mode = "n";
      action = "<cmd>lua require('neotest').run.stop()<cr>";
      key = "<leader>cnk";
      options.desc = "Stop nearest test";
    }

    {
      mode = "n";
      action = "<cmd>lua require('neotest').output_panel.toggle()<cr>";
      key = "<leader>cno";
      options.desc = "Show all tests' output";
    }

    {
      mode = "n";
      action = "<cmd>lua require('neotest').summary.toggle()<cr>";
      key = "<leader>cn?";
      options.desc = "Show all tests' summary";
    }
  ];
}
