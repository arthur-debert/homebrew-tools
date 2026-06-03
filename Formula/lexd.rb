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


class Lexd < Formula
  desc "Command-line interface for the lex format"
  homepage "https://github.com/lex-fmt/lex"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.17.0/lexd-aarch64-apple-darwin.tar.gz"
      sha256 "2367f4f22f4412faed26ab4c6277409a9e8bca0dd7063b5fb6c485e15c510cca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lex-fmt/lex/releases/download/v0.17.0/lexd-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91f5aecac5dc064be2b928a910910aa2200dd8ee83b38c2b57962a327be15742"
    end
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.17.0/lexd-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b9ca4319ed450176608f0e830ab859d9b0672d183e5128aab9914e0c3cf2710"
    end
  end

  def install
    # Canonical tarball layout is <bin_name>/<bin_name> (subdir). Older
    # tarballs may be flat-at-root; the Dir glob covers both shapes so
    # consumers can migrate without breaking installs in flight.
    executable = Dir["*/lexd"].find { |path| File.file?(path) } ||
                 (File.exist?("lexd") ? "lexd" : nil)
    raise "Could not find lexd in extracted archive" unless executable

    bin.install executable
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lexd --version")
  end
end
