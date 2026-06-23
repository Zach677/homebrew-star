cask "whatcopied" do
  version "1.4.0"
  sha256 "b831ba54d59bf15fbe698c1a92e226f479677ef3a16894b508761c5358f4465f"

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
