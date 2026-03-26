# LookInside CLI Homebrew Formula Design

## Goal

Add a separate Homebrew formula for the upstream `lookinside` command-line tool so users can install and upgrade it independently from the GUI app cask.

## Constraints

- Keep the existing `/Users/star/Developer/zach-repo/homebrew-star/Casks/lookinside.rb` unchanged as the GUI app entry.
- Avoid manual local compilation on every update; Homebrew should rebuild from source during `brew upgrade lookinside-cli`.
- Follow Homebrew core-style Swift formula patterns instead of inventing a weird custom install path.

## Chosen Approach

Use a dedicated formula at `Formula/lookinside-cli.rb` that downloads the upstream GitHub source tarball for a tagged release and builds only the `lookinside` executable with SwiftPM:

- source URL: `https://github.com/Lakr233/LookInside/archive/refs/tags/<version>.tar.gz`
- build command: `swift build --disable-sandbox --configuration release --product lookinside`
- install target: `.build/release/lookinside`

This matches common Homebrew core patterns for Swift CLIs and cleanly separates the CLI from the app cask.

## Alternatives Considered

### 1. Export a binary from the app cask

Rejected. It couples CLI lifecycle to the GUI app artifact, makes upgrades less explicit, and does not match Homebrew core’s normal division between formulae and casks.

### 2. Ship a prebuilt CLI artifact

Rejected. Upstream does not publish a standalone CLI binary today, so the tap would need its own build/distribution pipeline.

## Behavior

- `brew install lookinside-cli` installs the `lookinside` binary.
- `brew upgrade lookinside-cli` fetches the newer source tag and rebuilds it.
- The formula should be safe to audit/style-check with standard Homebrew tooling.

## Validation

- `brew style --formula Formula/lookinside-cli.rb`
- `brew audit --formula Zach677/star/lookinside-cli`
- `brew install --build-from-source Zach677/star/lookinside-cli`
- `lookinside --help`
