class Dodot < Formula
  desc "A dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.6.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/dodot/releases/download/v5.6.0/dodot-aarch64-apple-darwin.tar.gz"
    sha256 "2b10bbf6f7bee0847e5b9b3be6996d3c899ab525b6a4068c992a57fefa9eecc1"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.6.0/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b3982e1d74cc3e1e282ddd3f7b19616950cc15a0e741cb67356d3cdedd20031"
    end
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.6.0/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80572b4c34b17317e459ac6115b1afa9b517a00622f796c865d56e93b14515ba"
    end
  end

  def install
    bin.install "dodot"
  end
end
