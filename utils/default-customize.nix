let
  defDisabled = ["scala" "haskell"];
in {
  disabledFiles = map (lang: "${lang}.nix") defDisabled;

  defTheme.theme = {
    base0F = "dbc077"; #dbc077
    base0E = "76597b"; #76597b
    base06 = "9ca0a4"; #9ca0a4
    base00 = "1c1408"; #1c1408
  };

  pullTheme = theme: {
    themeColors = with theme.theme; {
      normal = base0F;
      insert = base0E;
      visual = base06;
      replace = base00;
    };
  };
}
