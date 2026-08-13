class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.4.1"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.4.1/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "9e23ba3eef35ec6ee95d816bcead612bc7ff6558a452b657d932fa68fc305a0d"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.4.1/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e827f0c9ad54af84e5b17dc1fdf6d28fdfcd17497be2a56104afc798028b0be8"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.4.1/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63363632c429004eca799f168420ce330bc7b1bd59b7fe0bafc122bba2d28a9a"
    end
  end

  def install
    bin.install "dodot"
  end
end
