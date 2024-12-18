_:

# highlight other variable instances when hovering over one
{
  opts = {
    enable = true;
    delay = 200;
    filetypesDenylist = [ "dirbuf" "dirvish" "fugitive" "toggleterm" ];
    largeFileOverrides.providers = [ "lsp" ];
    minCountToHighlight = 2;
  };
}
