class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.4.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.4.0/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "276a69ea9a3976b826dc76a3633b9faef11f02c5c4174945a39233e77225d734"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.4.0/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f719dc8dc8f8202403cb853b110be75f416a2a70e192c0edf1b9cb86057f5c4"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.4.0/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1a89ab659449c0ae18a5253bc9ca96ccf2408601cf48a16f48a03424e8da57f"
    end
  end

  def install
    bin.install "dodot"
  end
end
