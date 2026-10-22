class AstapCli < Formula
  desc "ASTAP command-line astrometric solver"
  homepage "https://www.hnsky.org/astap.htm"
  version "2025.07.14"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/arthur-debert/homebrew-tools/releases/download/astap-cli-2025.07.14"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "05ad4ff6bae5605546afddb34bbe10ee68e141030cf66b8d692e6d0e56f0f209"
  end

  depends_on :macos

  on_macos do
    on_arm do
      url "https://downloads.sourceforge.net/project/astap-program/macOS%20installer/older/astap_command-line_version_macOS_M1%20v2025.07.16.zip"
      sha256 "4f1ea92ff87af7948a44fe9fcfd87b5c48b3113fb6eded8d95636d35b7b8830e"
    end
    on_intel do
      url "https://downloads.sourceforge.net/project/astap-program/macOS%20installer/older/astap_command-line_version_macOS_x86_64%20v2025.07.16.zip"
      sha256 "09fee8a93fd5d3b54877474af183e6a26d060aa200e7a848d1dc5072c53497bc"
    end
  end

  def install
    chmod 0755, "astap_cli"
    bin.install "astap_cli"
    system "/usr/bin/codesign", "--force", "--sign", "-", bin/"astap_cli"
    bin.install_symlink "astap_cli" => "astap-cli"
  end

  def caveats
    <<~EOS
      Plate solving requires a separate ASTAP star database:
        https://www.hnsky.org/astap.htm
      Pass its directory with astap_cli -d /path/to/database.
      The upstream macOS database installer uses /usr/local/opt/astap.
    EOS
  end

  test do
    assert_match "CLI-#{version}", shell_output("#{bin}/astap_cli -h")

    # A FITS image containing 64 Gaussian stars exercises detection without a database.
    cards = ["SIMPLE  =                    T", "BITPIX  =                  -32",
             "NAXIS   =                    2", "NAXIS1  =                  256",
             "NAXIS2  =                  256", "END"]
    header = cards.map { |card| card.ljust(80) }.join.ljust(2880)
    pixels = Array.new(256 * 256) do |index|
      x = ((index % 256) % 32) - 16
      y = ((index / 256) % 32) - 16
      100 + (5000 * Math.exp(-((x * x) + (y * y)) / 8.0))
    end.pack("g*")
    (testpath/"stars.fits").binwrite(header + pixels + ("\0" * ((-pixels.bytesize) % 2880)))
    output = shell_output("#{bin}/astap_cli -f #{testpath}/stars.fits -analyse 10")
    assert_match "STARS=64", output
    assert_match "HFD_MEDIAN=5.0", output
  end
end
