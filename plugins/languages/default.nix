{lib, ...} @ args:
args.defaultFn {
  lib = lib;
  dir = ./.;
  args = args;
  ignore = args.disabledLangs;
}
