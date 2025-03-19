{lib, ...} @ args:
# All plugins that deal with large, function- or project-wide edits go here
args.defaultFn {
  lib = lib;
  dir = ./.;
  args = args;
}
