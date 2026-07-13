class Dotctl < Formula
  desc "Developer environment orchestrator for macOS"
  homepage "https://github.com/gh-jsoares/dotctl"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_arm64"
      sha256 "4afb84127408b95a07d05def57100d0606bc3d7430963bc84ef6bad13a6c654c"
    else
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_amd64"
      sha256 "c5c71bd859782fa1d929989c16a1515aff8a0b0759ced92203bc06a1369b59f9"
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
