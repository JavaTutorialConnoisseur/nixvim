_: {
  opts = {
    enable = true;
    autoLoad = true;
    settings = {
      detection_methods = ["pattern"];
      patterns = [".git"];
      silent_chdir = true;
      show_hidden = true;
    };
  };
}
