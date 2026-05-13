class LookinsideCli < Formula
  desc "Command-line inspector for debuggable Apple apps"
  homepage "https://github.com/LookInsideApp/LookInside"
  url "https://github.com/LookInsideApp/LookInside/releases/download/2.2.7/LookInside-2.2.7-macOS-cli.zip"
  sha256 "7d6963ea4984627d48c3aaa52628123b24099502497aabf6c1f4065099bd69b4"
  license "GPL-3.0-only"

  livecheck do
    skip "No CLI release asset is published"
  end

  disable! date: "2026-05-13", because: "CLI release assets are no longer published"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "lookinside"
  end

  test do
    assert_match "Inspect debuggable app targets from the command line",
                 shell_output("#{bin}/lookinside --help")
  end
end
