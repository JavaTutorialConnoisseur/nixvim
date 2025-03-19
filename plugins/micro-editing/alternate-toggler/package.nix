{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  name = "alternate-toggler";

  src = pkgs.fetchFromGitHub {
    owner = "rmagatti";
    repo = "alternate-toggler";
    rev = "fe798aa9e4af26c9e33ca1add9d255209d03b108";
    hash = "sha256-7t0UJ5pIa4BAECf09EodyrXqii9nYsq2n7NDKCoXw78=";
  };
}
