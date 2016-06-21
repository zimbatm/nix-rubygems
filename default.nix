{ gemName, version, platform ? "ruby", ... }@args:
let
  root = toString ./.;
  prefix = builtins.substring 0 2 gemName;
  postfix = if platform == "ruby" then "" else "-${platform}";
  path = "${root}/gems/${prefix}/${gemName}/${version}${postfix}.sha256";
  sha256 = builtins.readFile path;
in
  args // { inherit sha256; }
