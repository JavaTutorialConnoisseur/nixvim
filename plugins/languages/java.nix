_:

# FUTURE: to enable DAP, eclipse.jdt.ls needs to load the java-debug extension.
# dunno where / how to do that without explicit control?
{
  rootOpts.plugins = {
    nvim-jdtls = {
      enable = true;
      # WARN: this expects that the project is directly inside of its workspace
      # folder: ..workspace/project.., if not like this then data will point
      # to the wrong place, and server will likely not run correctly.
      data = "../.";
      settings.java.gradle.enabled = true;
    };
  };
}
