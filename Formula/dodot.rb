class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.3.1"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.3.1/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "63f482b2c147a270d46abfe2125ac7a316cc414656c0f6976e4b96ea9c7d84cb"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.3.1/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8947a199c55267a859f3f8b5eeef8da9ecdb59cd1f65b0a1c9c7d38e9dd72c6d"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.3.1/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8baa063e7214c37bc3b9faff9478672105842c4cfbdb47201da8a9b5192d5dd0"
    end
  end

  def install
    bin.install "dodot"
  end
end
