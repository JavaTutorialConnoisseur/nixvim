{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  name = "pretty-fold";

  src = pkgs.fetchFromGitHub {
    owner = "bbjornstad";
    repo = "pretty-fold.nvim";
    rev = "1eb18f228972e86b7b8f5ef33ca8091e53fb1e49";
    hash = "sha256-0cHPm+JPGoYsjJEg3eIWv2Td1S+LQYBRbp71XPQsWMg=";
  };
}
