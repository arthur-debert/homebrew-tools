class Graxpert < Formula
  desc "Background extraction and denoising for astrophotography"
  homepage "https://github.com/Dark-Matters-Astro/GraXpert"
  version "4.0.0.rc1"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/arthur-debert/homebrew-tools/releases/download/graxpert-4.0.0.rc1"
    rebuild 1
    sha256 cellar: "/opt/homebrew/Cellar", arm64_tahoe: "9ce21629a7189a308f66e81df7ffeee2fc9fbf42c49954c5cf70dde98a9854f0"
  end

  depends_on "sevenzip" => :build
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/Dark-Matters-Astro/GraXpert/releases/download/4.0.0.rc1/GraXpert-macos-arm64.dmg", using: :nounzip
      sha256 "bba1dbcbd20782b5af8483d3536bfd9e7fc5ed2873e66bc1949271d1a982cfd8"
    end
    on_intel do
      url "https://github.com/Dark-Matters-Astro/GraXpert/releases/download/4.0.0.rc1/GraXpert-macos-x86_64.dmg", using: :nounzip
      sha256 "5a845da864dcdf54fcd4d7148f2834df131046e04d2aa95f21a4b95b963870b8"
    end
  end

  skip_clean "GraXpert.app"

  def install
    # Extract without mounting the DMG and preserve PyInstaller's relative symlink chains.
    system "7zz", "x", "-y", "-snld10", "-sns-", "-ounpacked", cached_download
    prefix.install Dir["unpacked/*/GraXpert.app"].fetch(0)
    (bin/"graxpert").write <<~SH
      #!/bin/bash
      exec "#{opt_prefix}/GraXpert.app/Contents/MacOS/GraXpert" "$@"
    SH
  end

  post_install_steps do
    # Homebrew can change bundled dylib paths after install, invalidating the app seal.
    run "/usr/bin/codesign",
        args:           ["--force", "--deep", "--sign", "-", "{{prefix}}/GraXpert.app"],
        writable_paths: ["GraXpert.app"],
        writable_base:  :prefix
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
    system "/usr/bin/codesign", "--verify", "--deep", "--strict", prefix/"GraXpert.app"
    assert_match version.to_s, shell_output("#{bin}/graxpert --version 2>&1")
  end
end
