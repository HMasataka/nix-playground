# Nix Build

## Build

```bash
nix-build
```

## Reference

### nativeBuildInputs と buildInputs の違い

- nativeBuildInputs: ビルド時に「実行される」ツール類。ビルドマシン用にビルドされる。
- buildInputs: 出力物が「リンク・利用する」ライブラリ等。ターゲット(ホスト)用にビルドされる。

なぜ分けるか

- ネイティブ(非クロス)では両方ともビルド中に PATH に入るため差が見えにくいが、クロスコンパイル時に明確に役割が分かれる。
- 適切に分けると依存のアーキテクチャが正しくなり、不要なランタイム依存を避けられる。

使い分け

- nativeBuildInputs に入れるもの
  - cmake, meson, pkg-config, bison, flex, autoconf/automake, コードジェネレータ、python(ビルドスクリプト用) などビルド時に動くツール
  - コンパイラ/リンカ等 (stdenv.cc など)
- buildInputs に入れるもの
  - zlib, openssl, sqlite など出力バイナリがリンク・実行時に必要とするライブラリ
  - ヘッダ/ライブラリを提供する依存一式

例

- nativeBuildInputs = [ cmake pkg-config stdenv.cc ];
- buildInputs = [ openssl zlib ]
