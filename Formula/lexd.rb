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
  version "0.18.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.18.1/lexd-aarch64-apple-darwin.tar.gz"
      sha256 "29f627191313bc53177af83747ad8d8c153ef5449c91db81ea3c0ef12ce14fee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lex-fmt/lex/releases/download/v0.18.1/lexd-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef1534132ae56ce8ae40075dc82d516eb39f88832c44d5e2880fa8ac6267da64"
    end
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.18.1/lexd-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec09f679020c1dfcca040f754132257677635f58b9e2c73a2e38e82e8a0ae4c7"
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
