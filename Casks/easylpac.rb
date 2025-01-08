cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.7.2"
  sha256 arm:   "5f71ace9dd3d0a614d4db79945ee4e1b95764ee27ff03c5bfdfd6b38deac7546",
         intel: "b858dd8917c06d54c2a4fd1f6e6e9b60f171780b6f008c2ae984ac950f79fefb"

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
