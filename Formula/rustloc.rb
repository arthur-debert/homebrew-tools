class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the same file"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.26.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/rustloc/releases/download/v0.26.0/rustloc-aarch64-apple-darwin.tar.gz"
    sha256 "b5820b1ddb45b882d1e27c2a4dab36dab67ddcd39865fee3da62a0a84a882939"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.26.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffa1722f8983fe8406932a02b7a0c632b711f710326095e7757161c5a10037d1"
    end
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.26.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9da024ede01f73912f26f4fe2366af3660d1a3ed923852ca84348efa1755e871"
    end
  end

  def install
    bin.install "rustloc"
  end
end
