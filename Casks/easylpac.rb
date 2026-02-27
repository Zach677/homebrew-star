cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.9.2"
  sha256 arm:   "5ddb2a3e36ad54c56ec0cd08b93cba19664231c81c12eb546574e62ce45f2637",
         intel: "17cf616a016ea20b627d80017ad869660144f429fe9a9d95b2d3f45c3ff4b9bd"

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
