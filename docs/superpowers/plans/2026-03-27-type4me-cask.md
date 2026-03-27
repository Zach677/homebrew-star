# Type4Me Cask Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a working `type4me` Homebrew cask that installs the upstream macOS app from its GitHub DMG release.

**Architecture:** Implement a single new cask file under `Casks/`, following the tap's existing GitHub-release DMG pattern. Because this is a package-definition change rather than app source code, validation uses `brew audit` and an install test instead of unit tests.

**Tech Stack:** Homebrew cask DSL, GitHub Releases, macOS `hdiutil`, `shasum`, `xattr`

---

### Task 1: Capture upstream release facts

**Files:**
- Modify: `docs/superpowers/specs/2026-03-27-type4me-cask-design.md`
- Test: upstream release asset inspection commands

- [ ] **Step 1: Inspect the latest release asset and app metadata**

Run:

```bash
curl -fsSL https://api.github.com/repos/joewongjc/type4me/releases/latest | jq '{tag_name, assets: [.assets[] | {name, browser_download_url}]}'
```

Expected:

- latest tag is available
- DMG asset naming matches `Type4Me-<version>.dmg`

- [ ] **Step 2: Download the DMG and compute the checksum**

Run:

```bash
curl -L --fail https://github.com/joewongjc/type4me/releases/download/v1.2.3/Type4Me-1.2.3.dmg -o /tmp/Type4Me-1.2.3.dmg
shasum -a 256 /tmp/Type4Me-1.2.3.dmg
```

Expected:

- a stable SHA-256 value to embed in the cask

- [ ] **Step 3: Confirm the app bundle name and bundle identifier**

Run:

```bash
attach=$(hdiutil attach -nobrowse -readonly /tmp/Type4Me-1.2.3.dmg | tail -n 1 | awk '{print $3}')
find "$attach" -maxdepth 2 -name '*.app'
/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "$attach/Type4Me.app/Contents/Info.plist"
hdiutil detach "$attach"
```

Expected:

- app name is `Type4Me.app`
- bundle id is `com.type4me.app`

### Task 2: Add the cask file

**Files:**
- Create: `Casks/type4me.rb`
- Test: `brew audit --cask ./Casks/type4me.rb`

- [ ] **Step 1: Write the cask definition**

Include:

- `version "1.2.3"`
- computed `sha256`
- GitHub release `url`
- `name`, `desc`, `homepage`
- `livecheck` with `strategy :github_latest`
- `depends_on macos: ">= :sonoma"`
- `app "Type4Me.app"`
- `preflight` calling `xattr -cr`
- conservative `zap` paths using `Type4Me` and `com.type4me.app`

- [ ] **Step 2: Run audit**

Run:

```bash
brew audit --cask ./Casks/type4me.rb
```

Expected:

- exit code 0
- no cask DSL or style errors

### Task 3: Verify installation behavior

**Files:**
- Modify: `Casks/type4me.rb` if audit/install uncovers issues
- Test: local install from cask file path

- [ ] **Step 1: Install the cask locally**

Run:

```bash
brew install --cask ./Casks/type4me.rb
```

Expected:

- Homebrew stages the DMG and installs `Type4Me.app`

- [ ] **Step 2: Confirm the installed app exists**

Run:

```bash
test -d "/Applications/Type4Me.app"
```

Expected:

- exit code 0

- [ ] **Step 3: Re-audit after any fixups**

Run:

```bash
brew audit --cask ./Casks/type4me.rb
```

Expected:

- still clean after final edits
