# This file is generated on every release by the arthur-debert/release
# rust-cli.yml workflow. DO NOT EDIT by hand — your changes will be
# overwritten on the next tag.
#
# Placeholders are of the form {{NAME}} and substituted by the release
# workflow via scripts/render-brew-formula.py. The generated output is
# pushed to the tap repo (HOMEBREW_TAP).
#
# Layout: macOS arm64 only (no on_intel under on_macos),
# Linux x86_64 + aarch64. Add an on_intel block under on_macos and an
# extra URL/SHA pair if a project needs Intel-mac.
# Add `on_arm` under on_linux for aarch64-musl, etc.

class Lexd < Formula
  desc "Command-line interface for the lex format"
  homepage "https://github.com/lex-fmt/lex"
  version "0.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.19.1/lexd-aarch64-apple-darwin.tar.gz"
      sha256 "1fe356fb27bb49b610cb7ca2592d15fdcbae3cef451460e0a1763d59cadd04b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lex-fmt/lex/releases/download/v0.19.1/lexd-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8d623b7439a984ce5963ea039d3c52daa5d601447bbc3012f3adab592f33e9a"
    end
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.19.1/lexd-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "456f2f645ba5f5a215eb7b865c23d31230255675b17cc961862cd3b176a2c358"
    end
  end

  def install
    # The tarball layout is <bin_name>/<bin_name> (subdir). Older
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
