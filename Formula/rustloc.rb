class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the same file"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.24.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/rustloc/releases/download/v0.24.0/rustloc-aarch64-apple-darwin.tar.gz"
    sha256 "02bbf8e7deff8bf78036ad51b7a1a9c9d55299615ed1a2016273a5900b90bd27"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.24.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a7206f24c7ab7b1d5b6bc2cd1dcadc93227cd2a3931b11d64b7c1d12548d77a"
    end
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.24.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "821f2fd358d5b412ca30a4b0f7a15ce65367c528ec0e2c7eddf57e26206cf431"
    end
  end

  def install
    bin.install "rustloc"
  end
end
