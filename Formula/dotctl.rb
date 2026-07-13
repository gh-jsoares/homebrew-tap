class Dotctl < Formula
  desc "Developer environment orchestrator for macOS"
  homepage "https://github.com/gh-jsoares/dotctl"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_arm64"
      sha256 "3943ad197a3e4446d54ddaf139574522e9d1610aec5a5f5bfa6f2dda08ef783a"
    else
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_amd64"
      sha256 "ca2479db5eb9ee125d1d9e06c05585d9961b0d578dd0b4f2060567957f762d8f"
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
