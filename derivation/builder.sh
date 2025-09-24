# nixが用意する基本的な環境変数の読み込み
source $stdenv/setup

$CXX $CXXFLAGS $LDFLAGS "$src" -o hello-nix

mkdir -p $out/bin

cp ./hello-nix $out/bin
