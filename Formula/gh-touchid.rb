class GhTouchid < Formula
  desc "Touch ID-gated GitHub credentials for gh and Git"
  homepage "https://github.com/GeorgeLubaretsi/gh-touchid"
  url "https://github.com/GeorgeLubaretsi/gh-touchid/releases/download/v0.3.0/gh-touchid-0.3.0-macos.tar.gz"
  sha256 "ae0762db50b176baba1a4a2737d1f03b192dff0a5cbab295c675719e402a2e6b"
  license "MIT"

  depends_on :macos
  depends_on macos: :tahoe

  conflicts_with "gh", because: "gh-touchid installs its own `gh`, which runs gh through gh-touchid"

  def install
    bin.install "bin/gh-touchid", "bin/gh"
    # GitHub's gh, which gh-touchid finds next to its own executable and checks by SHA-256 before running it
    libexec.install "libexec/gh-touchid"
  end

  test do
    system bin/"gh-touchid", "help"
  end
end
