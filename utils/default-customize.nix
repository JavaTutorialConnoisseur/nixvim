let
  defDisabled = ["scala" "haskell"];
in {
  disabledFiles = map (lang: "${lang}.nix") defDisabled;

  defTheme.theme = {
    base0F = "dbc077"; #7287fd
    base0E = "76597b"; #8839ef
    base06 = "9ca0a4"; #8c8fa1
    base00 = "1c1408"; #dc8a78
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
