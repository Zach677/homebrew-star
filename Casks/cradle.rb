cask "cradle" do
  version "0.0.0-dev.20260621.1,dev-20260621.1"
  sha256 "5a9e1568c17130790a2cbfafdf64c1974c6b553e10cf68d3096f368766e85ab6"

  url "https://github.com/wibus-wee/cradle-app/releases/download/#{version.csv.second}/Cradle.dmg",
      verified: "github.com/wibus-wee/cradle-app/"
  name "Cradle"
  desc "Command center for coordinating AI coding agents"
  homepage "https://cradle.wibus.ren/"

  livecheck do
    skip "Only development pre-releases are published"
  end

  depends_on macos: :monterey

  app "Cradle.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Cradle.app"]
  end

  zap trash: [
    "~/Library/Application Support/@cradle",
    "~/Library/Preferences/com.cradle.app.plist",
  ]
end
