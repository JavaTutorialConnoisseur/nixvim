{pkgs, ...}: {
  root.plugins.lsp.servers = {
    cssls.enable = true;
    html.enable = true;
    ts_ls.enable = true;
  };

  root.extraPackages = [pkgs.vscode-langservers-extracted];
}
