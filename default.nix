{ gemName, version, platform ? "ruby", ... }@args:
let
  root = toString ./.;
  split = builtins.substring 0 1 gemName;
  ver = if platform == "ruby" then version else "${version}-${platform}";
  path = "${root}/gems/${split}/${gemName}/${ver}.sha256";
  sha256 = builtins.readFile path;
in
  args // { inherit sha256; }
