cask "lookinside" do
  version "2.3.0"
  sha256 "8b3e56f5500f713d4ab35fdd53d561003100bca94ad1b6a16382da5c20c4fc6a"

  url "https://github.com/LookInsideApp/LookInside/releases/download/#{version}/LookInside-#{version}-macOS-app.zip"
  name "LookInside"
  desc "UI inspector for debuggable Apple apps"
  homepage "https://github.com/LookInsideApp/LookInside"

  livecheck do
    url :homepage
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
