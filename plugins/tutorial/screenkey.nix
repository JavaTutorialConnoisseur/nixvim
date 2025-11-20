{pkgs, ...}: {
  root.keymaps = [
    {
      mode = "n";
      key = "<leader>hk";
      action = "<Cmd>Screenkey toggle<CR>";
      options.desc = "Screenkey";
    }
  ];

  extra.plugins = let
    version = "2.1.0";
    name = "screenkey.nvim";
  in [
    (pkgs.vimUtils.buildVimPlugin {
      inherit version name;

      src = pkgs.fetchFromGitHub {
        owner = "NStefan002";
        repo = name;
        rev = "v${version}";
        hash = "sha256-kdZ5GMFyKbzHEn/Bm4r76vauPillvbKJX7yI8MJxGEo=";
      };
    })
  ];
}
