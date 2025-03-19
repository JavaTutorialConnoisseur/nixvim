{lib, ...} @ args:
# All plugins that deal with small, line-by-line edits go here
args.defaultFn {
  lib = lib;
  dir = ./.;
  args = args;
}
