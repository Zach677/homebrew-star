cask "notchdrop" do
  version "2.6.22"
  sha256 "14fa9d379c9409a3dab9c2da190b38a8d96749a77c96954c4b553d109da0131e"

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

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/NotchDrop.app"]
  end

zap trash: [
    "~/Library/Application Scripts/wiki.qaq.NotchDrop",
    "~/Library/Containers/wiki.qaq.NotchDrop",
  ]
end