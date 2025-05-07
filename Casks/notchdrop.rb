cask "notchdrop" do
  version "2.17.50"
  sha256 "ece485ef3c80ccc5353d6f4f16d61faba6fdd77b4aa260a9614856cbb6ce0223"

  url "https://github.com/Zach677/NotchDrop/releases/download/#{version}/NotchDrop.dmg"
  name "NotchDrop"
  desc "Transform your MacBook's notch into a convenient file drop zone"
  homepage "https://github.com/Lakr233/NotchDrop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "NotchDrop.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/NotchDrop.app"]
  end

  zap trash: [
    "~/Library/Application Scripts/wiki.qaq.NotchDrop",
    "~/Library/Containers/wiki.qaq.NotchDrop",
  ]
end
