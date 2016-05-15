{ gemName, version, platform ? "ruby", ... }@args:
let
  root = toString ./.;
  prefix = builtins.substring 0 1 name;
  postfix = if platform == "ruby" then "" else "-${platform}";
  path = "${root}/gems/${prefix}/${name}/${version}${postfix}.json";
  json =
    if builtins.pathExists path then
      builtins.fromJSON (builtins.readFile path)
    else
      throw "gem ${name}-${version} not found";
in
  args // json
