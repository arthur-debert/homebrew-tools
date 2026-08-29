class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the same file"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.23.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/rustloc/releases/download/v0.23.0/rustloc-aarch64-apple-darwin.tar.gz"
    sha256 "cf6b4612b7e30572a0ee734218c5b4a618900e06d01b9f1e1d5863e2abb81771"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.23.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f9b155bcca21abecb265c42b934bcc0e638d82c16513071a3780e832f13d61b"
    end
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.23.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8c0fea6002920d096ae5084eede54aca4bb55bd688fc0d824587f642de50afc"
    end
  end

  def install
    bin.install "rustloc"
  end
end
