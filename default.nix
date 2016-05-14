name: version:
let
  root = toString ./.;
  prefix = builtins.substring 0 1 name;
  path = "${root}/gems/${prefix}/${name}/${version}.json";
  json =
    if builtins.pathExists path then
      builtins.fromJSON (builtins.readFile path)
    else
      throw "gem ${name}-${version} not found";
in
  json // { gemName = name; inherit version; }
