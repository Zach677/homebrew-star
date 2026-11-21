cask "mitori" do
  version "0.3.2"
  sha256 "19c44b1265de804ea6ce9dff47f9aa873b28f344ff852afbf725450e899298a1"

  url "https://github.com/Zach677/mitori/releases/download/v#{version}/Mitori-#{version}.dmg"
  name "Mitori"
  desc "Monitor Apple ID store credit balances from the menu bar"
  homepage "https://github.com/Zach677/mitori"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Mitori.app"

  uninstall quit: "dev.zach.mitori"

  zap trash: [
    "~/Library/Application Support/Mitori",
    "~/Library/Preferences/dev.zach.mitori.plist",
  ]
end
