cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.6.5"
  sha256 arm:   "ea17147e25adeeadadb1a20b51152a2940bb5b12b0b0e31effd41e313a76d348",
         intel: "03247003aab46fcd06deab099ce5a445eb83e0696411b6f61b7664c17eb135c7"

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
