{
  pkgs,
  lib,
  sessionVars,
  ...
}: {
  rootOpts.plugins = {
    nix-develop.enable = true;
    hmts.enable = false; # string code highlighting (like css)

    lsp.servers = {
      nil_ls = {
        enable = true;
        settings.formatting.command = [""];
        onAttach.function = ''
          client.server_capabilities.referencesProvider = false
          client.server_capabilities.definitionProvider = false
          client.server_capabilities.renameProvider = false
        '';
      };

      nixd = {
        enable = true;
        cmd = ["nixd"];
        settings = {
          formatting.command = ["alejandra"];
          diagnostic.suppress = ["sema-unused-def-lambda-witharg-formal"];

          nixpkgs.expr =
            if (sessionVars != null)
            then "(builtins.getFlake \"${sessionVars.dotfilesDir}\").inputs.pkgs { }"
            else "import <nixpkgs> { }";

          options = lib.optionalAttrs (sessionVars != null) (let
            inherit (sessionVars) hostname username dotfilesDir;
            targ_flake = "(builtins.getFlake \"${dotfilesDir}\")";
          in {
            home-manager.expr = ''
              ${targ_flake}.nixosConfigurations.${hostname}.options'';
            nixos.expr = ''
              ${targ_flake}.homeConfigurations."${username}@${hostname}".options'';
          });
        };
      };
    };
  };

  rootOpts.autoCmd = [
    {
      callback.__raw = ''
        function()
          vim.cmd [[
            setlocal tabstop=2
            setlocal shiftwidth=2
          ]]
        end
      '';
      event = ["FileType"];
      pattern = ["nix"];
      desc = "Set tab and indent length for Nix files to 2";
    }
  ];

  rootOpts.extraPackages = [pkgs.alejandra pkgs.nixd];
}
