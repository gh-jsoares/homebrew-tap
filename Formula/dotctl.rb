class Dotctl < Formula
  desc "Developer environment orchestrator for macOS"
  homepage "https://github.com/gh-jsoares/dotctl"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_arm64.tar.gz"
      sha256 "798ae0ad18a299ef03a926808a7ff74e766304a0053a97f5156818c55b9b0cd0"
    else
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_amd64.tar.gz"
      sha256 "4d23e8530ac7064a995ac254683affcacf389b04a5b763fe89568724a2d5433b"
    end
  end

  def install
    binary = Hardware::CPU.arm? ? "dotctl_darwin_arm64" : "dotctl_darwin_amd64"
    bin.install binary => "dotctl"
    man1.install Dir["man/*.1"]
  end

  test do
    assert_match "dotctl", shell_output("#{bin}/dotctl version")
  end
end
