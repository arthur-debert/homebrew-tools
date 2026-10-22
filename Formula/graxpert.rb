class Graxpert < Formula
  desc "Background extraction and denoising for astrophotography"
  homepage "https://github.com/Dark-Matters-Astro/GraXpert"
  url "https://github.com/Dark-Matters-Astro/GraXpert/releases/download/4.0.0/GraXpert-macos-arm64.dmg", using: :nounzip
  sha256 "9fedfd8e446cc25818fc3715675437a9d6e747d4f1da626f521a31a3d97b36b2"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/arthur-debert/homebrew-tools/releases/download/graxpert-4.0.0"
    rebuild 1
    sha256 cellar: "/opt/homebrew/Cellar", arm64_tahoe: "0845181784cbaa78f8a352a52aa606b4ddc298716de605fbfde02b3a627192a3"
  end

  depends_on "sevenzip" => :build
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/Dark-Matters-Astro/GraXpert/releases/download/4.0.0/GraXpert-macos-x86_64.dmg", using: :nounzip
      sha256 "fcb2c34b8a0fbb6abe5551fbb3ab3ecb60bae9a0f8ff1549572c0ef2ea33fc75"
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
