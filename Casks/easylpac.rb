cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.0.2"
  sha256 arm:   "1b14ef3bfa3e746ed52c42ded74388b3de3fe77e886dce80650d47d121bd2459",
         intel: "86fd4b8e72ec50de3b2fd723a853eb533b679a82d33d973a77d9527fe9d62095"

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
