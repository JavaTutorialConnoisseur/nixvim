_: {
  opts = {
    enable = true;
    enableTelescope = true;

    settings = {
      detection_methods = ["pattern" "lsp"];
      patterns = [
        ".git"
        # ".gitignore"
        ".rooter-root"
        "_darcs"
        ".hg"
        ".bzr"
        ".svn"
        # "Makefile"
        "package.json"
      ];

      silent_chdir = false;
      show_hidden = true;
    };
  };
}
