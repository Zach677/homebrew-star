class LookinsideCli < Formula
  desc "Command-line inspector for debuggable Apple apps"
  homepage "https://github.com/Lakr233/LookInside"
  url "https://github.com/Lakr233/LookInside/archive/refs/tags/2.0.2.tar.gz"
  sha256 "ef153f81ad143b4e609599581b415091ad169bd34fa77884972e8af7d70bfa5f"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: :big_sur
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "--product", "lookinside"
    bin.install ".build/release/lookinside"
  end

  test do
    assert_match "Inspect debuggable app targets from the command line",
                 shell_output("#{bin}/lookinside --help")
  end
end
