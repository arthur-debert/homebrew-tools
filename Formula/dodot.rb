class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.9.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.9.0/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "62812198a8e0702a73007724653bf501b742daed04220b8bf9e3b4da02bd2644"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.9.0/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5b1bed60154f6b70bb6bcf17b619b26bbf02c290ef0b5ad001d6ff700775e8c"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.9.0/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fec301e115c416b2e042b9dfab7ed2e1a980464526439b68b7615afb42b11ce6"
    end
  end

  def install
    bin.install "dodot"
  end
end
