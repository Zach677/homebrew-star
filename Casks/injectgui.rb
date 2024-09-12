cask "injectgui" do
  version "1.2.2"
  sha256 "ab71a122909eda6edd81cfd068a9ba881ef727dc846e8b2b15e51f70e4a2a503"

  url "https://github.com/wibus-wee/InjectGUI/releases/download/v#{version}/InjectGUI.dmg"
  name "InjectGUI"
  desc "Integrated Injection Framework (GUI version)"
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
