cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.8.3"
  sha256 arm:   "c107ec1873332894d44b1c36baa26e6771731f287cd23fd2255f926c172c71c9",
         intel: "49ad327feb56ab037b468d7c784cfac4207a1cdfffdf260d09855230b10bfce9"

  url "https://github.com/creamlike1024/EasyLPAC/releases/download/#{version}/EasyLPAC-macOS-#{arch}-with-lpac.dmg"
  name "EasyLPAC"
  desc "Lpac GUI Frontend"
  homepage "https://github.com/creamlike1024/EasyLPAC"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "EasyLPAC.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/EasyLPAC.app"]
  end

  # No zap stanza required
end
