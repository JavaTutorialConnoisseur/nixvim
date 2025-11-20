{pkgs, ...}: {
  extra.plugins = with pkgs.vimPlugins; [live-share-nvim instant-nvim];
  # this is necessary (to host) but UNFREE!!! Also needs your goddamn CREDIT CARD dude.
  # root.extraPackages = [pkgs.ngrok];

  # TEST: -> check if this works (on Friday)
  root.extraConfigLua = ''
    vim.g.instant_username = "<anon>"
    require("live-share").setup({
      port_internal = 8080,
      max_attempts = 40,
      service = "ngrok",
      service_url = "/tmp/ngrok-url"
    })
  '';
}
