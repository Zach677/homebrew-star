cask "antigravity-tools" do
  version "3.3.49"
  sha256 "3f849c5f816439ff5644c4953adc28d644ad8a6e2ac78f448871680d76de155f"

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
