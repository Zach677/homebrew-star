cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.0.3"
  sha256 arm:   "7d4c376d589f959db61a229a45c533642e31c0a224412a724abd002d72899e6b",
         intel: "090d1a72d14257bf18d22256ac0bf3acdab422298896fb4c8bee35718881e91a"

  url "https://github.com/creamlike1024/EasyLPAC/releases/download/#{version}/EasyLPAC-macOS-#{arch}-with-lpac.dmg"
  name "EasyLPAC"
  desc "Lpac GUI Frontend"
  homepage "https://github.com/creamlike1024/EasyLPAC"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "EasyLPAC.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/EasyLPAC.app"]
  end

  # No zap stanza required
end
