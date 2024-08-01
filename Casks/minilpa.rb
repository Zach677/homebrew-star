cask "minilpa" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.1.0"
  sha256 arm:   "C40D23CD6BE72C36757CAC883F1EBA27AEA8DADA1D67334B9A365791C281CD9A",
         intel: "E130FB021ACA5794CBA7E676099E390F8C5179F75711B3AD33AA5DBA469A3A43"

  url "https://github.com/EsimMoe/MiniLPA/releases/download/v#{version}/MiniLPA-macOS-#{arch}.dmg"
  name "MiniLPA"
  desc "Professional LPA UI"
  homepage "https://github.com/EsimMoe/MiniLPA"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "MiniLPA.app"

  # No zap stanza required
end
