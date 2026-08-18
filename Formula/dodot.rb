class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.8.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.8.0/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "021da1b7633d8d957e625b4ce896dcc28254667cc0ef38fc4f1ccf21c28fe138"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.8.0/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aebf6cfa5b8cc837a59a52bf2afdc888d8aa01d0d4711998f02c657c84b62995"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.8.0/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2af09dc29e1b6f1668277cea17010f75fb2ae6905d91c9b9f8c0fbbd1b66a406"
    end
  end

  def install
    bin.install "dodot"
  end
end
