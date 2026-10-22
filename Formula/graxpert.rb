class Graxpert < Formula
  desc "Background extraction and denoising for astrophotography"
  homepage "https://github.com/Dark-Matters-Astro/GraXpert"
  version "4.0.0.rc1"
  license "GPL-3.0-only"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/Dark-Matters-Astro/GraXpert/releases/download/4.0.0.rc1/GraXpert-macos-arm64.dmg"
      sha256 "bba1dbcbd20782b5af8483d3536bfd9e7fc5ed2873e66bc1949271d1a982cfd8"
    end
    on_intel do
      url "https://github.com/Dark-Matters-Astro/GraXpert/releases/download/4.0.0.rc1/GraXpert-macos-x86_64.dmg"
      sha256 "5a845da864dcdf54fcd4d7148f2834df131046e04d2aa95f21a4b95b963870b8"
    end
  end

  def install
    prefix.install "GraXpert.app"
    bin.write_exec_script prefix/"GraXpert.app/Contents/MacOS/GraXpert"
    bin.install_symlink "GraXpert" => "graxpert"
  end

  def caveats
    <<~EOS
      Run graxpert to open the GUI, or graxpert --help for CLI options.
      AI models are downloaded by GraXpert on first use.
      To open the app from Finder, link it into ~/Applications:
        ln -s #{opt_prefix}/GraXpert.app ~/Applications/GraXpert.app
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/graxpert --version 2>&1")
  end
end
