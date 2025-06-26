cask "flowdown" do
  version "1.18.180"
  sha256 "4c5b75b1c2af0b63f390ee89e9e72131dec3b821e8db151e1cf9f4b62d4eedc3"

  url "https://github.com/Lakr233/FlowDown/releases/download/#{version}/FlowDown-v#{version}.zip"
  name "FlowDown"
  desc "FlowDown is a fast, user-friendly AI agent app for macOS."
  homepage "https://flowdown.ai/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "FlowDown.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/FlowDown.app"]
  end

  zap trash: [
    "~/Library/Containers/wiki.qaq.flow.FlowDownWidget",
    "~/Library/Containers/wiki.qaq.FlowDown.Community",
  ]
end
