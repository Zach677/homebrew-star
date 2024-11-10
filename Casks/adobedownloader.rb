cask "adobedownloader" do
  version "1.0.1"
  sha256 "8bf8da37b2e4be99f2e5bc07ca4b182e1a9cfb324b046dd31d0cc3b0e7c15f79"

  url "https://github.com/X1a0He/Adobe-Downloader/releases/download/#{version}/Adobe.Downloader.dmg"
  name "Adobe-Downloader"
  desc "macOS Adobe apps download & installer"
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

  # zap trash: [
  #   "~/Library/Application Scripts/wiki.qaq.NotchDrop",
  #   "~/Library/Containers/wiki.qaq.NotchDrop",
  # ]
end
