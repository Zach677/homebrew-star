cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.8.2"
  sha256 arm:   "d1cbf803c4508cf20446b7085251b0176c46f54a93871121a0d2ee7985ef34f8",
         intel: "4aae893b6c81483c07878d20dc72e133b0b5db78ec16df0b42525c84a92201cb"

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
