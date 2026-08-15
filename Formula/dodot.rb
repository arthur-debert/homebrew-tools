class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.5.1"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.5.1/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "6ef1f18002ad1e3639424ff89ab68f44f4ddf22f6ea37220bf6a1e786a311aae"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.5.1/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a8dd5f9643ff7ec31d4376be66183b6f29d636c7dca8c25816d0f062abc17a8"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.5.1/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71286ab49860d75c71a418d697f267e7c6316b3993166e3842bf38a16dd368a3"
    end
  end

  def install
    bin.install "dodot"
  end
end
