class Dotctl < Formula
  desc "Developer environment orchestrator for macOS"
  homepage "https://github.com/gh-jsoares/dotctl"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_arm64"
      sha256 "d1e1e59a997c98859e55f4d11986a6a3371701247577adf599ff51157ece1a84"
    else
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_amd64"
      sha256 "e8292a0ccb97b850c39ae2b98927b7dbe7025b2f17ff5d29bb5a7f74f87e22e6"
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
