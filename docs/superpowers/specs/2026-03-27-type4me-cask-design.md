# Type4Me Cask Design

## Goal

Add `type4me` to this tap as a Homebrew cask so users can install the upstream macOS app directly from the published GitHub DMG release.

## Current Context

- This tap already ships macOS desktop apps through `Casks/*.rb`.
- Several existing casks in this repo remove quarantine attributes in `preflight` with `xattr -cr`.
- Upstream `joewongjc/type4me` publishes a DMG release asset named `Type4Me-<version>.dmg`.
- Upstream documents macOS 14+ support.

## Chosen Approach

Implement `type4me` as a standard DMG-backed cask in `Casks/type4me.rb` with:

- `version` and `sha256` pinned to the latest upstream release
- GitHub release URL templated with `v#{version}`
- `livecheck` using `:github_latest`
- `depends_on macos: ">= :sonoma"`
- `app "Type4Me.app"`
- `preflight` quarantine removal with `xattr -cr`, matching existing tap conventions
- a conservative `zap` stanza for clearly attributable local files

## Tradeoffs

### Keep `xattr -cr` in `preflight`

Pros:

- Matches the existing style already used in this tap
- Reduces first-launch friction for non-notarized or quarantined upstream apps

Cons:

- More opinionated than a stock cask

Decision:

- Accept this tradeoff because the repo already standardizes on this behavior for similar apps.

### Conservative `zap` only

Pros:

- Avoids deleting speculative paths
- Still removes the main local app data directory and obvious preference/cache files

Cons:

- May leave behind niche files if upstream adds more storage later

Decision:

- Prefer correctness over aggressive cleanup.

## File Design

### `Casks/type4me.rb`

Responsibility:

- Define install metadata for the Type4Me app
- Install `Type4Me.app` from the upstream DMG
- Remove quarantine attributes before install
- Advertise livecheck/update compatibility
- Provide safe cleanup paths via `zap`

### `docs/superpowers/plans/2026-03-27-type4me-cask.md`

Responsibility:

- Record the concrete implementation and verification steps for this cask addition

## Verification Plan

- Download the upstream DMG and compute `sha256`
- Confirm the mounted DMG contains `Type4Me.app`
- Confirm the app bundle identifier is `com.type4me.app`
- Run `brew audit --cask ./Casks/type4me.rb`
- Run a local install test of the cask from the file path
