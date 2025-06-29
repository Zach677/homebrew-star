cask "whatcopied" do
  version "1.1.0"
  sha256 "da559325e0e2117330a712136ece6e6c2ae655c4863499612be76e645bf6844f"

  url "https://github.com/WhatCopied-app/WhatCopied/releases/download/v#{version}/WhatCopied-#{version}.dmg"
  name "WhatCopied"
  desc "The ultimate pasteboard debugger for macOS developers."
  homepage "https://github.com/WhatCopied-app/WhatCopied"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "WhatCopied.app"

  # zap trash: [
  #   "~/Library/Application Scripts/wiki.qaq.NotchDrop",
  #   "~/Library/Containers/wiki.qaq.NotchDrop",
  # ]
end
