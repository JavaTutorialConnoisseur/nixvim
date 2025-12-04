{pkgs, ...}: {
  root.extraPackages = [pkgs.zig];
  root.plugins.lsp.servers.zls.enable = true;
}
