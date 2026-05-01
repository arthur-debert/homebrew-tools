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
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.9.1/lexd-aarch64-apple-darwin.tar.gz"
      sha256 "f71cb9e7c37ee5b9ac89c638f52195f5b6613471315aee6fb943553bfeeac3e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lex-fmt/lex/releases/download/v0.9.1/lexd-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d0fc7c24a25b9969081c6f5a17cf410713a88134ae1f936f083bfd5f6a185fd"
    end
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.9.1/lexd-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90582a059337a89d4d31f04e49079c822b769fd5743a30ead0d852c4fb32bdd2"
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
