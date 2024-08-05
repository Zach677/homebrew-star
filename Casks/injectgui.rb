cask "injectgui" do
  version "1.1.1"
  sha256 "133be6a4c381f02015c1e9058e10149f3954e88cbe2ef4dbcdfd63fc8d74a0fb"

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
