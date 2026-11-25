cask "see" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.7"
  sha256 arm:   "84bb6be1d5b7dc9ba1af1d1e8f70fe618d2c9e38854a08e059bda5433c4f9458",
         intel: "83be85a371f284dcce79f83f04bbabe52bb38f6ebd4e9d6067315cd999fd6e37"

  url "https://github.com/wibus-wee/see/releases/download/v#{version}/see-#{version}-#{arch}.dmg"
  name "See"
  desc "Desktop app for reading source code"
  homepage "https://github.com/wibus-wee/see"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "See.app"

  # The app is ad hoc signed and not notarized.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}/See.app"]
  end

  uninstall quit: "io.github.wibus-wee.see"

  zap trash: [
    "~/Library/Application Support/See",
    "~/Library/Caches/See",
  ]
end
