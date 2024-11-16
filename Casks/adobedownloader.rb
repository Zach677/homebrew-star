cask "adobedownloader" do
  version "1.3.0"
  sha256 "a3e2f450176bbe5f1ecc746bef0af533644a1f79be39dba32cd1e6c4ac2f37a2"

  url "https://github.com/X1a0He/Adobe-Downloader/releases/download/#{version}/Adobe.Downloader.dmg"
  name "Adobe-Downloader"
  desc "Adobe apps download & installer"
  homepage "https://github.com/X1a0He/Adobe-Downloader"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Adobe Downloader.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Adobe Downloader.app"]
  end

  # No zap stanza required
end
