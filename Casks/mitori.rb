cask "mitori" do
  version "0.3.1"
  sha256 "9ffe5479a632b6967a83d0c3b10e25f06df7cf08d5dad95fc1a74483ba126a99"

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
