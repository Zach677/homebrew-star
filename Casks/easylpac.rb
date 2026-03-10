cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.9.3"
  sha256 arm:   "c53183fef01e113b4f5f6c7924dd41c1e391ff79d78b52e163ada5abaa1a0bb4",
         intel: "8d203334d79dfed08f90451f62f255de70fc6a78b7d5f63e909494abd6cbf2e7"

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
