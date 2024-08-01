cask "easylpac" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.6.2"
  sha256 arm: "0a3c84b1837bfa7ad74358c11b292c76e317e5815c93593fcf7ef4496c721d59",
         intel: "2d127c29d8f1ebd8cd1bdaea6ae3a84dad606e3eefbc66399b996fce2e641d41"

  url "https://github.com/creamlike1024/EasyLPAC/releases/download/#{version}/EasyLPAC-macOS-#{arch}-with-lpac.dmg"
  name "EasyLPAC"
  desc "lpac GUI Frontend"
  homepage "https://github.com/creamlike1024/EasyLPAC"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "EasyLPAC.app"

  # preflight do
  #   system_command "xattr",
  #                  args: ["-d", "com.apple.FinderInfo", "#{staged_path}/EasyLPAC.app"]
  # end

  zap trash: ""
end