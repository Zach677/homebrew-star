cask "lookinside" do
  version "3.2.0"
  sha256 "130f04b003752f4c7db2d2c5db9d75f87160f6a17fa829b3ed37a29f3a672fb3"

  url "https://github.com/LookInsideApp/LookInside/releases/download/#{version}/LookInside-#{version}-macOS-app.zip"
  name "LookInside"
  desc "UI inspector for debuggable Apple apps"
  homepage "https://github.com/LookInsideApp/LookInside"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "LookInside.app"

  preflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}/LookInside.app"]
  end

  zap trash: [
    "~/Library/Containers/wiki.qaq.look.inside",
    "~/Library/Preferences/wiki.qaq.look.inside.plist",
  ]
end
