class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.10.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.10.0/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "18710cc44932addc73376d45470b5fc25d6c63344290ec82a2105699884b2640"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.10.0/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1025f28424d3a2266138b23f78dcd79dff0a2e7688d541057817da19b8917ae2"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.10.0/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b915a85fd47f6f9764ac51ec14f81d5c5fe0513c64db024e5ebb8c800ff9d2cd"
    end
  end

  def install
    bin.install "dodot"
  end
end
