cask "whatcopied" do
  version "1.4.1"
  sha256 "9dfd8b94ca18052a40b234580ec3e397c69be157d67eb09ab0f7df06bb4ddfca"

  url "https://github.com/WhatCopied-app/WhatCopied/releases/download/v#{version}/WhatCopied-#{version}.dmg"
  name "WhatCopied"
  desc "Pasteboard debugger for developers"
  homepage "https://github.com/WhatCopied-app/WhatCopied"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "WhatCopied.app"

  zap trash: [
    "~/Library/Application Scripts/app.cyan.whatcopied",
    "~/Library/Containers/app.cyan.whatcopied",
  ]
end
