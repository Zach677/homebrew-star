cask "antigravity-tools" do
  version "4.1.16"
  sha256 "2d513ff88dc857305c32059acf2f776c0aa52f623ac7e4fbe1ee7b8063a5d64c"

  url "https://github.com/lbjlaq/Antigravity-Manager/releases/download/v#{version}/Antigravity.Tools_#{version}_universal.dmg"
  name "Antigravity Tools"
  desc "Professional Account Management for AI Services"
  homepage "https://github.com/lbjlaq/Antigravity-Manager"

  app "Antigravity Tools.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Antigravity Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.lbjlaq.antigravity-tools",
    "~/Library/Caches/com.lbjlaq.antigravity-tools",
    "~/Library/Preferences/com.lbjlaq.antigravity-tools.plist",
    "~/Library/Saved Application State/com.lbjlaq.antigravity-tools.savedState",
  ]
end
