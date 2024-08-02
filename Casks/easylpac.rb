cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.6.3"
  sha256 arm:   "93df28ab4e350b1e3e9149026cb2b14149e3a2768b3189b9d426790eb6e7c17c",
         intel: "2e615cf715c751ee815c3473e612f57ea8e5576b20857386feebaefbe9228c41"

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
