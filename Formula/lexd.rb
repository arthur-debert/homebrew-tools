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
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.16.0/lexd-aarch64-apple-darwin.tar.gz"
      sha256 "9a6081209890781a4ef3539d8b1c54fa23c322e5dfbf71a5d99487d1ae144d73"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lex-fmt/lex/releases/download/v0.16.0/lexd-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c70dea4c4b9a75c7832731b22eb8800fa971b13c05e51114cde6325f3fd98a1"
    end
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.16.0/lexd-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "727587d7604896365d658c8c7c90a6720d389ba617161966d1b7620b008cfebb"
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
