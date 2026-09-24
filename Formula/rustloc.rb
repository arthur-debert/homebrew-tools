class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the same file"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.29.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/rustloc/releases/download/v0.29.0/rustloc-aarch64-apple-darwin.tar.gz"
    sha256 "f358e94a748d4a291bca1c0dad71bde02370133c9432a1be1baf5958c4fbb406"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.29.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea8c9c67f9ccbc3b6ada2b4b2bbb4bd461e5a0a3e206c802c16eb0bf506f4acb"
    end
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.29.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51d98c4ada06719fe0715f2540b750b4dadda7e46f07caee11c2ff1e2d1c3074"
    end
  end

  def install
    bin.install "rustloc"
  end
end
