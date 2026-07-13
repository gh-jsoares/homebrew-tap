class Grimoire < Formula
  desc "Terminal cheatsheet viewer"
  homepage "https://github.com/gh-jsoares/grimoire"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gh-jsoares/grimoire/releases/download/v#{version}/grimoire_darwin_arm64.tar.gz"
      sha256 "4a9bd3547d1ce33e2cf8bbfb63e49d5460de7a56906f43af19f2c403576cbaa9"
    else
      url "https://github.com/gh-jsoares/grimoire/releases/download/v#{version}/grimoire_darwin_amd64.tar.gz"
      sha256 "ad3b2386b2e268b08b2d7d229c214eb0c8bd136e2781adcc1e0ccb35968c7ff9"
    end
  end

  def install
    bin.install "grimoire"
    man1.install "grimoire.1"
  end

  test do
    assert_match "grimoire", shell_output("#{bin}/grimoire --version")
  end
end
