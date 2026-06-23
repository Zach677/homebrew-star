cask "lookinside" do
  version "2.3.8"
  sha256 "9f909095d566966ba8563c68b7a4f4b1add6c9231a2abbf79d51d05e9d21e54a"

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

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/LookInside.app"]
  end

  zap trash: [
    "~/Library/Containers/wiki.qaq.look.inside",
    "~/Library/Preferences/wiki.qaq.look.inside.plist",
  ]
end
