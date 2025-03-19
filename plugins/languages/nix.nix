_:

{
  rootOpts.plugins = {
    nix-develop.enable = true;
    hmts.enable = false; # string code highlighting (like css)

    lsp.servers.nil_ls = {
      enable = true;
      settings = {
        formatting.command = [ "nixfmt" ];
        nix.flake.autoArchive = true;
      };
    };
  };

  rootOpts.autoCmd = [{
    callback.__raw = ''
      function()
        vim.cmd [[
          setlocal tabstop=2
          setlocal shiftwidth=2
        ]]
      end
    '';
    event = [ "FileType" ];
    pattern = [ "nix" ];
    desc = "Set tab and indent length for Nix files to 2";
  }];
}
