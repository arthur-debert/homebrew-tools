class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the same file"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.22.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/rustloc/releases/download/v0.22.0/rustloc-aarch64-apple-darwin.tar.gz"
    sha256 "a68d8e03d56cd894127daa80c114f5c285eae1f614011496d9add7d9d6a5ad45"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.22.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "36092b6c908f55294f42cd529e3c27f754d00d68ef8a03ebf8884c86a4df9ede"
    end
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.22.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb9dcb564dd5ad58e8603b3b1ae66ec3ef7e5828fdd301c1ba4f0d7b37774d00"
    end
  end

  def install
    bin.install "rustloc"
  end
end
