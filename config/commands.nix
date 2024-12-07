{
  autoCmd = [{
    callback.__raw = ''
      function()
        vim.cmd [[
          setlocal tabstop=2
          setlocal shiftwidth=2
        ]]
      end
    '';
    event = [ "FileType" ];
    pattern = [ "text" "gitcommit" "markdown" "tex" ];
    desc = "Set spelling and line wrapping for text-adjacent files";
  }];

  userCommands = { };
}
