cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.8.1"
  sha256 arm:   "a7d06c2851b465a92108dd4ed043c7d10de07b0fe762bcbf70f341657bebf2a9",
         intel: "0a06aa41ce58ad4881f13a2840241e84a00e620dd582bb7db72423099d465682"

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
