_: {
  opts = {
    enable = true;
    # TODO: see if any more groups need to be added here.
    # (Just run 'highlight')
    settings.extra_groups = [
      "NormalFloat"
      "FloatBorder"
      "FloatTitle"
      "MsgArea"
      "MsgSeparator"
      "Folded"
      "TabLineFill"

      "BufferCurrentSign"
      "BufferCurrentSignRight"

      "BufferDefaultVisible"

      "BufferAlternate"
      "BufferAlternateMod"

      "BufferInactive"
      "BufferInactiveMod"

      "BufferVisible"
      "BufferVisibleMod"

      "BufferTabpageFill"

      "DiagnosticSignWarn"
      "DiagnosticSignError"
      "DiagnosticSignHint"
      "DiagnosticSignInfo"
    ];
  };
}
