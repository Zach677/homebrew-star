# homebrew-star

Personal [Homebrew](https://brew.sh) tap for macOS casks and formulae not in the official repositories.

## Packages

| Name | Type | Description | Install |
| --- | --- | --- | --- |
| [LookInside](https://github.com/LookInsideApp/LookInside) | Cask | UI inspector for debuggable Apple apps | `brew install --cask Zach677/star/lookinside` |
| [LookInside CLI](https://github.com/LookInsideApp/LookInside) | Formula | Command-line inspector for debuggable Apple apps | `brew install Zach677/star/lookinside-cli` |
| [MiniLPA](https://github.com/EsimMoe/MiniLPA) | Cask | Professional LPA UI | `brew install --cask Zach677/star/minilpa` |
| [Mitori](https://github.com/Zach677/mitori) | Cask | Monitor Apple ID store credit balances from the menu bar | `brew install --cask Zach677/star/mitori` |
| [NotchDrop](https://github.com/Lakr233/NotchDrop) | Cask | Transform your MacBook's notch into a convenient file drop zone | `brew install --cask Zach677/star/notchdrop` |
| [OCS Desktop](https://docs.ocsjs.com/docs/app) | Cask | Desktop app for OCS browser automation workflows | `brew install --cask Zach677/star/ocs-desktop` |
| [See](https://github.com/wibus-wee/see) | Cask | Desktop app for reading source code | `brew install --cask Zach677/star/see` |

## Usage

Requires [Homebrew](https://brew.sh). You can install a package directly with the `Zach677/star/` prefix, or tap once first:

```shell
brew tap Zach677/star
```

Install or uninstall a cask:

```shell
brew install --cask Zach677/star/<cask-name>
brew uninstall --cask <cask-name>
```

Install or uninstall a formula:

```shell
brew install Zach677/star/<formula-name>
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

## License

This tap is licensed under the [MIT License](LICENSE).
