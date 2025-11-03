{
  description = "Full nixvim config of Parrydog^{TM}";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixvim,
    ...
  }: let
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-linux"
      "x86_64-darwin"
    ];

    pullTheme = theme: {
      themeColors = with theme.theme; {
        normal = base0F;
        insert = base0E;
        visual = base06;
        replace = base00;
      };
    };

    defaultDisabled = ["scala" "haskell"];
    defaultTheme.theme = {
      base0F = "dbc077"; #7287fd
      base0E = "76597b"; #8839ef
      base06 = "9ca0a4"; #8c8fa1
      base00 = "1c1408"; #dc8a78
    };
  in {
    packages = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};
      defaultFn = import ./defaultFn.nix;

      disabledLangs = langs: map (lang: "${lang}.nix") langs;
      mkNixvim = theme: specialArgs:
        nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          extraSpecialArgs =
            specialArgs
            // {inherit pkgs;} // (pullTheme theme);
          module = ./.;
        };
    in {
      default = mkNixvim defaultTheme {
        disabledLangs = disabledLangs defaultDisabled;
        defaultFn = defaultFn;
      };

      configurable = {
        theme ? defaultTheme,
        disabled ? defaultDisabled,
      }:
        mkNixvim theme {
          disabledLangs = disabledLangs disabled;
          defaultFn = defaultFn;
        };
    });
  };
}
