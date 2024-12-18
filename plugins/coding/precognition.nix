_:

{
  opts = {
    enable = true;
    settings.startVisible = false;
  };

  rootOpts.keymaps = [
    {
      key = "<leader>lp";
      action = "<cmd>Precognition peek<cr>";
      options.desc = "Check nice jump methods";
      mode = [ "n" ];
    }

    {
      key = "<leader>lt";
      action = "<cmd>Precognition toggle<cr>";
      options.desc = "Toggle persistent jumps show";
      mode = [ "n" ];
    }
  ];
}
