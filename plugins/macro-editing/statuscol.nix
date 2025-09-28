_: {
  opts = {
    enable = true;
    autoLoad = true;

    settings = {
      setopt = true;

      bt_ignore = null;
      ft_ignore = null; # TODO: add things here that don't fit

      clickmod = "c";
      thousands = false;
      relculright = false;

      clickhandlers = {
        FoldClose = "require('statuscol.builtin').foldclose_click";
        FoldOpen = "require('statuscol.builtin').foldopen_click";
        FoldOther = "require('statuscol.builtin').foldother_click";
        Lnum = "require('statuscol.builtin').lnum_click";
      };

      # gitsigns | diagnostics | folds | line number
      segments = [
        {
          click = "v:lua.ScSa"; # SIGNS
          text = ["%s"];
        }

        {
          click = "v.lua.ScFa"; # FOLDING
          text = [{__raw = "require('statuscol.builtin').foldfunc";}];
        }

        {
          click = "v:lua.ScLa"; # LINE NUMBERS
          text = [
            {__raw = "require('statuscol.builtin').lnumfunc";}
            " "
          ];
          condition = [
            true
            {__raw = "require('statuscol.builtin').not_empty";}
          ];
        }
      ];
    };
  };
}
