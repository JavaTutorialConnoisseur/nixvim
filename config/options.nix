# General neovim options. Stuff under `vim.opt`, as well as syntax, filetype
# and fill/list-chars.
{
  opts = {
    undofile = true;
    undodir = ["./.cache/"];

    # Fold & indent
    smartindent = true;
    autoindent = true;
    tabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    smarttab = true;
    foldenable = true;
    foldmethod = "manual";
    foldlevel = 99;
    foldlevelstart = 99;
    foldcolumn = "4";

    # Mouse & clipboard
    clipboard = "unnamedplus";
    mouse = "a";

    # UI settings
    wrap = true;
    linebreak = true;
    termguicolors = true;
    cursorline = false;
    number = true;
    relativenumber = true;

    # List
    list = true;
    ruler = true;

    # Make VimInfo remember old files
    viminfo = "'1000";

    # Searching
    smartcase = true;
    incsearch = true;

    # Misc QoL
    compatible = false;
    autoread = true;
    hidden = true;
  };

  extraConfigLua = ''
    vim.opt.fillchars:append("eob: ")
    vim.opt.fillchars:append("vert: ")
    vim.opt.fillchars:append("fold: ")
    vim.opt.fillchars:append("foldopen:")
    vim.opt.fillchars:append("foldsep: ")
    vim.opt.fillchars:append("foldclose:")

    vim.opt.listchars:append("trail:─")
  '';

  extraConfigVim = ''
    syntax enable
    filetype plugin on
  '';
}
