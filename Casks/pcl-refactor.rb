cask "pcl-refactor" do
  version "1.0.3"
  sha256 "dd86c3f173ac969562946122b66636582496aa7688d4ea3a9275de33e91d071e"

  url "https://github.com/CylorineStudio/PCL.Mac.Refactor/releases/download/v#{version}/PCL.Mac-v#{version}.dmg",
      verified: "github.com/CylorineStudio/PCL.Mac.Refactor/"
  name "PCL.Mac"
  name "PCL.Mac.Refactor"
  desc "Unofficial SwiftUI rewrite of Plain Craft Launcher"
  homepage "https://cylorine.studio/projects/PCL.Mac.Refactor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "PCL.Mac.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/PCL.Mac.app"]
  end

  zap trash: [
    "~/Library/Containers/org.ceciliastudio.PCL-Mac",
    "~/Library/Preferences/org.ceciliastudio.PCL-Mac.plist",
    "~/Library/Saved Application State/org.ceciliastudio.PCL-Mac.savedState",
  ]
end
