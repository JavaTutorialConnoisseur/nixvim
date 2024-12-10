_:

{
  opts = {
    enable = true;
    backgroundColour = "#000000";
    fps = 60;
    stages = "slide";

    maxHeight.__raw = "function() return math.floor(vim.o.lines * 0.75) end";
    maxWidth.__raw = "function() return math.floor(vim.o.columns * 0.75) end";

    onOpen = ''
      function(win)
        local buf = vim.api.nvim_win_get_buf(win)
        vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
        vim.api.nvim_win_set_config(win, { zindex = 175 })
        vim.wo[win].conceallevel = 3
        vim.wo[win].spell = false
      end
    '';
  };

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>nd";
      action.__raw =
        "function() require('notify').dismiss { pending = true, silent = true } end";
      options.desc = "Dismiss notifications";
    }

    {
      mode = "n";
      key = "<leader>nf";
      action.__raw =
        "function() TelescopeWithTheme('notify', {}, 'notify') end";
      options.desc = "Find notifications";
    }
  ];

  rootOpts.plugins.transparent.settings.extra_groups = [
    "NotifyWARNBorder"
    "NotifyWARNTitle"
    "NotifyWARNIcon"
    "NotifyERRORBorder"
    "NotifyERRORTitle"
    "NotifyERRORIcon"
    "NotifyINFOBorder"
    "NotifyINFOTitle"
    "NotifyINFOIcon"
    "NotifyTRACEBorder"
    "NotifyTRACETitle"
    "NotifyTRACEIcon"
    "NotifyDEBUGBorder"
    "NotifyDEBUGTitle"
    "NotifyDEBUGIcon"
    "NotifyERRORBody"
    "NotifyWARNBody"
    "NotifyINFOBody"
    "NotifyDEBUGBody"
    "NotifyTRACEBody"
  ];
}
