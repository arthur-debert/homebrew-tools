class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.7.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.7.0/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "1411c091b7b1f6f14826f3b99f7ac288842ef42289e85020cf3d834639c934d3"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.7.0/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "deab9a032e54d0ae13840a10cf94664b8cc3428a0bea608220d7c6a3ad0f4c5c"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.7.0/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d7f5734905ebdaa5754483e5b486942816d5ab3846550844ed29f06cd271653"
    end
  end

  def install
    bin.install "dodot"
  end
end
