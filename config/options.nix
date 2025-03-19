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
    foldenable = false;

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

  extraConfigVim = ''
    syntax enable
    filetype plugin on
    set fillchars+=eob:\
    set fillchars+=vert:\
    set listchars+=trail:─
  '';
}
