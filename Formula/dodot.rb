class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.3.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.3.0/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "4cfc404858f79a825a0347fe3c464c0de74994a0a63bd86d7588340ba3cc827b"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.3.0/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ac5d4185a3145e68b12b13ea89ba46f2bcc42a48417b3ed142400746e531134"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.3.0/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e001a6a4a614f7ab2cda700ac7971b41e1ef2d51cb6ec7ba51e021ba1d73391b"
    end
  end

  def install
    bin.install "dodot"
  end
end
