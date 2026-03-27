cask "type4me" do
  version "1.2.3"
  sha256 "b31dacffdc7d4968b29f91e501b62bf0f616baea523e2e2222d089e5d926cf2f"

  url "https://github.com/joewongjc/type4me/releases/download/v#{version}/Type4Me-#{version}.dmg"
  name "Type4Me"
  desc "Speech input app for macOS"
  homepage "https://github.com/joewongjc/type4me"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Type4Me.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Type4Me.app"]
  end

  zap trash: [
    "~/Library/Application Support/Type4Me",
    "~/Library/Caches/com.type4me.app",
    "~/Library/Preferences/com.type4me.app.plist",
    "~/Library/Saved Application State/com.type4me.app.savedState",
  ]
end
