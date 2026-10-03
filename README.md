# Homebrew-star

## 🏃 Get Started

```shell
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## 🍺 User Guide

### Tap

```shell
brew tap Zach677/star
```

### Install Cask

```shell
brew install --cask <cask-name>
```

Example:
```shell
brew install --cask Zach677/star/mitori
```

### Install Formula

```shell
brew install <formula-name>
```

### Uninstall Cask

```shell
brew uninstall --cask <cask-name>
```

### Uninstall Formula

```shell
brew uninstall <formula-name>
```

## Maintain Casks

Follow the [Cask Cookbook](https://docs.brew.sh/Cask-Cookbook). Put active casks
in `Casks/`. `Deprecated/` keeps archived casks and is not installable.

Run these checks before you push:

```shell
brew style Casks Formula test/casks.rb
brew style --only-cops Cask Deprecated
brew ruby test/casks.rb
```

`test/casks.rb` runs a strict audit on ARM and Intel and fails on deprecation
warnings. It also runs each `xattr` cleanup step on a temporary app bundle.
When you add or remove a cleanup step, update `cleanup_tokens` in the test.

## 🥰 Acknowledgements

Copyright © 2024 Zach. All Rights Reserved.
