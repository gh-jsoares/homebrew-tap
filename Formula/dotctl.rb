class Dotctl < Formula
  desc "Developer environment orchestrator for macOS"
  homepage "https://github.com/gh-jsoares/dotctl"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_arm64"
      sha256 "143f489ca324beb563cad3880e24f7a2b193278ad35c17bbd39e01b07d4bd12e"
    else
      url "https://github.com/gh-jsoares/dotctl/releases/download/v#{version}/dotctl_darwin_amd64"
      sha256 "9f524649b3e222781a392aebbfb2a5eddc616802fbf801cf98eeb5d6e53aa2e1"
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
