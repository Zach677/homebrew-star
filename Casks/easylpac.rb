cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.9.1"
  sha256 arm:   "2d368045738f2891ce71590e4cb12db11c374f449ee4b014b0e439e35adfbe6a",
         intel: "ebd9d88d3d15c8d73aeba480f36ff975acafedfef00e072c9c987b2178fcad7f"

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
