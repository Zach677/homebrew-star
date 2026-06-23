cask "pastemd" do
  version "0.1.7.1"
  sha256 "0f74864a9071c359842b146d10885ae52c9448293d1cc7e07b2163f99787a75b"

  url "https://github.com/RICHQAQ/PasteMD/releases/download/v#{version}/PasteMD-#{version}.dmg"
  name "PasteMD"
  desc "One-click paste Markdown and AI responses into Word, WPS, and Excel"
  homepage "https://github.com/RICHQAQ/PasteMD"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

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
