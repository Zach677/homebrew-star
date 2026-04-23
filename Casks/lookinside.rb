cask "lookinside" do
  version "2.2.7"
  sha256 "04d6091beafea5b9a9f86abfe30b1ad76741e7ba6c3292c3e17ae7aa0f85e9ea"

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
