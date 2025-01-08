let
  pkgs = import (fetchTarball "https://github.com/rstats-on-nix/nixpkgs/archive/2024-12-14.tar.gz") {};

  IosevkaCustom = pkgs.iosevka.override {
    set = "Custom";
    privateBuildPlan = builtins.readFile ./private-build-plans.toml;
  };

in

pkgs.stdenv.mkDerivation {
  name = "iosevka-custom";
  buildInputs = [ IosevkaCustom ];
}
