cask "lookinside" do
  version "2.3.11"
  sha256 "4c972b735f643bbc06e91df05a84375b5caa3d266507b0947d49aaedef82c23e"

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
