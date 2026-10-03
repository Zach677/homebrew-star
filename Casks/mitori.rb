cask "mitori" do
  version "0.2.3"
  sha256 "8c36fc3b97cce810b76cec8de6e1359b1f0041dd3efa4b2f2f5f13182402c0af"

  url "https://github.com/Zach677/mitori/releases/download/v#{version}/Mitori-#{version}.dmg"
  name "Mitori"
  desc "Monitor Apple ID store credit balances from the menu bar"
  homepage "https://github.com/Zach677/mitori"

  depends_on macos: :sonoma

  app "Mitori.app"

  preflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}/Mitori.app"]
  end

  zap trash: "~/Library/Application Support/Mitori"
end
