cask "claude-island" do
  version "1.4.3"
  sha256 "ecb04661191c429086b8b4a2a4dbe3a8c6277b09a8514757b800a1141ff1d5f8"

  url "https://github.com/engels74/claude-island/releases/download/#{version}/ClaudeIsland-#{version}.dmg"
  name "Claude Island"
  desc "Claude Code notifications without the context switch"
  homepage "https://github.com/engels74/claude-island"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Claude Island.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Claude Island.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.engels74.ClaudeIsland",
    "~/Library/Caches/com.engels74.ClaudeIsland",
    "~/Library/Preferences/com.engels74.ClaudeIsland.plist",
    "~/Library/Saved Application State/com.engels74.ClaudeIsland.savedState",
  ]
end
