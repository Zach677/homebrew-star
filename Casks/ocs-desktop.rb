cask "ocs-desktop" do
  arch arm: "arm64", intel: "x64"

  version "2.9.28"
  sha256 arm:   "abd7451b585a4a479f6afca222ce971e08ccc3e3727b83822564e1bc2291f460",
         intel: "56735796d5a11474dd250ec541fba9cc7f0cd05a8b6f4cdb0edf4f0833ec5911"

  url "https://github.com/ocsjs/ocs-desktop/releases/download/#{version}/ocs-#{version}-setup-mac-#{arch}.dmg"
  name "OCS Desktop"
  desc "Desktop app for OCS browser automation workflows"
  homepage "https://docs.ocsjs.com/docs/app"

  livecheck do
    skip "GitHub latest releases do not consistently include macOS artifacts"
  end

  app "OCS Desktop.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/OCS Desktop.app"]
  end
end
