{ lib, ... }@args:

# All plugins that don't directly EDIT, but manage projects and project-related
# things go here.

args.defaultFn {
  lib = lib;
  dir = ./.;
  args = args;
}
