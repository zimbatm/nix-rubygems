{ gemName, version, platform ? "ruby", ... }@args:
let
  root = toString ./.;
  prefix = builtins.substring 0 2 name;
  postfix = if platform == "ruby" then "" else "-${platform}";
  path = "${root}/gems/${prefix}/${name}/${version}${postfix}.sha256";
  sha256 =
    if builtins.pathExists path then
      builtins.readFile path
    else
      throw "gem ${name}-${version} not found";
in
  args // { inherit sha256; }
