cask "antigravity-tools" do
  version "4.0.14"
  sha256 "822eccc71766f1fbba34c53ecaa3cc2a97e52d4167acd945892de92407c00c66"

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
