class AstapCli < Formula
  desc "ASTAP command-line astrometric solver"
  homepage "https://www.hnsky.org/astap.htm"
  url "https://downloads.sourceforge.net/project/astap-program/macOS%20installer/astap_command-line_version_macOS_M1.zip"
  version "2026.09.01"
  sha256 "6a59b61c3b9fac987ab5b8241cbd4bffacc05816f58097f52ad1e6bd733cbc45"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/arthur-debert/homebrew-tools/releases/download/astap-cli-2026.09.01"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "dd903a7f783d0f428cd1ae8c62443ac1fc441988b0e30ce86c5aac7b115abc0f"
  end

  depends_on :macos

  on_macos do
    on_intel do
      url "https://downloads.sourceforge.net/project/astap-program/macOS%20installer/astap_command-line_version_macOS_x86_64.zip"
      sha256 "3cc08ef3f823dd02bcbde2a0b8247db2f24607777e63adaea0a4fe578f6db343"
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
