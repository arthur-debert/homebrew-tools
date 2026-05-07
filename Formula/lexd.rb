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
  version "0.10.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.10.5/lexd-aarch64-apple-darwin.tar.gz"
      sha256 "0e7169e17715643878d0074ec82ec899f964818c854afffe065dbb51cc538f8c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lex-fmt/lex/releases/download/v0.10.5/lexd-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7192f8196b7cb78cd6aebbbc791b5c19553c0b3d2f1bf3a66cfb5f0895c38674"
    end
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.10.5/lexd-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "559ee5d0a1c0cd2e400323da1ae34470dd9fd5b49f42b72c36c501b715b03dfb"
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
