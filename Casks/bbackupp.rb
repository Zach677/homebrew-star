cask "bbackupp" do
  version "2.4.16"
  sha256 "d532fa58a34dcdc0d3a344384e26ffbba4479dde407e7430857ef12bb1cf5642"

  url "https://github.com/Zach677/NotchDrop/releases/download/#{version}/NotchDrop.dmg"
  name "BBackupp"
  desc "Automated iOS Backup Robot"
  homepage "https://github.com/Lakr233/BBackupp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "BBackupp.app"

  zap trash: [
    "~/Documents/BBackupp",
    "~/Library/HTTPStorages/wiki.qaq.BBackupp",
    "~/Library/HTTPStorages/wiki.qaq.BBackupp.binarycookies",
    "~/Library/Preferences/wiki.qaq.BBackupp.plist",
  ]
end
