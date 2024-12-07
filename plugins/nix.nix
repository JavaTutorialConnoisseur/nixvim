_:

{
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
