_: {
  opts.enable = true;

  rootOpts.opts.inccommand = "split";

  rootOpts.keymaps = [
    {
      mode = ["n"];
      key = "<leader>rn";
      options.desc = "Rename word under cursor w/ preview";
      action.__raw = ''
        function()
          local word_under_cursor = vim.fn.expand("<cword>")

          if (not word_under_cursor) or (word_under_cursor == "") then
            vim.notify("Nothing to rename...", "error")
          end

          vim.api.nvim_feedkeys(":" .. "IncRename " .. word_under_cursor, "n", true)
        end
      '';
    }
  ];
}
