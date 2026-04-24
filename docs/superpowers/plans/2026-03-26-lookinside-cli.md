# LookInside CLI Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a standalone Homebrew formula that installs the upstream `lookinside` CLI and upgrades cleanly from tagged releases.

**Architecture:** Create one focused formula file in `Formula/lookinside-cli.rb`. Install the official upstream CLI release artifact, keep it separate from the GUI app cask, and validate it with Homebrew style/audit plus an install smoke test.

**Tech Stack:** Homebrew Ruby DSL, GitHub release assets, macOS CLI binary distribution

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
  homepage "https://github.com/LookInsideApp/LookInside"
  url "https://github.com/LookInsideApp/LookInside/releases/download/2.2.7/LookInside-2.2.7-macOS-cli.zip"
  sha256 "7d6963ea4984627d48c3aaa52628123b24099502497aabf6c1f4065099bd69b4"
  license "GPL-3.0-only"
end
```

- [ ] **Step 2: Add the build/install logic**

Install the upstream CLI artifact directly:

```ruby
depends_on arch: :arm64
depends_on macos: :sonoma

def install
  bin.install "lookinside"
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

- [ ] **Step 1: Install the formula**

Run:

```bash
HOMEBREW_NO_INSTALL_FROM_API=1 brew install Zach677/star/lookinside-cli
```

Expected: Homebrew downloads the upstream CLI artifact and links `lookinside`

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
