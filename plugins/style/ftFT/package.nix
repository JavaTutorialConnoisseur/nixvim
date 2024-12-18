{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "ftFT";

  src = pkgs.fetchFromGitHub {
    owner = "gukz";
    repo = "ftFT.nvim";
    rev = "09a72f9adf8ee7c824c517ef8408c9e687453039";
    hash = "sha256-hBLzFGQFXq/OLAurxF6Ug1ILyNlkm7R9A1gABiLyNMw=";
  };
}
