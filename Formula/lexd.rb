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
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.18.0/lexd-aarch64-apple-darwin.tar.gz"
      sha256 "5f1db4e759e1471d542ab76cc1cc4498f9b205ac6b7a7199b14ddc23ade363a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lex-fmt/lex/releases/download/v0.18.0/lexd-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d0d52bb83a9261db66fca25d62468cff2dea8ac1050c5dd869b1536717dc611"
    end
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.18.0/lexd-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c45b997ce871aa2c62b917121344d7b6c422a928439f5747c37c1559a4ce894b"
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
