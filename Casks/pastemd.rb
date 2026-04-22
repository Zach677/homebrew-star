cask "pastemd" do
  version "0.1.6.8"
  sha256 "b1fb01aae6543239f4faba5e99670984987e69a7bda1d715f81c78dd1b2b00fd"

  url "https://github.com/RICHQAQ/PasteMD/releases/download/v#{version}/PasteMD-#{version}.dmg"
  name "PasteMD"
  desc "One-click paste Markdown and AI responses into Word, WPS, and Excel"
  homepage "https://github.com/RICHQAQ/PasteMD"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "PasteMD.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/PasteMD.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.richqaq.pastemd",
    "~/Library/Caches/com.richqaq.pastemd",
    "~/Library/Preferences/com.richqaq.pastemd.plist",
    "~/Library/Saved Application State/com.richqaq.pastemd.savedState",
  ]
end
