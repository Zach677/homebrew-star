cask "sentry" do
  version "1.2.9"
  sha256 "f4924226bddd89256c86cc03704c9b9869d76c67490676370a87fda7cb258987"

  url "https://github.com/Lakr233/Sentry/releases/download/#{version}/Sentry-v#{version}.zip"
  name "Sentry"
  desc "A powerful security monitoring application that detects unauthorized access attempts and records video evidence for you."
  homepage "https://github.com/Lakr233/Sentry"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Sentry.app"

  # zap trash: []
end
