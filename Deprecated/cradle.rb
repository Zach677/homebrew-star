cask "cradle" do
  version "20260621.4"
  sha256 "64cc0fe79efbc98113791fd9bcfbe13c8dc97034a192e47b805131d7ac5f8cad"

  url "https://github.com/wibus-wee/cradle-app/releases/download/dev-#{version}/Cradle.dmg"
  name "Cradle"
  desc "Command center for coordinating AI coding agents"
  homepage "https://cradle.wibus.ren/"

  livecheck do
    url "https://github.com/wibus-wee/cradle-app.git"
    regex(/^dev[._-](\d{8}(?:\.\d+)?)$/i)
    strategy :git
  end

  depends_on macos: :monterey

  app "Cradle.app"

  preflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}/Cradle.app"]
  end

  zap trash: [
    "~/Library/Application Support/@cradle",
    "~/Library/Preferences/com.cradle.app.plist",
  ]
end
