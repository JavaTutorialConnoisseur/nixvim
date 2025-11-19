{pkgs, ...}: {
  extra.packages = [pkgs.vimPlugins.live-share-nvim pkgs.vimPlugins.instant-nvim];
  # this is necessary but UNFREE!!!
  # rootOpts.extraPackages = [pkgs.ngrok];

  # TEST: -> check if this works (on Friday)
  extra.luaPre = ''
    vim.g.instant_username = "<anon>"
    require("live-share").setup({
      port_internal = 8080,
      max_attempts = 40,
      service = "ngrok",
      service_url = "/tmp/ngrok-url"
    })
  '';
}
