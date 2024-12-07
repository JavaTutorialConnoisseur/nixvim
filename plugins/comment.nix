_:

{
  opts = {
    enable = true;
    settings.extra.eol = "<leader>>";
    settings.toggler.line = "<leader>/";
  };

  rootOpts.keymaps = [{
    mode = "v";
    key = "<leader>/";
    options.desc = "Toggle comments";
    action = "gcc";
  }];
}
