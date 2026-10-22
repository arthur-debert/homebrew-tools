class AstapD80 < Formula
  desc "D80 Gaia DR3 star database for ASTAP plate solving"
  homepage "https://www.hnsky.org/astap.htm"
  url "https://downloads.sourceforge.net/project/astap-program/star_databases/d80_star_database.pkg"
  version "2023.12.19"
  sha256 "f5450f8ace768a5765103af3de5ecd409589bd066d1f3fca79477020e9ff20de"
  license :cannot_represent

  depends_on :macos

  def install
    system "/usr/sbin/pkgutil", "--expand-full", cached_download, "expanded"
    payload = buildpath/"expanded/d80.pkg/Payload"
    (share/"astap/d80").install payload.glob("d80_*.1476")
    doc.install payload/"acknowledgement of databases.txt"
  end

  def caveats
    <<~EOS
      Use this database with ASTAP:
        astap_cli -f image.fits -d #{HOMEBREW_PREFIX}/share/astap/d80
      The catalog contains about 1.3 GB of data and works on Intel and Apple Silicon.
    EOS
  end

  test do
    database = share/"astap/d80"
    tiles = database.glob("d80_*.1476")
    assert_equal 1476, tiles.length
    assert_path_exists database/"d80_0101.1476"
    assert_path_exists database/"d80_3601.1476"
    tiles.each do |tile|
      header = tile.binread(110)
      assert_match(/\AGAIA DR3, density<=8000/, header)
      assert_equal 5, header.getbyte(109)
      assert_operator tile.size, :>, 110
      assert_equal 0, (tile.size - 110) % 5
    end
    assert_path_exists doc/"acknowledgement of databases.txt"
  end
end
