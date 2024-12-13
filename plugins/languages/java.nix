_:

{
  rootOpts.plugins.nvim-jdtls = {
    enable = true;
    data = "~/Downloads"; # WARN: placeholder
    configuration = "~/.cache/jdtls/config";
  };

  rootOpts.plugins.lsp.servers.jdtls.enable = true;
}
