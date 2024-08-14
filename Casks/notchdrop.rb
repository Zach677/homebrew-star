cask "notchdrop" do
  version "2.12.35"
  sha256 "655a8253d6b8264071180e6aae1cad68a0a8e47a8a9814a4fe7470b145e60643"

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
