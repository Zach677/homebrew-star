# LookInside CLI Homebrew Formula Design

## Goal

Add a separate Homebrew formula for the upstream `lookinside` command-line tool so users can install and upgrade it independently from the GUI app cask.

## Constraints

- Keep the existing `/Users/star/Developer/zach-repo/homebrew-star/Casks/lookinside.rb` unchanged as the GUI app entry.
- Avoid manual local compilation on every update; upstream now publishes a standalone CLI artifact for each release.
- Do not use the top-level Swift package as the build source. The new repository's `Package.swift` is intentionally empty for the app project and no longer exposes the `lookinside` executable product.
- Keep the formula separate from the app cask so `brew install lookinside-cli` installs only the command-line tool.

## Chosen Approach

Use a dedicated formula at `Formula/lookinside-cli.rb` that downloads the official CLI zip from the upstream GitHub release and installs the contained `lookinside` executable:

- release URL: `https://github.com/LookInsideApp/LookInside/releases/download/<version>/LookInside-<version>-macOS-cli.zip`
- install target: `lookinside`
- livecheck source: GitHub latest release on `https://github.com/LookInsideApp/LookInside`

This follows the current upstream packaging layout and cleanly separates the CLI from the app cask.

## Alternatives Considered

### 1. Export a binary from the app cask

Rejected. It couples CLI lifecycle to the GUI app artifact, makes upgrades less explicit, and does not match Homebrew core’s normal division between formulae and casks.

### 2. Build from the source tarball with SwiftPM

Rejected for the current upstream layout. `LookInsideApp/LookInside` no longer exposes a SwiftPM executable product for `lookinside` from the top-level package.

## Behavior

- `brew install lookinside-cli` installs the `lookinside` binary.
- `brew upgrade lookinside-cli` fetches the newer upstream CLI artifact.
- The formula should be safe to audit/style-check with standard Homebrew tooling.

## Validation

- `brew style --formula Zach677/star/lookinside-cli`
- `brew audit --formula Zach677/star/lookinside-cli`
- `brew install Zach677/star/lookinside-cli`
- `lookinside --help`
