_: let
  snippetsDir = ./../../.extra-snippets;
in {
  opts = {
    enable = true;
    settings.enable_autosnippets = true;

    # {
    #   paths = snippetsDir + "/[language name]";
    #   include = [ "[language ext / ft]" ];
    # }
    fromSnipmate = [{paths = snippetsDir + "/all";}];
  };
}
