_:

let c_or_cpp = "c";
in {
  rootOpts.extraConfigLua = ''
    if ${c_or_cpp} == "c" then
      vim.g.c_syntax_for_h = 1
    elseif ${c_or_cpp} == "cpp" then
      vim.g.c_syntax_for_h = 0
    end
  '';

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
    pattern = [ "c" "h" ];
    desc = "Set tab and indent length for C files to 2";
  }];
}
