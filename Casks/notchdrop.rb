cask "notchdrop" do
  version "2.8.24"
  sha256 "625bb92b54fdf1cb5234569de78d76425d81989504c8143a9d44ad0e9de26a6c"

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
