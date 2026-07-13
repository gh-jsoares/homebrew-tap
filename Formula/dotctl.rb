class Dotctl < Formula
  desc "Developer environment orchestrator for macOS"
  homepage "https://github.com/gh-jsoares/dotctl"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_arm64"
      sha256 "aaae295868b7b9c0c1e218325e7b2b5895fc7d8b13bce1cfcba37d4e0148c1a6"
    else
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_amd64"
      sha256 "028d962ba25795b17e304ba4dd835cedf2ea7b141afc1dcfd6059d8249093af8"
    end
  end

  def install
    binary = Hardware::CPU.arm? ? "dotctl_darwin_arm64" : "dotctl_darwin_amd64"
    bin.install binary => "dotctl"
  end

  test do
    assert_match "dotctl", shell_output("#{bin}/dotctl version")
  end
end
