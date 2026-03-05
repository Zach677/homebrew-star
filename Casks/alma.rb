cask "alma" do
  arch arm: "arm64", intel: "x64"

  version "0.0.659"
  sha256 arm:   "c35f340280085b84f20de5f76b13f634190e79ce41c57b59d556b7483031df1c",
         intel: "cd73111b2bc853f0044a595332c72ed8003be5a8db44410fe2f4669118e9b50a"

  url "https://updates.alma.now/alma-#{version}-mac-#{arch}.dmg"
  name "Alma"
  desc "Elegant AI provider orchestration desktop workbench"
  homepage "https://alma.now/"

  livecheck do
    url "https://updates.alma.now/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Alma.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Alma.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.yetone.alma",
    "~/Library/Caches/com.yetone.alma",
    "~/Library/Containers/com.yetone.alma",
    "~/Library/Preferences/com.yetone.alma.plist",
    "~/Library/Saved Application State/com.yetone.alma.savedState",
  ]
end
