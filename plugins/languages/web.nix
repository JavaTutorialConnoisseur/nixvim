{pkgs, ...}: {
  rootOpts.plugins.lsp.servers = {
    cssls.enable = true;
    html.enable = true;
    ts_ls.enable = true;
  };

  rootOpts.extraPackages = [pkgs.vscode-langservers-extracted];
}
