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
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.12.0/lexd-aarch64-apple-darwin.tar.gz"
      sha256 "a2feea1d7edcdff7e456715a72d85256f797d1e81b64e041d006fee38f074e4f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lex-fmt/lex/releases/download/v0.12.0/lexd-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e53a0cce835321efa8c70318519471ca7a16c247e83e45cb569dc07ecaff9cfe"
    end
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.12.0/lexd-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c94e5036845d6e7522c197efc6487f4a2ba7d9d4a0c162661f1e22971550aa2b"
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
