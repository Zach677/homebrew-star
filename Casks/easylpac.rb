cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.6.6"
  sha256 arm:   "3717b929eacf7c4a3d209d43109c9f744561d6bdb6b8cc78ccf9070e0bc80213",
         intel: "361e92353ea0c7c2c1e5720c75dc330e126213fa29f08cb0279344fe9345656a"

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
