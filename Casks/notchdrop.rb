cask "notchdrop" do
  version "2.14.38"
  sha256 "eca659bb8e694b4fdf3aa57d99a346d6f3a41c51c018514d3f552aed3e6772f2"

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
