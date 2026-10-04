cask "lookinside" do
  version "2.3.12"
  sha256 "c5a48be330a6125b93b8193cd6b674661e12d389e3c486b20523df486839f4b4"

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
