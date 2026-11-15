cask "mitori" do
  version "0.3.0"
  sha256 "53485e690b134067ba4c380ce6e9be906fb93a0a8a905e134a7fa5dbcd64ef6b"

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
