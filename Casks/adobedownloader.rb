cask "adobedownloader" do
  version "2.0.1"
  sha256 "bbdb0d42f130a3e2a41a9d5f2a31901dc32498b3f75831e3d73e10bb39432e72"

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
