cask "bbackupp" do
  version "1.1.14"
  sha256 "fb5c1c0cfc93e69ea8341916e1f6b81692f57f52b4e4770a347eaf6d99c11482"

  url "https://github.com/Lakr233/BBackupp/releases/download/#{version}/BBackupp.app.zip"
  name "BBackupp"
  desc "Automated iOS Backup Robot"
  homepage "https://github.com/Lakr233/BBackupp"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "BBackupp.app"

  zap trash: [
    "~/Documents/BBackupp",
    "~/Library/HTTPStorages/wiki.qaq.BBackupp",
    "~/Library/HTTPStorages/wiki.qaq.BBackupp.binarycookies",
    "~/Library/Preferences/wiki.qaq.BBackupp.plist",
  ]
end