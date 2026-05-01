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

class SimpleGal < Formula
  desc "Minimal static site generator for fine art photography portfolios"
  homepage "https://github.com/arthur-debert/simple-gal"
  version "0.20.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/simple-gal/releases/download/v0.20.4/simple-gal-aarch64-apple-darwin.tar.gz"
      sha256 "0575851ed04c5f8eb09390f5f422445d8111db4811a065751a69eacdfabb8140"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/simple-gal/releases/download/v0.20.4/simple-gal-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87120f268c0b053350ebc072375d9f5bf2abe40ac33a5f07b1f201db27585e8a"
    end
    on_arm do
      url "https://github.com/arthur-debert/simple-gal/releases/download/v0.20.4/simple-gal-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43c74979baa719da5d9a6ab4b80d2b54fcc3a64f119afb28de3d4945a1801fa4"
    end
  end

  def install
    # Canonical tarball layout is <bin_name>/<bin_name> (subdir). Older
    # tarballs may be flat-at-root; the Dir glob covers both shapes so
    # consumers can migrate without breaking installs in flight.
    executable = Dir["*/simple-gal"].find { |path| File.file?(path) } ||
                 (File.exist?("simple-gal") ? "simple-gal" : nil)
    raise "Could not find simple-gal in extracted archive" unless executable

    bin.install executable
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/simple-gal --version")
  end
end
