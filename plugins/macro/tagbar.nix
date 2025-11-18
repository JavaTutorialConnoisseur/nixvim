{pkgs, ...}: {
  opts = {
    enable = true;
    settings = {
      autoclose = false;
      autofocus = false;
      compact = 2;

      autoshowtag = true;
      foldlevel = 2;
      iconchars = [
        ""
        ""
      ];

      position = "right";
      visibility_symbols = {
        private = "󰛑 ";
        protected = "󱗤 ";
        public = "󰡭 ";
      };
    };
  };

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>ct";
      action = "<Cmd>TagbarToggle<CR>";
      options.desc = "Toggle tag bar";
    }
  ];

  rootOpts.extraPackages = [pkgs.universal-ctags];
  rootOpts.extraPlugins = [(pkgs.vimPlugins.vim-gutentags)];
}
