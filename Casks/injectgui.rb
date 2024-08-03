cask "injectgui" do
  version "1.1"
  sha256 "53bab4fc0746ab4aebc80e1e7261774c6c8b58db10d81033d3fa0dd8b74f86aa"

  url "https://github.com/wibus-wee/InjectGUI/releases/download/v#{version}/InjectGUI.dmg"
  name "InjectGUI"
  desc "macOS Integrated Injection Framework (GUI version)"
  homepage "https://github.com/wibus-wee/InjectGUI"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "InjectGUI.app"

  zap trash: [
    "~/Library/Application Support/InjectGUI",
    "~/Library/Caches/dev.wibus-wee.InjectGUI",
    "~/Library/HTTPStorages/dev.wibus-wee.InjectGUI",
    "~/Library/Preferences/dev.wibus-wee.InjectGUI.plist",
    "~/Library/Saved Application State/dev.wibus-wee.InjectGUI.savedState",
  ]
end