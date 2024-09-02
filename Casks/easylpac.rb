cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.6.4"
  sha256 arm:   "cd991b903795309d0999404f3ebe4c57f39aa647c2d01b9057ca71a6611f8741",
         intel: "b81cef35202e4eeb974a0bd64cf14363d80a993281a5fffcca383f0caef9a356"

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
