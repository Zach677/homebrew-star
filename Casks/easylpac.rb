cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.8.4"
  sha256 arm:   "292b9474b917c559d48365f31ef1bc5e45e3c53a7af799dae92dffddfe9e5090",
         intel: "9e19f71add70a33fc58259089ae9f6b8cf027c6a67e38cc405232fc4bf72c282"

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
