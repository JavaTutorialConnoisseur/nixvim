_:

{
  opts = {
    enable = true;
    delay = 200;
    filetypesDenylist = [ "dirbuf" "dirvish" "fugitive" "toggleterm" ];
    largeFileOverrides.providers = [ "lsp" ];
    minCountToHighlight = 2;
  };
}
