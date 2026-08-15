class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.5.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.5.0/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "916a33611d106c04f292eba7b080ffc6b646eba5c2e48cda61c71a6080b98424"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.5.0/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdd0e998795c27d794f1c16c832e0239c273e0e34b598d511763923eea3eae50"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.5.0/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f52c1a362e5130b7c1412dad2704a5df39c4bcb64e10e010c9c9602ca6193e2"
    end
  end

  def install
    bin.install "dodot"
  end
end
