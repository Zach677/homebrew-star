cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.7.1"
  sha256 arm:   "383fda590d2715b370994c666fe665e76aabcabe0835b9c838b844ddc04b6c67",
         intel: "00c118d7eb102692822a7c11b830029170a025da8542820114e912888d18464f"

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
