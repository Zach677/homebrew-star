cask "adobedownloader" do
  version "1.4.0"
  sha256 "1dbf354dc194aebdeafd96f329963297a856df2a83b3113e14c29d92a4018813"

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
