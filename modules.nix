{
  config,
  lib,
  ...
}: let
  inherit (lib.types) either package lambda attrs attrsOf str listOf;
  cfg = config.programs.my-nixvim;
in {
  options.programs.my-nixvim = {
    enable = lib.mkEnableOption "my nixvim config";

    package = lib.mkOption {
      type = either package lambda;
      description = "The nixvim package to use";
    };

    settings = {
      theme = lib.mkOption {
        type = attrs;
        default = config.lib.stylix.colors or {};
        description = "Theme configuration";
      };

      vars = lib.mkOption {
        type = attrsOf str;
        description = "Session variables";
      };

      disabled = lib.mkOption {
        type = listOf str;
        default = ["haskell" "scala"];
        description = "List of disabled files";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = let
      my-nixvim =
        if lib.isDerivation cfg.package
        then cfg.package
        else
          cfg.package {
            theme.theme = cfg.settings.theme or {};
            specialArgs = {
              disabledFiles = cfg.settings.disabled or [];
              sessionVars = cfg.settings.vars or null;
            };
          };
    in [my-nixvim];
  };
}
