class Padz < Formula
  desc "An ergonomic, context-aware scratch pad for the terminal — a good Unix citizen"
  homepage "https://github.com/arthur-debert/padz"
  version "1.9.0"
  license "MIT"

  on_macos do
    url "https://github.com/arthur-debert/padz/releases/download/v1.9.0/padz-aarch64-apple-darwin.tar.gz"
    sha256 "2195b6d051a144a5788be9983256b603797b23c0179ca11fe68f4ca23579d6f6"
  end

  on_linux do
    on_arm do
      url "https://github.com/arthur-debert/padz/releases/download/v1.9.0/padz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7781f83ab6e32acf301e6dc0bbb97e42e6210f4716c919f8c7d2a4b1d171ecb7"
    end
    on_intel do
      url "https://github.com/arthur-debert/padz/releases/download/v1.9.0/padz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6671281fc6c9a52972d253cf100a3f474bce042fcba6d45a9356336d0c1fb908"
    end
  end

  def install
    bin.install "padz"
  end
end
