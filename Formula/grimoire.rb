class Grimoire < Formula
  desc "Terminal cheatsheet viewer"
  homepage "https://github.com/gh-jsoares/grimoire"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gh-jsoares/grimoire/releases/download/v#{version}/grimoire_darwin_arm64.tar.gz"
      sha256 "473972cc301dc6849bfe8fba7f2261bbc0ee1c194f30851c06a4b640926e1ec1"
    else
      url "https://github.com/gh-jsoares/grimoire/releases/download/v#{version}/grimoire_darwin_amd64.tar.gz"
      sha256 "79b353dd0144079d6d44abde3f0d1143bd561beb40f98db44889d0b7f0eac2b6"
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
