class Dotctl < Formula
  desc "Developer environment orchestrator for macOS"
  homepage "https://github.com/gh-jsoares/dotctl"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_arm64.tar.gz"
      sha256 "5742a41610545678325ce8ba8e543603ca51a15c55b2d65153809ee9ce576025"
    else
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_amd64.tar.gz"
      sha256 "6e38d3c56dea69d204e43267259fba9dcd56cf9601d640ad3a3a8d63c9d7663c"
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
