{
  # TODO: change theme propagation by targeting nixvim with this:
  # https://github.com/nix-community/stylix/pull/415
  colorschemes.mini-base16 = {
    enable = false;
    settings.palette = {
      base00 = "#1c1408";
      base01 = "#241c0a";
      base02 = "#351a0f";
      base03 = "#422013";
      base04 = "#5b8512";
      base05 = "#73797e";
      base06 = "#9ca0a4";
      base07 = "#dfdfdf";
      base08 = "#ff4e00";
      base09 = "#ff7000";
      base0A = "#7cb518";
      base0B = "#ffbf00";
      base0C = "#0075c4";
      base0D = "#d72638";
      base0E = "#76597b";
      base0F = "#dbc077";
    };
  };

  colorschemes.palette = {
    enable = false;
    settings = {
      transparent_background = true;

      palettes = {
        main = "custom_main_palette";
        accent = "custom_accent_palette";
        state = "custom_state_palette";
      };

      custom_palettes = {
        main = {
          custom_main_palette = {
            color0 = "#191d33";
            color1 = "#1A1E39";
            color2 = "#383f5e";
            color3 = "#4e5470";
            color4 = "#7b7f94";
            color5 = "#a7a9b7";
            color6 = "#bdbfc9";
            color7 = "#d3d4db";
            color8 = "#e9e9ed";
          };
        };
        accent = {
          custom_accent_palette = {
            accent0 = "#D97C8F";
            accent1 = "#D9AE7E";
            accent2 = "#D9D87E";
            accent3 = "#A5D9A7";
            accent4 = "#8BB9C8";
            accent5 = "#C9A1D3";
            accent6 = "#B8A1D9";
          };
        };
        state = {
          custom_state_palette = {
            error = "#D97C8F";
            warning = "#D9AE7E";
            hint = "#D9D87E";
            ok = "#A5D9A7";
            info = "#8BB9C8";
          };
        };
      };
    };
  };

  colorschemes.everforest = {
    enable = true;
    settings = {
      background = "hard";
    };
  };

  colorschemes.catppuccin = {
    enable = false;
    settings = {
      flavor = "macchiato";
      transparent = true;
      term_colors = true;
    };
  };
}
