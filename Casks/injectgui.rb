cask "injectgui" do
  version "1.2.0"
  sha256 "ee6ae1ce40b1f1e8b09ef27c1f786eaf73660dd02d3c4c78600db3ec7115831f"

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
