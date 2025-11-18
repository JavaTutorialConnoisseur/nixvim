{pkgs, ...}: {
  rootOpts.plugins = {
    nix-develop.enable = true;
    hmts.enable = false; # string code highlighting (like css)

    lsp.servers = {
      nixd = {
        enable = true;
        # cmd = ["nixd --semantic-tokens=false"];
        cmd = ["nixd"];
        settings = {
          formatting.command = ["alejandra"];
          nixpkgs.expr = "import <nixpkgs> { }";
          diagnostic.suppress = ["sema-unused-def-lambda-witharg-formal"];
          # TODO: un-hardcode this:
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
