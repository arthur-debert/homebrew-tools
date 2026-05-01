# This file is generated on every release by the arthur-debert/release
# rust-cli.yml workflow. DO NOT EDIT by hand — your changes will be
# overwritten on the next tag.
#
# Placeholders are of the form {{NAME}} and substituted by the release
# workflow via scripts/render-brew-formula.py. The generated output is
# pushed to the tap repo (HOMEBREW_TAP).
#
# Canonical layout: macOS arm64 only (no on_intel under on_macos),
# Linux x86_64 + aarch64. Add an on_intel block under on_macos and an
# extra URL/SHA pair if a project needs Intel-mac.
# Add `on_arm` under on_linux for aarch64-musl, etc.

class Burgertocow < Formula
  desc "CLI for burgertocow: reverse-engineers diffs on rendered minijinja templates"
  homepage "https://github.com/arthur-debert/burgertocow"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/burgertocow/releases/download/v0.3.1/burgertocow-aarch64-apple-darwin.tar.gz"
      sha256 "c503fa8e8fd94c6a6b98b36faa12661ced604540ff0340d270a94ba7792bb029"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/burgertocow/releases/download/v0.3.1/burgertocow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51399bc744d779c969ad6a70d5e83486024184605e85d406f6e869657394d68e"
    end
    on_arm do
      url "https://github.com/arthur-debert/burgertocow/releases/download/v0.3.1/burgertocow-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6314c8baf323e9f147f22f5685175251f900c9eb9e5b22ed25cabd2e0b10132"
    end
  end

  def install
    # Canonical tarball layout is <bin_name>/<bin_name> (subdir). Older
    # tarballs may be flat-at-root; the Dir glob covers both shapes so
    # consumers can migrate without breaking installs in flight.
    executable = Dir["*/burgertocow"].find { |path| File.file?(path) } ||
                 (File.exist?("burgertocow") ? "burgertocow" : nil)
    raise "Could not find burgertocow in extracted archive" unless executable

    bin.install executable
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/burgertocow --version")
  end
end
