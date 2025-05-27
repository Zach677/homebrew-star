cask "sentry" do
  version "1.3.1"
  sha256 "2e2a0204c8107d5642c94805bbcbf4bd4dd5b03489ee205a20776fd02c03d743"

  url "https://github.com/Zach677/Sentry/releases/download/#{version}/Sentry.dmg"
  name "Sentry"
  desc "A powerful security monitoring application that detects unauthorized access attempts and records video evidence for you."
  homepage "https://github.com/Lakr233/Sentry"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Sentry.app"

  zap trash: [
    "~/Library/Application Support/io.sentry",
    "~/Library/Caches/io.sentry",
    "~/Library/Containers/wiki.qaq.Sentry",
  ]
end
