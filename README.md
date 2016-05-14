# rubygems2nix

Package metadata repository for nix.

The idea is that you will be able to do something like this in nix:

```nix
{ fetchFromGitHub, buildRubyGem }:
let
  rubygems = fetchFromGitHub {
    owner = "zimbatm";
    repo = "rubygems2nix";
    rev = "...";
    sha256 = "...";
  };
  rdoc = buildRubyGem (rubygems "rdoc" "4.2.1");
in
  rdoc
```

Based on [rubygems-mirror](https://github.com/rubygems/rubygems-mirror)

## Setup

```sh
repo_dir=$HOME/code/github.com/zimbatm/rubygems2nix
mkdir -p "$(dirname "$repo_dir")"
cd "$(dirname "$repo_dir")"
git clone https://github.com/zimbatm/rubygems2nix.git
cd rubygems2nix

ln -s "$repo_dir/mirrorrc" ~/.gem/.mirrorrc
bundle
```

## Usage

```sh
./update
```

## Projection

For 1400 gems we have:
* 1.2G ./mirror
* 5.6M ./gems
* 760K ./.git/

For 800k we will have ~:
* 688G ./mirror
* 3.2G ./gems
* 440M ./.git

## TODO

* Actually convert the data to nix

