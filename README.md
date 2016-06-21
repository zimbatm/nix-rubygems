# nix-rubygems

Contains all rubygems hashes.

The idea is that you will be able to do something like this in nix:

```nix
{ fetchFromGitHub, buildRubyGem }:
let
  rubygems = fetchFromGitHub {
    owner = "zimbatm";
    repo = "nix-rubygems";
    rev = "...";
    sha256 = "...";
  };
  rdoc = buildRubyGem (rubygems { gemName = "rdoc"; version = "4.2.1"; });
in
  rdoc
```

## Run your own

Depends on `ruby` (no gem deps), `curl` and `nix-prefetch-url`

```sh
git clone https://github.com/zimbatm/nix-rubygems.git
cd nix-rubygems
./mirror.rb
```

## Projection

These are some calculations made if we where to include more informations
about the gems (like the metadata):

* Latest gems: 7539
* Total gems: 812788

For 1400 gems we have:
* 1.2G ./mirror
* 5.6M ./gems
* 760K ./.git/

For 800k gems we will have ~:
* 688G ./mirror
* 3.2G ./gems
* 440M ./.git

* 39M  Just the base32 sha256 hashes (52B)
* 24M  Just the sha256 hashes (32B each)
* TODO: add the folder and filename to the cost

