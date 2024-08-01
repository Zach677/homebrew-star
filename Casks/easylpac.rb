cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.6.2"
  sha256 arm: "1fcfe6f7658d4d7b3ff49802a90b7b665b80c0d8b101569ee0eb8564162eae62",
         intel: "712932a6fa4c1ed0bb53d7d6a41bb94b977bccc17abaca234bb9cea409a65096"

  url "https://github.com/creamlike1024/EasyLPAC/releases/download/#{version}/EasyLPAC-macOS-#{arch}-with-lpac.dmg"
  name "EasyLPAC"
  desc "lpac GUI Frontend"
  homepage "https://github.com/creamlike1024/EasyLPAC"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "EasyLPAC.app"

  zap trash: ""
  end