_:

{
  opts.enable = true;

  rootOpts.keymaps = [{
    mode = "n";
    key = "<leader>td";
    options.desc = "Find TODO's";
    action.__raw = ''
      function()
        TelescopeWithTheme('todo', { }, 'todo-comments')
      end
    '';
  }];

  rootOpts.plugins.transparent.settings.extra_groups = [
    "TodoSignNOTE"
    "TodoSignFIX"
    "TodoSignHACK"
    "TodoSignPERF"
    "TodoSignTEST"
    "TodoSignTODO"
    "TodoSignWARN"
  ];
}
