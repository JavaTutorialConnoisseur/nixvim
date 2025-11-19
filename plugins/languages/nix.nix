{pkgs, ...}: {
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
          # TODO: un-hardcode this & options:
          nixpkgs.expr = "import <nixpkgs> { }";
          diagnostic.suppress = ["sema-unused-def-lambda-witharg-formal"];
          # options = {
          #   home-manager.expr = ''
          #     (builtins.getFlake "/home/parrycat/.dotfiles").nixosConfigurations.nixos-xerinae.options'';
          #   nixos.expr = ''
          #     (builtins.getFlake "/home/parrycat/.dotfiles").homeConfigurations."parrycat@nixos-xerinae".options'';
          # };
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
