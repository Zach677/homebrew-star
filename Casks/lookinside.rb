cask "lookinside" do
  version "2.0.2"
  sha256 "e99ab38216b1891dc27fedd5a05bab5ef6faa30b7eebdbe60750ae85ceee4cb6"

  url "https://github.com/Lakr233/LookInside/releases/download/#{version}/LookInside-#{version}-macOS.zip"
  name "LookInside"
  desc "UI inspector for debuggable Apple apps"
  homepage "https://github.com/Lakr233/LookInside"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "LookInside.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/LookInside.app"]
  end

  zap trash: [
    "~/Library/Containers/wiki.qaq.look.inside",
    "~/Library/Preferences/wiki.qaq.look.inside.plist",
  ]
end
