class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the same file"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.28.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/rustloc/releases/download/v0.28.0/rustloc-aarch64-apple-darwin.tar.gz"
    sha256 "a02616448b226b9dcb5d9e7455146388ae931fa55a4d03a185c81f4d30d3a239"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.28.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "99b2475b7832470dc91a0b4a8663610ee243935b21347d2ba638b773e19d68d5"
    end
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.28.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20deb271b41ba1036df88c55fc77670f7e1cf2fc7f181e86f73c81d36759fbe8"
    end
  end

  def install
    bin.install "rustloc"
  end
end
