class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the same file"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.25.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/rustloc/releases/download/v0.25.0/rustloc-aarch64-apple-darwin.tar.gz"
    sha256 "bee4d4dd0a962f9768f40ff140dc173acc1ecc9fb855c343e00796f1b67f140d"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.25.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e4fed060e76dfcf9706b66a3cac169980bb20f02d5f4e060ecd5b167a32c0762"
    end
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.25.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec6ed7def4f59ddba474c4044d8360a7fc6d074342fbf399edba747779ebc6d9"
    end
  end

  def install
    bin.install "rustloc"
  end
end
