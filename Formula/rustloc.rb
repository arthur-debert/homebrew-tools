class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the same file"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.21.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/rustloc/releases/download/v0.21.0/rustloc-aarch64-apple-darwin.tar.gz"
    sha256 "d09be0fa0214d1a7c9279ed6386d137558f32d2e28b63ff5bdae5c14db00bf97"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.21.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0aff5cf8247dcdf8a1edf7bb82ca38f7d9be78b1316d348a6a581cd8b7af596"
    end
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.21.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aabb80f65dc07fa355f3dbefd1fe59bf850b7c4bb3e5371e08d4a626261970a1"
    end
  end

  def install
    bin.install "rustloc"
  end
end
