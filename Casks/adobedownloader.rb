cask "adobedownloader" do
  version "2.1.2"
  sha256 "97215c113acf737151cb5dd15ed7badea50b7c269eaac427e6ff42388ef6e794"

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
