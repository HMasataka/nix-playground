{ packages ? import <nixpkgs> {} }:

packages.stdenv.mkDerivation {
  name = "hello-nix";
  nativeBuildInputs = with packages;[
      gcc
  ];
  buildInputs = with packages;[
    # some packages
  ];
  builder = ./builder.sh;
  src = ./main.cpp;
}
