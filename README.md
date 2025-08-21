# Nix Playground

```bash
nix flakes init
```

## デフォルト環境の起動

```bash
nix develop
```

### 完全に独立した環境を起動

```bash
nix develop -i
```

または

```bash
nix develop --ignore-environment
```

## Node 環境の起動

```bash
nix develop #node
```

## Nix環境かどうか確認

```bash
echo $IN_NIX_SHELL
```
