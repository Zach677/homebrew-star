cask "antigravity-tools" do
  version "4.1.29"
  sha256 "37851a5b6b26e3b2fc03c08f61e0967e50e2a68ff96040451446c8447cceedd2"

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
