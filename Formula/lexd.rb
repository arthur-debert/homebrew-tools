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
  version "0.19.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.19.2/lexd-aarch64-apple-darwin.tar.gz"
      sha256 "575ed6a2814ffd9faa116f82905797c4aefe26798ac42478920b18bce4400709"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lex-fmt/lex/releases/download/v0.19.2/lexd-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ccce92867cd5353a25e937a7c4cd0ca2e622d1673a812e88c8b4737445d5df5"
    end
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.19.2/lexd-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c2fb750d8f0244126d5478c3f5925188ecdcc11b720a9c528f3cdd81a492789"
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
