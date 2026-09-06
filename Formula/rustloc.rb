class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the same file"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.27.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/rustloc/releases/download/v0.27.0/rustloc-aarch64-apple-darwin.tar.gz"
    sha256 "fc27f176c2dcc1731452e72fde1b18b76d629a72e784ea926134721d7c9a52fc"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.27.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b5d6e562d12a11e94c897447a5dda3816da033c4a9391859d196c8715bd8580"
    end
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.27.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "212a849b3cc4bc65890f87b742fcdd61349089fc8e2ac7c4d0eff3477b88a1b8"
    end
  end

  def install
    bin.install "rustloc"
  end
end
