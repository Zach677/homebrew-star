cask "injectgui" do
  version "1.0.0"
  sha256 "7d4822b1c2765b4480dee50595fae5fd3be62863c3114e2bdc95a3537d82c8c8"

  url "https://github.com/wibus-wee/InjectGUI/releases/download/v#{version}/InjectGUI.dmg"
  name "InjectGUI"
  desc "macOS Integrated Injection Framework (GUI version)"
  homepage "https://github.com/wibus-wee/InjectGUI/tree/main"

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