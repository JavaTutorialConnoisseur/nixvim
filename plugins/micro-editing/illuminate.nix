_:
# highlight other variable instances when hovering over one
{
  opts = {
    enable = true;

    settings = {
      delay = 200;
      filetypes_denylist = ["dirbuf" "dirvish" "fugitive" "toggleterm"];
      large_file_overrides.providers = ["lsp"];
      min_count_to_highlight = 2;
    };
  };
}
