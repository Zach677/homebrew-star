cask "notchdrop" do
  version "2.4.16"
  sha256 "d532fa58a34dcdc0d3a344384e26ffbba4479dde407e7430857ef12bb1cf5642"

  url "https://github.com/Zach677/NotchDrop/releases/download/#{version}/NotchDrop.dmg"
  name "NotchDrop"
  desc "Transform your MacBook's notch into a convenient file drop zone."
  homepage "https://github.com/Lakr233/NotchDrop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "NotchDrop.app"

zap trash: [
    "~/Library/Application Scripts/wiki.qaq.NotchDrop",
    "~/Library/Containers/wiki.qaq.NotchDrop",
  ]
end