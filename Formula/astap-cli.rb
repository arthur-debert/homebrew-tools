class AstapCli < Formula
  desc "ASTAP command-line astrometric solver"
  homepage "https://www.hnsky.org/astap.htm"
  url "https://downloads.sourceforge.net/project/astap-program/macOS%20installer/astap_command-line_version_macOS_M1.zip"
  version "2026.09.01"
  sha256 "6a59b61c3b9fac987ab5b8241cbd4bffacc05816f58097f52ad1e6bd733cbc45"
  license "MPL-2.0"
  revision 1

  depends_on :macos

  on_macos do
    on_intel do
      url "https://downloads.sourceforge.net/project/astap-program/macOS%20installer/astap_command-line_version_macOS_x86_64.zip"
      sha256 "3cc08ef3f823dd02bcbde2a0b8247db2f24607777e63adaea0a4fe578f6db343"
    end
  end

  def install
    chmod 0755, "astap_cli"
    libexec.install "astap_cli"
    system "/usr/bin/codesign", "--force", "--sign", "-", libexec/"astap_cli"
    (bin/"astap_cli").write <<~SH
      #!/bin/sh
      for argument in "$@"; do
        if [ "$argument" = "-d" ]; then
          exec "#{opt_libexec}/astap_cli" "$@"
        fi
      done
      database="#{HOMEBREW_PREFIX}/share/astap/d80"
      if [ -r "$database/d80_0101.1476" ]; then
        set -- -d "$database" "$@"
      fi
      exec "#{opt_libexec}/astap_cli" "$@"
    SH
    bin.install_symlink "astap_cli" => "astap-cli"
  end

  def caveats
    <<~EOS
      Plate solving requires a separate ASTAP star database:
        brew install arthur-debert/tools/astap-d80
      The launcher uses Homebrew's D80 automatically when installed.
      In PixInsight, select the stable executable path:
        #{HOMEBREW_PREFIX}/bin/astap_cli
      To use another database, pass -d /path/to/database.
    EOS
  end

  test do
    system "/usr/bin/codesign", "--verify", libexec/"astap_cli"
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

    custom_database = testpath/"custom-database"
    custom_database.mkpath
    output = shell_output("#{bin}/astap_cli -f #{testpath}/stars.fits -d #{custom_database}", 1)
    assert_match "no star database found at #{custom_database}/", output

    if (HOMEBREW_PREFIX/"share/astap/d80/d80_0101.1476").readable?
      output = shell_output("#{bin}/astap_cli -f #{testpath}/stars.fits -fov 1 -r 0.1 -o #{testpath}/solve -log", 1)
      assert_match "Using star database D80", output
      assert_path_exists testpath/"solve.ini"
      refute_match "No star database found", (testpath/"solve.ini").read
    end
  end
end
