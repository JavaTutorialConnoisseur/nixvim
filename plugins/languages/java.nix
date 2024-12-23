{ pkgs, lib, ... }:

let
  start-jdt-server = lib.getExe (pkgs.writeShellScriptBin "start-jdt-server"
    "jdtls -data ${workspacePath}/data_structures");
  workspacePath = "/home/parrycat/Documents/projects/java/projects/workspaces";
in {
  rootOpts.plugins = {
    nvim-jdtls = {
      enable = true;
      data = "../.";
      # for now: hardcoded. Tries to fix indexing issue
      settings.java.gradle.enabled = true;
    };

    # lsp.servers.java_language_server = {
    #   enable = true;
    #   cmd = [ "${start-jdt-server}" ];
    #   package = pkgs.jdt-language-server;
    # };
  };
}
