cask "minilpa" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.1.1"
  sha256 arm:   "e88982c3880646550a1cc275ea8ff4c78231cf9dadd764128ccc61c7d3a8f1d6",
         intel: "59e04dbdbf47a717bfd140d388bd4255797cfff6b1f76ea8d0ec67066b0119b1"

  url "https://github.com/EsimMoe/MiniLPA/releases/download/v#{version}/MiniLPA-macOS-#{arch}.dmg"
  name "MiniLPA"
  desc "Professional LPA UI"
  homepage "https://github.com/EsimMoe/MiniLPA"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "MiniLPA.app"

  zap trash: "~/.minilpa"
end
