_:

{
  rootOpts.plugins.friendly-snippets = { enable = true; };

  opts = {
    enable = true;
    settings.enable_autosnippets = true;

    # FIXME: these don't work for some reason
    fromSnipmate = [
      {
        # paths ARE validated (if I do ../ it breaks)
        paths = ./../../.snippets/c.snippets;
        include = [ "c" ]; # is this even working?
      }

      {
        paths = ./../../.snippets/_.snippets;
        include = [ "nix" ];
      }
    ];
  };
}
