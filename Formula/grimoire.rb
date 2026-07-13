class Grimoire < Formula
  desc "Terminal cheatsheet viewer"
  homepage "https://github.com/gh-jsoares/grimoire"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gh-jsoares/grimoire/releases/download/v#{version}/grimoire_darwin_arm64"
      sha256 "3af1eb5e529a85d4911080194de08abcd0f8369efa9234583c159cdb9c02c69a"
    else
      url "https://github.com/gh-jsoares/grimoire/releases/download/v#{version}/grimoire_darwin_amd64"
      sha256 "e514dbfe685effcb103dd0215beca660698af830ed75918512129869cfacfca4"
    end
  end

  def install
    binary = Hardware::CPU.arm? ? "grimoire_darwin_arm64" : "grimoire_darwin_amd64"
    bin.install binary => "grimoire"
  end

  test do
    assert_match "grimoire", shell_output("#{bin}/grimoire --version")
  end
end
