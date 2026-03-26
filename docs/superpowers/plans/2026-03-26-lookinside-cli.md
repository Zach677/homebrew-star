# LookInside CLI Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a standalone Homebrew formula that installs the upstream `lookinside` CLI and upgrades cleanly from tagged source releases.

**Architecture:** Create one focused formula file in `Formula/lookinside-cli.rb`. Build the `lookinside` executable from the upstream source tarball with SwiftPM, install only the CLI binary, and validate it with Homebrew style/audit plus a source install smoke test.

**Tech Stack:** Homebrew Ruby DSL, SwiftPM, GitHub release tags, macOS system Swift/Xcode toolchain

---

## File Structure

- Create: `/Users/star/Developer/zach-repo/homebrew-star/Formula/lookinside-cli.rb`
- Create: `/Users/star/Developer/zach-repo/homebrew-star/docs/superpowers/specs/2026-03-26-lookinside-cli-design.md`
- Create: `/Users/star/Developer/zach-repo/homebrew-star/docs/superpowers/plans/2026-03-26-lookinside-cli.md`
- Keep: `/Users/star/Developer/zach-repo/homebrew-star/Casks/lookinside.rb`

### Task 1: Add the formula

**Files:**
- Create: `/Users/star/Developer/zach-repo/homebrew-star/Formula/lookinside-cli.rb`
- Test: local `brew` style/audit output

- [ ] **Step 1: Write the formula skeleton**

Create a formula with:

```ruby
class LookinsideCli < Formula
  desc "Command-line inspector for debuggable Apple apps"
  homepage "https://github.com/Lakr233/LookInside"
  url "https://github.com/Lakr233/LookInside/archive/refs/tags/2.0.2.tar.gz"
  sha256 "ef153f81ad143b4e609599581b415091ad169bd34fa77884972e8af7d70bfa5f"
  license "GPL-3.0-only"
end
```

- [ ] **Step 2: Add the build/install logic**

Use the minimal Swift formula pattern:

```ruby
uses_from_macos "swift" => :build

def install
  system "swift", "build", "--disable-sandbox", "--configuration", "release", "--product", "lookinside"
  bin.install ".build/release/lookinside"
end
```

- [ ] **Step 3: Add a lightweight test block**

Use:

```ruby
test do
  assert_match "Inspect debuggable app targets from the command line",
               shell_output("#{bin}/lookinside --help")
end
```

- [ ] **Step 4: Run style checks**

Run:

```bash
brew style --formula Zach677/star/lookinside-cli
```

Expected: `1 file inspected, no offenses detected`

- [ ] **Step 5: Run audit**

Run:

```bash
HOMEBREW_NO_INSTALL_FROM_API=1 brew audit --formula Zach677/star/lookinside-cli
```

Expected: exits successfully with no formula offenses

### Task 2: Smoke-test installation

**Files:**
- Modify: `/Users/star/Developer/zach-repo/homebrew-star/Formula/lookinside-cli.rb`
- Test: installed binary behavior

- [ ] **Step 1: Build the formula from source**

Run:

```bash
HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source Zach677/star/lookinside-cli
```

Expected: Homebrew builds the executable and links `lookinside`

- [ ] **Step 2: Verify runtime**

Run:

```bash
lookinside --help
```

Expected: help text mentions listing/inspecting/exporting targets

- [ ] **Step 3: Clean up test install if needed**

Run:

```bash
brew uninstall lookinside-cli
```

Expected: formula removes cleanly
